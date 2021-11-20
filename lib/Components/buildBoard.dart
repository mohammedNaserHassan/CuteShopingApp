import 'package:flutter/material.dart';
class buildBoard extends StatelessWidget {
  String image,title,body;
  buildBoard({this.body,this.title,this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Image(image: AssetImage(image,),fit: BoxFit.contain,)),
        SizedBox(height: 30,),
        Center(child: Text(title,style: Theme.of(context).textTheme.bodyText2,)),
        SizedBox(height: 15,),
        Text(body,style: Theme.of(context).textTheme.bodyText1),
        SizedBox(height: 15,),
      ],
    );
  }
}
