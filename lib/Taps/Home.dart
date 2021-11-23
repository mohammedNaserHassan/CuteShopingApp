import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/Components/CustomCategory.dart';
import 'package:shoping/GetX/MyProvider.dart';

class Home extends StatelessWidget {
  Home();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProvider>(
      init: MyProvider(),
      builder: (getx) => getx.banners == null
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 250,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: getx.banners.length,
                    itemBuilder: (contextt, f, index) => CachedNetworkImage(
                      imageUrl: getx.banners[f]['image'],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Categories',style: Theme.of(context).textTheme.bodyText2,),
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: getx.categories.data.data.length,
                      itemBuilder: (context,index)=>Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: CustomCategory(
                          name: getx.categories.data.data[index].name,
                          image: getx.categories.data.data[index].image,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('New Products',style: Theme.of(context).textTheme.bodyText2,),
                  ),
                  GridView.count(
                    physics: BouncingScrollPhysics(),
                    childAspectRatio: 1 / 1.6,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(
                        getx.products.length,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: getx.products[index]['image'],
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                      if (getx.products[index]['discount'] != 0)
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          color: Colors.red,
                                          child: Text(
                                            'DISCOUNT',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                .copyWith(fontSize: 8),
                                          ),
                                        )
                                    ],
                                  ),
                                  Text(
                                    getx.products[index]['name'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontSize: 13, height: 1.3),
                                  ),
                                  Row(
                                    children: [
                                      if (getx.products[index]['discount'] != 0)
                                        Text(
                                          getx.products[index]['old_price']
                                                  .toString() +
                                              '\$',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(
                                                  fontSize: 10,
                                                  height: 1.3,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.blueGrey),
                                        ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        getx.products[index]['price']
                                                .toString() +
                                            '\$',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(
                                                fontSize: 15,
                                                height: 1.3,
                                                color: Colors.blue),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                            onPressed: () {
                                              getx.getFavourites();
                                              getx.changeFavourites(getx.products[index]['id']);

                                            },
                                            icon: Icon(Icons.favorite_border),
                                          color: getx.favouries[getx.products[index]['id']]?Colors.red:Colors.grey,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )),
                  )
                ],
              ),
            ),
    );
  }
}
