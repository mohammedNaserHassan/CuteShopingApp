import 'package:flutter/material.dart';
class buildCategory extends StatelessWidget {
  String name,image;
  Function function;
   buildCategory({this.name,this.image,this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Image(image: NetworkImage(image),
          width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 40,)
          ,Text(name,style: Theme.of(context).textTheme.bodyText1,),
          Spacer(),
          IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed: function,)
        ],
      ),
    );
  }
}
