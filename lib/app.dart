import 'package:app_test/chat/message_page.dart';
import 'package:app_test/contacts/contacts.dart';
import 'package:app_test/personal/personal.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

//应用页面状态实现类
class _AppState extends State<App> {
  //当前选中页的索引
  var _currentIndex = 0;
  MessagePage message;
  Contacts contacts;
  Personal me;

  /**
   * 根据不同的索引返回不同的页面
   */
  currentPage() {
    switch(_currentIndex){
      case 0:

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
