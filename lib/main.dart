
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:firstapp/item.dart';
import 'package:firstapp/detail_screen.dart';

Future<List<Item>> getDio() async {
    final res = await Dio().get('https://jsonplaceholder.typicode.com/photos');
    final parsed = res.data.cast<Map<String, dynamic>>();
    return parsed.map<Item>((json) => Item.fromJson(json)).toList();
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

  Future<List<Item>>? fetchedItem;
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
              FutureBuilder<List<Item>>(
                future: fetchedItem,
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white
                              ),
                              margin: const EdgeInsets.all(7), 
                              padding: const EdgeInsets.all(2),  
                              child: Text(snapshot.data?[index].title ?? "Missing data"),                       
                            ),
                            onTap: () => Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetailScreen(item: snapshot.data?[index]),
                            )),
                          );
                        },
                        
                      )
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

