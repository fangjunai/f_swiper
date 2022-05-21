import 'dart:async';

import 'package:flutter/material.dart';

class FSwiper extends StatefulWidget {
  final int speed;
  final List<Map<String, Function>> list;
  const FSwiper({Key? key, required this.list, this.speed = 3})
      : super(key: key);

  @override
  _FSwiperState createState() => _FSwiperState();
}

class _FSwiperState extends State<FSwiper> with SingleTickerProviderStateMixin {
  late Timer _timer;
  int _pageIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.list.length, vsync: this);
    _timer = Timer.periodic(Duration(seconds: widget.speed), (timer) {
      if (_pageIndex < widget.list.length) {
        _tabController?.animateTo(_pageIndex);
        _pageIndex++;
      } else {
        _tabController?.animateTo(0);
        _pageIndex = 1;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              TabBarView(controller: _tabController, children: items),
              TabPageSelector(
                controller: _tabController,
                indicatorSize: 6,
                color: Colors.white,
              )
            ])));
  }

  List<Widget> get items {
    List<Widget> list = [];
    for (var map in widget.list) {
      map.forEach((key, callback) {
        list.add(Container(
            alignment: Alignment.center,
            child: GestureDetector(
                child: Image.network(
                  key,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
                onTap: () => callback())));
      });
    }
    return list;
  }
}
