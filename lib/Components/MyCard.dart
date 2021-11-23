import 'package:flutter/material.dart';
class MyCard extends StatelessWidget {
  Function function;
  IconData iconData;
  String name,subname;
   MyCard({this.name,this.subname,this.iconData,this.function});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.blueGrey,
      child: ListTile(
        onTap: function
        ,
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(iconData,size: 30,color: Theme.of(context).bottomAppBarColor,),
        ),
        title: Text(name,style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 15),),
        subtitle: Text(subname,style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 10),),
      ),
    );
  }
}
