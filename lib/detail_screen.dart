import 'package:flutter/material.dart';
import 'package:firstapp/item.dart';

class DetailScreen  extends StatelessWidget {

  final Item? item;

  const DetailScreen({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Page'),
          centerTitle: true,
        ),
        body: Center(
          child:  Column(
            children: [
              Image.network(item?.thumbnailUrl ?? "https://via.placeholder.com/150/92c952"),
              Text(item?.id.toString() ?? "no Item id"),
              Text(item?.title.toString() ?? "No Item title")              
            ],
          )
        ), 
    );
  }
}