import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  String text;
  Function function;
   CustomButton({this.text,this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: double.infinity,
        height: 70,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.orangeAccent),
          color: Colors.lightBlue
        ),
        child: Center(child: Text(text,style: Theme.of(context).textTheme.bodyText2,)),
      ),
    );
  }
}
