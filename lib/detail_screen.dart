import 'package:flutter/material.dart';
import 'package:firstapp/item.dart';

class detail_screen  extends StatelessWidget {

  final Item? item;

  const detail_screen({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: () => Navigator.of(context).pop(),
          centerTitle: true,
        ),
        body: Center(
          child:  Column(
            children: [
              Image.network(item?.thumbnailUrl ?? "https://via.placeholder.com/150/92c952"),
              
            ],
          )
        ),
        
      ),
      
    );
  }
}