import 'package:ecommerce_app_practice/components/main_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/home_screen.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
