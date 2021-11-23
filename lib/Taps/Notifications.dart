import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shoping/GetX/MyProvider.dart';

class Favourite extends StatelessWidget {
  Favourite();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProvider>(
      init: MyProvider(),
      builder: (getx) => getx.notifications == null
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: getx.notifications.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 120,
                child: ListTile(
                 title: Text(getx.notifications[index]['title'],style: Theme.of(context).textTheme.bodyText1,),
                    subtitle: Text(getx.notifications[index]['message'],style: Theme.of(context).textTheme.bodyText2,),
                )
              ),
            ),
    );
  }
}




// Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Stack(
// alignment: AlignmentDirectional.bottomStart,
// children: [
// CachedNetworkImage(
// width: 120,
// imageUrl: getx
//     .favouritesModel.data.data[index].product.image,
// height: 200,
// fit: BoxFit.cover,
// ),
// if (getx.favouritesModel.data.data[index].product
//     .discount !=
// 0)
// Container(
// padding: EdgeInsets.all(5),
// color: Colors.red,
// child: Text(
// 'DISCOUNT',
// style: Theme.of(context)
// .textTheme
//     .bodyText2
//     .copyWith(fontSize: 8),
// ),
// )
// ],
// ),
// SizedBox(
// width: 20,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// getx.favouritesModel.data.data[index].product.name,
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// style: Theme.of(context)
// .textTheme
//     .bodyText2
//     .copyWith(fontSize: 13, height: 1.3),
// ),
// Spacer(),
// Row(
// children: [
// if (getx.favouritesModel.data.data[index].product
//     .discount !=
// 0)
// Text(
// getx.favouritesModel.data.data[index].product
//     .oldPrice
//     .toString() +
// '\$',
// overflow: TextOverflow.ellipsis,
// style: Theme.of(context)
// .textTheme
//     .bodyText2
//     .copyWith(
// fontSize: 10,
// height: 1.3,
// decoration:
// TextDecoration.lineThrough,
// color: Colors.blueGrey),
// ),
// SizedBox(
// width: 10,
// ),
// Text(
// getx.favouritesModel.data.data[index].product
//     .price
//     .toString() +
// '\$',
// overflow: TextOverflow.ellipsis,
// style: Theme.of(context)
// .textTheme
//     .bodyText2
//     .copyWith(
// fontSize: 15,
// height: 1.3,
// color: Colors.blue),
// ),
// Spacer(),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: IconButton(
// onPressed: () {
// getx.changeFavourites(getx.favouritesModel
//     .data.data[index].product.id);
// },
// icon: Icon(Icons.favorite_border),
// color: getx.favouries[getx.favouritesModel
//     .data.data[index].product.id]
// ? Colors.red
//     : Colors.grey,
// ),
// )
// ],
// )
// ],
// ),
// ),
// ],
// ),