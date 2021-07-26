import 'package:flutter/material.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('How to: wc_flutter_share'),
          textTheme: TextTheme(button: TextStyle(color: Colors.black)),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: _shareText,
              child: Text('Share text'),
            ),
          ],
        ),
      ),
    );
  }

  void _shareText() async {
    try {
      WcFlutterShare.share(
          sharePopupTitle: 'Share', subject: 'This is subject', text: 'This is text', mimeType: 'text/plain');
    } catch (e) {
      print(e);
    }
  }
}
