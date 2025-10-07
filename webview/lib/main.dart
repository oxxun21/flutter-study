import 'package:flutter/material.dart';
import 'package:webview/screen/home_screen.dart';

void main() {
  // flutter 프레임워크가 실행할 준비가 될 때 까지 기다리게 함
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(home: HomeScreen()));
}
