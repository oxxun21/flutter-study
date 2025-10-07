import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {
  // controller -> 함수를 실행해서 컨트롤이 입력된 위젯을 제어할 수 있게됨
  // loadRequest 특정 url로 이동
  // 오른쪽 마우스 클릭 -> Go To -> Declaration or Usages (정의: 자세한 타입 값 확인 가능)
  // .. 을 사용함으로써 loadRequest 함수를 실행하지만 반환값은 WebViewController가 되도록 함
  // => 함수가 실행된 대상 반환
  // JavaScriptMode.unrestricted : js 활성화 (안드는 기본이 비활성화기 때문에 명시해두는게 좋음)
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUrl);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              controller.loadRequest(homeUrl);
            },
            icon: Icon(Icons.home_filled),
          ),
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
// final controller = WebViewController();
// final result = controller.loadRequest();
// === final result = WebViewController().loadRequest();

// final controller = WebViewController();
// controller.loadRequest();
// === final result = WebViewController()..loadRequest(homeUrl);
