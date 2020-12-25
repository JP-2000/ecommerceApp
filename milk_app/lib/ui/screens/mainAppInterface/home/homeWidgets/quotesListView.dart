import 'package:flutter/material.dart';

class QuotesListView extends StatelessWidget {
  final List quotesList;
  final List images;

  const QuotesListView({Key key, this.quotesList, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            elevation: 3.0,
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );},
        separatorBuilder: (BuildContext context, int index) => SizedBox(width: 5.0,),
        itemCount: images.length,
      ),
    );
  }
}
