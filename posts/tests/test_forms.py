import os
import tempfile
from shutil import rmtree
from uuid import uuid1

from PIL import Image
from django.conf import settings
from django.core.cache import cache
from django.test import TestCase, Client
from django.urls import reverse

from posts.models import Post, Group, User, Follow


class FormsTests(TestCase):
    @classmethod
    def setUpClass(cls):
        """
        Creating 'FirstUser', 'First Group', and 'First post' by 'FirstUser'
        Making a client, authorised as 'FirstUser'
        MEDIA_ROOT was change for test files delete in tearDown method
        """
        super().setUpClass()
        test_form_media_root = os.path.join(settings.MEDIA_ROOT,
                                            'test_temp_files')
        try:
            os.mkdir(test_form_media_root)
        except FileExistsError:
            pass
        settings.MEDIA_ROOT = test_form_media_root
        cls.first_user = User.objects.create_user(
            username=str(uuid1()))
        cls.followed_user = User.objects.create_user(username=str(uuid1()))
        cls.authorized_client = Client()
        cls.authorized_client.force_login(cls.first_user)
        cls.first_group = Group.objects.create(
            title=str(uuid1()),
            slug='first_slug'
        )
        cls.first_post = Post.objects.create(
            text=str(uuid1()),
            author=cls.first_user,
            group=cls.first_group,
        )

    @classmethod
    def tearDownClass(cls):
        """
        Cleaning up temporary files after test
        Set MEDIA_ROOT to default back
        """
        super().tearDownClass()
        rmtree(settings.MEDIA_ROOT)
        settings.MEDIA_ROOT = os.path.join(settings.BASE_DIR, 'media')

    def test_edit_post(self):
        """
        Testing if post-edit page saves data in database
        """
        post_to_edit = self.first_user.posts.first()
        new_group = Group.objects.create(title='One more', slug='one_more')
        new_text = str(uuid1())
        self.authorized_client.post(
            reverse('post-edit', args=[self.first_user.username,
                                       post_to_edit.pk], ),
            {'text': new_text, 'group': new_group.pk, },
            follow=True)
        post_to_edit.refresh_from_db()
        self.assertEqual(post_to_edit.text, new_text,
                         'Text wasnt edited')
        self.assertEqual(post_to_edit.group, new_group,
                         'Group wasnt edited')

    def test_authorised_user_new_post(self):
        """
        Authorised user can create posts with 'new-post' page
        """
        new_post_text = str(uuid1())
        response = self.authorized_client.post(
            reverse('new-post'),
            {'text': new_post_text,
             'group': self.first_group.pk, },
            follow=True)
        matches = 0
        for post in response.context['posts']:
            if (post.text == new_post_text and
                post.group == self.first_group and
                post.author == self.first_user):
                matches += 1
        self.assertEqual(matches, 1, 'Something wrong with new-post page')

    def test_foreign_post_edit_forbidden(self):
        """
        Testing foreign post editing prohibited
        """
        post_owner = User.objects.create_user(username='post_owner')
        tested_post = Post.objects.create(
            text='Uneditable post',
            author=post_owner, )
        cashed_text = Post.objects.get(pk=tested_post.pk).text
        target_url = reverse('post', args=[tested_post.author.username,
                                           tested_post.pk])
        response = self.authorized_client.post(
            reverse('post-edit', args=[tested_post.author.username,
                                       tested_post.pk]),
            {'text': 'Trying to edit', },
            follow=True)
        self.assertRedirects(response, target_url,
                             status_code=302, target_status_code=200)
        tested_post.refresh_from_db()
        self.assertEqual(cashed_text, tested_post.text,
                         'Someone can edit foreign posts')

    def test_post_form_with_image_file(self):
        """
        Testing create a post form with a jpg image
        """
        post_text = str(uuid1())
        temp_file = tempfile.NamedTemporaryFile(
            suffix='.jpg', prefix='test_temp_image_',
            dir='test_files', delete=False)
        Image.new("RGB", (200, 200), (255, 0, 0, 0)).save(temp_file)
        input_image_size = os.path.getsize(temp_file.name)
        with open(temp_file.name, 'rb') as image:
            self.authorized_client.post(
                reverse('new-post'),
                {'text': post_text,
                 'group': self.first_group.pk,
                 'image': image},
            )
        cache.clear()  # cache for index-page set for 20 seconds
        response = self.authorized_client.get(reverse('posts'))
        matches = 0
        for post in response.context['posts']:
            try:
                if (post.image.size == input_image_size and
                        os.path.basename(temp_file.name) in post.image.name):
                    matches += 1
            except ValueError:
                pass  # post has no image
        # returned page contains right <img> tag, as recommended in task
        self.assertContains(response, '<img class="card-img"')
        # retrieving the post from database
        new_post = Post.objects.get(text__exact=post_text)
        # check if post saved in database with correct picture
        self.assertEqual(new_post.image.size, input_image_size)
        self.assertTrue(
            os.path.basename(temp_file.name) in new_post.image.name)
        # only one post in request context contains the picture
        self.assertEqual(matches, 1,
                         f'Picture attaching error: {matches} matches found')
        temp_file.close()
        os.unlink(temp_file.name)

    def test_post_form_with_txt_file_error(self):
        """
        Testing create post form with txt file
        """
        # Have some problems with solution. But it works!
        post_text = str(uuid1())
        temp_file = tempfile.NamedTemporaryFile(
            suffix='.txt', prefix='test_temp_txt_',
            dir='test_files', delete=False)
        temp_file.write(b'These are the file contents')
        temp_file.close()
        text_file = open(temp_file.name, 'rt', encoding='utf-8')
        response = self.authorized_client.post(
            reverse('new-post'),
            {'text': post_text,
             'group': self.first_group.pk,
             'image': text_file, },)
        text_file.close()
        os.unlink(temp_file.name)
        self.assertFalse(Post.objects.filter(text__exact=post_text).exists(),
                         'Post was created with txt file instead image')
        self.assertFormError(
            response, 'form', 'image',
            ['Загрузите правильное изображение. Файл, который вы загрузили, '
             'поврежден или не является изображением.'],
            msg_prefix='New-post form is valid with .txt file')
        self.assertEqual(
            response.context['form'].cleaned_data['text'], post_text,
            'Retry option is impossible. The PostForm is broken')

    def test_new_comment_create(self):
        """
        Testing is comment appears after authorised client post request on
        add-comment page
        """
        comment_text = str(uuid1())
        response = self.authorized_client.post(
            reverse('add-comment', args=[self.first_post.author.username,
                                         self.first_post.pk]),
            {'text': comment_text},
            follow=True)
        self.assertIn(
            comment_text,
            [comment.text for comment in response.context_data['comments']]
        )

    def test_following_unfollowing_buttons(self):
        """
        Checking if Follow instance created and deleted with follow and
        unfollow buttons
        """
        # Deleting current following object if exists
        Follow.objects.filter(
            author=self.followed_user, user=self.first_user).delete()
        self.authorized_client.get(
            reverse('profile-follow', args=[self.followed_user.username]))
        self.assertEqual(
            Follow.objects.filter(author=self.followed_user,
                                  user=self.first_user).count(),
            1, 'Follow button works incorrectly')
        self.authorized_client.get(
            reverse('profile-unfollow', args=[self.followed_user.username]))
        self.assertEqual(
            Follow.objects.filter(author=self.followed_user,
                                  user=self.first_user).count(),
            0, 'Unfollow button works incorrectly')


    def test_followed_authors_post_appears_in_follow_list(self):
        """
        Checking if followed author post correctly appears on follow page
        """
        tested_post = Post.objects.create(
            text=str(uuid1()), author=self.followed_user)
        Follow.objects.get_or_create(
            author=self.followed_user, user=self.first_user)
        response = self.authorized_client.get(reverse('follow_index'))
        self.assertContains(response, tested_post.text)
        Follow.objects.filter(
            author=self.followed_user,
            user=self.first_user).delete()
        response = self.authorized_client.get(reverse('follow_index'))
        self.assertNotContains(response, tested_post.text)
