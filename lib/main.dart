
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:firstapp/item.dart';
Future<Item> getDio() async {
    final res = await Dio().get('https://jsonplaceholder.typicode.com/photos/1');
    return Item.fromJson(res.data);
  }

void main() => runApp(MaterialApp(
  home: MyApp()
));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}



class _MyAppState extends State<MyApp>{  

  Future<Item>? fetchedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: Center(
          child: Column(
            children: [
              FutureBuilder<Item>(
                future: fetchedItem,
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return SizedBox(
                      height: 500,
                      child: Text(snapshot.data?.title ?? "Default"),
                      );
                  } 
                  else if (fetchedItem == null){
                    return const Text('Click to fetch');
                  }
                  else  {return const CircularProgressIndicator();}
                },
              ),
              ElevatedButton(
                child: const Text('Fetch'),
                onPressed: () {
                  setState(() {
                    fetchedItem = getDio();
                  });
                },
              )
            ]
          )
        )
      );
  }
}



// class Screen2 extends StatefulWidget{
//   final Color Function(Color) callback;
//   final String value;
//   const Screen2({
//     Key? key,
//     required this.value,
//     required this.callback}
//   ) : super(key: key);


//   @override
//   State<StatefulWidget> createState() {
//     return _Screen2State();
//   }
// }

// class _Screen2State extends State<Screen2>{

//   void changeColor(Color color){
//     widget.callback(color);
//     Navigator.pop(context);
//   }
   
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Screen2')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(widget.value),
//               colorButton(Colors.black),
//               colorButton(Colors.blue),
//               colorButton(Colors.yellow),
//               colorButton(Colors.red),
//               colorButton(Colors.pink)
//             ],
//           )
          
//           )
//         )
//       );
//   }

//   Widget colorButton(Color color) => ElevatedButton(
//     child: Text(color.toString()),
//     onPressed: () {
//       widget.callback(color);
//       Navigator.pop(context);
//     },
//     style: ElevatedButton.styleFrom(
//       primary: color
//     ),
//   );
// }

