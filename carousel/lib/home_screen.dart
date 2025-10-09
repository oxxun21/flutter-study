import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      int curPage = controller.page!.toInt();
      int nextPage = curPage + 1;

      if (nextPage > 4) {
        nextPage = 0;
      }

      controller.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    // 클린업
    if (timer != null) {
      timer!.cancel();
    }
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => Image.asset(
                'assets/img/image_$e.jpeg',
                fit: BoxFit.cover,
              ), // object-fit -> fit: BoxFit.~~
            )
            .toList(),

        // Image.asset('assets/img/image_1.jpeg'),
        // Image.asset('assets/img/image_2.jpeg'),
        // Image.asset('assets/img/image_3.jpeg'),
        // Image.asset('assets/img/image_4.jpeg'),
        // Image.asset('assets/img/image_5.jpeg'),
      ),
    );
  }
}
