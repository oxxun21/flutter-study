import 'package:flutter/material.dart';
import 'package:row_and_column/screen/home_screen.dart';
// 만든 컴포넌트 import 할땐 package:프로젝트명(pubspec.yaml 의 name)
// lib이 루트 폴더가 됨

void main() {
  runApp(
    MaterialApp(
        home: HomeScreen(),
    ),
  );
}


