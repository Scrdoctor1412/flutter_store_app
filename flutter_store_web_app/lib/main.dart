import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_store_web_app/src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(const App());
}
