import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
late final String title,  subtitle, articleUrl;
late String imgUrl ;
double width =60,height=90;
NewsTile({required this.title, required this.subtitle, required this.imgUrl, required this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
    child:ListTile
    (title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),)
      ,
subtitle:Text(subtitle,maxLines: 2,),
leading:ClipRect(
    child: Image.network(imgUrl,width:40,height: 90,fit: BoxFit.cover,)
),
),
);
}
}