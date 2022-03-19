import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../widget/newtile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  late bool _loading = true;
  List<Map<String, dynamic>> articles = [];

  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=805e3a6c1b404db5a481418ec3cffbbb';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          articles.add(element);
        }
      });
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    // ignore: await_only_futures
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Uvce news app", style: TextStyle(fontSize: 40)),
      ),
      //logic to build
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Hot and Sensational news",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            _loading == true
                ? Text("loading")
                : SingleChildScrollView(
                    child: ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            padding: const EdgeInsets.all(8.0),
                            child: NewsTile(
                              articleUrl: articles[index]['url'],
                              title: articles[index]['title'],
                              subtitle: articles[index]['description'],
                              imgUrl: articles[index]['urlToImage'],
                            ));
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
