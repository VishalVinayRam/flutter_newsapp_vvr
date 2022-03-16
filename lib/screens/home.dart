import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../widget/newtile.dart';
import 'models/news.dart';
import 'package:flutter/src/widgets/framework.dart';




class HomeApp extends StatefulWidget {
  const HomeApp({ Key? key }) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  late bool _loading;
  var newslist;

  void getNews() async
  {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });

  }

  @override
  void initState()
  {
    _loading = true;
    super.initState();
    getNews();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle:true,
      title: Text("Uvce news app",
      style: TextStyle(fontSize: 40)
      ),
      ),
      //logic to build 
    body: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text("Hot and sensational news",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
        ),
        Container(
          padding: EdgeInsets.only(top:1),
          child:  ListView.builder(
            itemCount: newslist.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context,int index)
        {
          return Container(
              padding: const EdgeInsets.all(8.0),
              child: NewsTile(
                articleUrl: newslist[index].articleUrl,
                title: newslist[index].title,
                subtitle: newslist[index].description,
                imgUrl: newslist[index].imgUrl,
              ));
        },
        ),
          )
      ],
    ),
      
    );
  }
}
