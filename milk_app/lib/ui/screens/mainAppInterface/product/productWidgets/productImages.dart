import 'package:carousel_pro/carousel_pro.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milk_app/ui/screens/mainAppInterface/home/homeWidgets/productsListView.dart';
import 'package:milk_app/util/data.dart';

class ProductImages extends StatefulWidget {
  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
//  static List images = Data.imagesList;
  static List images_2 = Data.imagesList3;
  int imageNumber = 0;
  @override
  Widget build(BuildContext context) {
    int index = int.parse(ProductsListView.productId) - 1;
    return Stack(
      children: <Widget>[
        _imageCarousel2(index: index)
//        _image_carousel(context)
//        _images_dots(),
      ],
    );
  }

//  Widget _images() {
//    return Container(
//      width: MediaQuery.of(context).size.width,
//      height: 300,
//      child: ListView.builder(
//        scrollDirection: Axis.horizontal,
//        itemCount: 2,
//        itemBuilder: (BuildContext context, int index) {
//          return Container(
//            width: MediaQuery.of(context).size.width,
//            child: Image.asset(
//              "assets/images/backgorund.gif"
//            ),
//          );
//        },
//      ),
//    );
//  }

//  Widget _image_carousel(BuildContext context) {
//    return CarouselSlider(
//      options: CarouselOptions(
//        aspectRatio: 16/9,
//        viewportFraction: 1.0,
//        autoPlayCurve: Curves.bounceIn,
//        enableInfiniteScroll: false,
//        reverse: true,
//        height: 300.0,
//      ),
//      items: [2,1,0].map((i) {
//        return Builder(
//          builder: (BuildContext context) {
//            return Container(
//              width: MediaQuery.of(context).size.width,
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage(images[i]),
//                  fit: BoxFit.cover
//                )
//              ),
//              child: Text('$i'),
//            );
//          }
//        );
//      }).toList(),
//    );
//  }

  Widget _imageCarousel2({int index}) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Carousel(
        images: [
          AssetImage(images_2[index][0]),
          AssetImage(images_2[index][1]),
        ],
        dotBgColor: Colors.transparent,
        autoplay: false,
        animationCurve: Curves.easeIn,

      ),
    );
  }
}
