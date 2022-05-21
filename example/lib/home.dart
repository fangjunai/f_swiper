import 'package:f_swiper/f_swiper.dart';
import 'package:f_swiper_example/detail.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //Map -> Picture URL, onTap
    List<Map<String, Function>> list = [
      {
        "https://s.alicdn.com/@img/imgextra/i2/O1CN01aBX2LK1urj81SOFzR_!!6000000006091-2-tps-968-230.png":
            () => {}
      },
      {
        "https://s.alicdn.com/@img/imgextra/i3/O1CN012JlDJ41PV3UMIeqjA_!!6000000001845-2-tps-968-230.png":
            () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Detail()),
                  )
                }
      },
      {
        "https://s.alicdn.com/@img/imgextra/i4/O1CN01lQNPo226RsAsyZvwz_!!6000000007659-2-tps-968-230.png":
            () => print("onTap => Picture3")
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('FSwiper Example App'),
      ),
      body: Container(
        height: 100,
        child: FSwiper(list: list, speed: 1),
      ),
    );
  }
}
