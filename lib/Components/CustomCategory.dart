import 'package:flutter/material.dart';
class CustomCategory extends StatelessWidget {
  String name,image;
   CustomCategory({this.name,this.image});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(image: NetworkImage(image),
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.8),
          child: Text(name,style: Theme.of(context)
              .textTheme
              .bodyText2.copyWith(fontSize: 20,color: Colors.white),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
