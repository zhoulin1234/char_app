import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: Text('demo'),
        ),
        body: new Center(
          child: new Container(
            child: Text('ssssssssssssssssssssssasd'),
            alignment: Alignment.center,
            height: 300.0,
            width: 400.0,
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 4),
            margin: const EdgeInsets.all(10),
            decoration:new BoxDecoration(
                gradient:const LinearGradient(
                    colors:[Colors.white,Colors.amber,Colors.red]
                ),
                border:Border.all(width:22.0,color:Colors.red)
            ),
          )
        ),
      ),
    );
  }
}
