import 'package:flutter/material.dart';
class ItemWidget extends StatelessWidget {
  String label;
  String value;
  double size;

  ItemWidget({this.label, this.value, this.size = 22});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: TextStyle(fontSize: size),
          )
        ],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor, borderRadius: BorderRadius.circular(15)),
    );
  }
}