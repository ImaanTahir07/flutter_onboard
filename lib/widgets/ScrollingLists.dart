import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/AppImages.dart';

class ScrollingList extends StatefulWidget {
  final int initialIndex;
  const ScrollingList({required this.initialIndex});

  @override
  State<ScrollingList> createState() => _ScrollingListState();
}

class _ScrollingListState extends State<ScrollingList> {
  late ScrollController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset == _controller.position.minScrollExtent) {
        _forwardScroll();
      } else if (_controller.offset == _controller.position.maxScrollExtent) {
        _backwardScroll();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _forwardScroll();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void _forwardScroll() {
    final startPosition = _controller.offset;
    final endPosition = _controller.position.maxScrollExtent;
    scheduleMicrotask(() {
      _controller.animateTo(startPosition == endPosition ? 0 : endPosition,
          duration: Duration(seconds: 20 + widget.initialIndex + 2),
          curve: Curves.linear);
    });
  }

  void _backwardScroll() {
    final startPosition = _controller.offset;
    final endPosition = _controller.position.minScrollExtent;
    scheduleMicrotask(() {
      _controller.animateTo(startPosition == endPosition ? 0 : endPosition,
          duration: Duration(seconds: 20 + widget.initialIndex + 2),
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Transform.rotate(
      angle: 1.92 * pi,
      child: SizedBox(
        height: height * 0.65,
        width: width * 0.6,
        child: ListView.builder(
          controller: _controller,
          itemCount: 5,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(top: 10, left: 8, right: 8),
            height: height * 0.4,
            // width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(
                      contentImages[index + widget.initialIndex],
                    ),
                    fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }
}
