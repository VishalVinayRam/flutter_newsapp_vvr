import 'package:http/http.dart' as http;
import 'dart:convert';
import 'article.dart';

class News
{
  List<Article> news =[];
  Future<void> getNews() async
  {
    String url = 'http://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=805e3a6c1b404db5a481418ec3cffbbb';
    var response = await http.get(Uri.parse(url));
    var jsonData =  jsonDecode(response.body);
    if(jsonData['status']=='ok')
      {
        jsonData['article'].forEach((element)
        {
          if(jsonData['utlToImage'] !=null && element['description']!=null)
            {
              Article article =  Article(
                title: element['title'],
                author: element['author'],
                  imgUrl: element['urlToImage'],
                  content: element['content'],
                  articleUrl: element['url'],
                  description: element['description']);
              news.add(article);
            }
        });
      }
  }
}

