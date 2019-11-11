import 'package:flutter/material.dart';

class TouchCallBack extends StatefulWidget {
  //子组件
  final Widget child;

  //回调函数
  final VoidCallback onPressed;
  final bool isFeed;
  final Color background;

  //传入参数列表
  TouchCallBack({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.isFeed: true,
    this.background: const Color(0xffd8d8d8),
  }) : super(key: key);

  @override
  _TouchCallBackState createState() => _TouchCallBackState();
}

class _TouchCallBackState extends State<TouchCallBack> {
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: color,
        child: widget.child,
      ),
      //onTap回调
      onTap: widget.onPressed,
      onPanDown: (d) {
        if (widget.isFeed == false) return;
        setState(() {
          color = widget.background;
        });
      },
      onPanCancel: () {
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }
}
