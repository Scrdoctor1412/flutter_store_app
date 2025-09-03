import 'package:flutter/material.dart';
import 'package:flutter_store_app/ui/nav/home/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/homeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
          ],
        ),
      ),
    );
  }
}
