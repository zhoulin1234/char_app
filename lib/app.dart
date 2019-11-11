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
    switch (_currentIndex) {
      case 0:
        if (message == null) {
          message = new MessagePage();
        }
        return message;
      case 1:
        if (contacts == null) {
          contacts = new Contacts();
        }
        return contacts;
      case 2:
        if (me == null) {
          me = new Personal();
        }
        return me;
      default:
    }
  }

//渲染某个菜单项，传入标题 图片路径或图表
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          imagePath != null
              ? Image.asset(imagePath, width: 32, height: 32)
              : SizedBox(
                  width: 32,
                  height: 32,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我不是微信'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                //弹出菜单
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(500, 76, 10, 0),
                  items: <PopupMenuEntry>[
                    _popupMenuItem('发起会话',
                        imagePath: 'images/icon_groupchat.png'),
                    _popupMenuItem('添加好友',
                        imagePath: 'images/icon_addfriend.png'),
                    _popupMenuItem('联系客服', icon: Icons.person)
                  ],
                );
              },
              //菜单按钮
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        items: [
          new BottomNavigationBarItem(
              title: Text('聊天',
                  style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(0xFF46c01b)
                        : Color(0xff999999),
                  )),
              icon: _currentIndex == 0
                  ? Image.asset(
                      'images/message_pressed.png',
                      width: 32,
                      height: 28,
                    )
                  : Image.asset(
                      'images/message_normal.png',
                      width: 32,
                      height: 28,
                    )),
          new BottomNavigationBarItem(
              title: Text('好友',
                  style: TextStyle(
                    color: _currentIndex == 1
                        ? Color(0xFF46c01b)
                        : Color(0xff999999),
                  )),
              icon: _currentIndex == 1
                  ? Image.asset(
                      'images/contact_list_pressed.png',
                      width: 32,
                      height: 28,
                    )
                  : Image.asset(
                      'images/contact_list_normal.png',
                      width: 32,
                      height: 28,
                    )),
          new BottomNavigationBarItem(
              title: Text('我的',
                  style: TextStyle(
                    color: _currentIndex == 2
                        ? Color(0xFF46c01b)
                        : Color(0xff999999),
                  )),
              icon: _currentIndex == 2
                  ? Image.asset(
                      'images/profile_pressed.png',
                      width: 32,
                      height: 28,
                    )
                  : Image.asset(
                      'images/profile_normal.png',
                      width: 32,
                      height: 28,
                    )),
        ],
      ),
      body: currentPage(),
    );
  }
}
