import 'package:flutter/material.dart';

import 'package:f_swiper/f_swiper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Picture URL, onTap
  List<Map<String, Function>> list = [
    {
      "https://s.alicdn.com/@img/imgextra/i2/O1CN01aBX2LK1urj81SOFzR_!!6000000006091-2-tps-968-230.png":
          () => {}
    },
    {
      "https://s.alicdn.com/@img/imgextra/i3/O1CN012JlDJ41PV3UMIeqjA_!!6000000001845-2-tps-968-230.png":
          () => print("onTap => Picture2")
    },
    {
      "https://s.alicdn.com/@img/imgextra/i4/O1CN01lQNPo226RsAsyZvwz_!!6000000007659-2-tps-968-230.png":
          () => print("onTap => Picture3")
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FSwiper Example App'),
        ),
        body: Container(
          height: 100,
          child: FSwiper(list: list),
        ),
      ),
    );
  }
}
