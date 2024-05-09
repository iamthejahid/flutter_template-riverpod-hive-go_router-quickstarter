import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String get name => '/homeScreen';
  static String get path => '/homeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
