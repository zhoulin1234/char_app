import 'package:app_test/app.dart';
import 'package:app_test/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '来聊天啊',
        theme: myDefaultTheme,
        home: new LoadingPage(),
        routes: <String, WidgetBuilder>{
          "app": (BuildContext context) => new App(),
          "/friends": (_) => new WebviewScaffold(
                url: "http://www.realcan.cn/",
                appBar: new AppBar(
                  title: Text('realcan官网'),
                ),
                withZoom: true,
                withLocalStorage: true,
              ),
        });
  }
}

//自定义主题
final ThemeData myDefaultTheme = new ThemeData(
  primaryColor: Colors.amber,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.amber,
);
