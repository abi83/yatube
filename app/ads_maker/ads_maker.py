"""
Страница, которая запрашивает адрес сайта, показывает пользователю все сайтмэпы этого сайта
При клике на сайтмэп - страница со всеми страницами этого сайтмэпа (пагинация)
Под каждой страницей пример объявления (заголовок, текст, ключи)
Кнопка <скачать csv> которая скачивает файл с названием компании = название сайтмэпа
Заголовком, текстом и ключами

"""

import requests
import bs4

class SiteMap:
    def __init__(self):
        self.url = ''

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

