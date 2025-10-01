// 모든 코드 블럭을 포함하고 있어서 항상 import
import 'package:flutter/material.dart';

// main.dart가 최상위 파일
void main() {
  // 패키지로 부터 불러와서 사용
  // runApp:플러터 앱을 실행
  runApp(
    // 여기에 화면이 들어감
    // MaterialApp(디자인)은 항상 최상위에 위치
    // runApp에 들어가는 첫번째 값은 무조건 MaterialApp
    // MaterialApp 바로 아래에는 Scaffold(기본구조 생성) 고정
    MaterialApp(
      home: Scaffold(body: Center(child: Text('text'))),
    ),
  );
}
