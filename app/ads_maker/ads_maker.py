"""
Страница, которая запрашивает адрес сайта, показывает пользователю все сайтмэпы этого сайта
При клике на сайтмэп - страница со всеми страницами этого сайтмэпа (пагинация)
Под каждой страницей пример объявления (заголовок, текст, ключи)
Кнопка <скачать csv> которая скачивает файл с названием компании = название сайтмэпа
Заголовком, текстом и ключами

"""

import requests
import bs4
from usp.tree import sitemap_tree_for_homepage
from sitemapparser import SiteMapParser



def ads_tests():
    headers = {'user-agent': 'ads_maker/0.0.1'}

    file = open('output.log', 'a')
    file.write('One more run'+'\n')
    r = requests.get('https://mediaohvat.ru/sitemap.xml', headers=headers)

    # for key in r.headers.keys():
    #     print('key: ', key)
    #     print('value: ', r.headers[key])

    soup = bs4.BeautifulSoup(r.text, features='html.parser')

    sitemap = SiteMap()

    for item in soup.find_all('loc'):
        sitemap.url = item.get_text()
        file.write(item.get_text() + '\n')

    # for i in soup.find_all('loc'):
    #     sitemaps[i] = i.get_text()
    #     file.write(sitemaps[i])

    file.write('\n' + '========================='+'\n')

    file.close()

    print('url: ', r.url)
    print('code:', r.status_code)
    print('encoding', r.encoding)

def ultimate_parser():
    site = 'https://mediaohvat.ru/'
    tree = sitemap_tree_for_homepage(site)
    print(tree.url)
    print('type(tree)', type(tree))
    print()

    print('type(tree.sub_sitemaps[0].url)', type(tree.sub_sitemaps[0].url))
    print('type(tree.sub_sitemaps)', type(tree.sub_sitemaps))
    print('len(tree.sub_sitemaps)', len(tree.sub_sitemaps))
    print('type(tree.sub_sitemaps[0])', type(tree.sub_sitemaps[0]))

    print()
    x = tree.all_pages()
    print('type(tree.all_pages()): ', type(x))
    print('len(tree.all_pages()): ', len(x))

    for one_sitemap in tree.sub_sitemaps:
        print()
        print('url: ', one_sitemap.url)
        print('type(one_sitemap.sub_sitemaps', type(one_sitemap.sub_sitemaps))
        print('len(one_sitemap.sub_sitemaps)', len(one_sitemap.sub_sitemaps))
        i = 0
        for one_page in one_sitemap.all_pages():
            i += 1
            if i < 10 or 1000 < i < 1010 or 5000 < i < 5010:
                print(f'i: {i}. one_page.url:', one_page.url)
                print(f'i: {i}. one_page.mod:', one_page.last_modified)

def main():
    site = 'https://mediaohvat.ru/'
    sm = SiteMapParser(site)
    if sm.has_sitemaps():
        for one_sitemap in sm.get_sitemaps():
            print(one_sitemap)  # returns iterator of sitemapper.Sitemap instances
    else:
        print(sm.get_urls())  # returns iterator of sitemapper.Url instances






if __name__ == '__main__':
    main()
