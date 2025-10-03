import 'package:flutter/material.dart';
import 'package:row_and_column/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 정확히 보이는 곳에 위젯을 넣을 것을 알림
      // body: SafeArea(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          height: double.infinity,
          child: Column(
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.loose, // flex-shink:0 , tight -> flex: 1 1 0 느낌
                child: Container(height: 50, width: 50, color: Colors.red),
              ),
              Expanded(
                // flex: 1 1 0 같이 동작
                flex: 1,
                child: Container(height: 50, width: 50, color: Colors.orange),
              ),
              Expanded(
                flex: 1,
                child: Container(height: 50, width: 50, color: Colors.yellow),
              ),
            ],
          ),
          // width: double.infinity,
          // -> double.infinity: 100% 를 의미하는듯
          // height: double.infinity,
          // color: Colors.blue,
          // child:
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.max,
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: colors
          //       .map((e) => Container(height: 50, width: 50, color: e))
          //       .toList(),
          //   // [
          //   // Do Not Repeat Yourself - DRY
          //   // Container(height: 50, width: 50, color: Colors.red),
          //   // Container(height: 50, width: 50, color: Colors.orange),
          //   // Container(height: 50, width: 50, color: Colors.yellow),
          //   // ],
          // ),
        ),
      ),
    );
  }
}
