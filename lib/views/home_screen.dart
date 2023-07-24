import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_practice/components/popular_product.dart';
import 'package:ecommerce_app_practice/components/product_builder.dart';
import 'package:ecommerce_app_practice/components/section_title.dart';
import 'package:ecommerce_app_practice/controllers/home_screen_controller.dart';
import 'package:ecommerce_app_practice/components/main_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          //backgroundColor: Colors.black,
          body: ListView(
        children: [
          const MainHeader(),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 14 / 9,
              viewportFraction: 1,
            ),
            items: [
              Image.asset(
                'assets/1.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/2.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/3.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/4.jpg',
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(
            height: 0.03 * height,
          ),
          const SectionTitle(title: "Popular Product", value: true),
          const PopularProductSlider(),
          const SectionTitle(title: 'Products', value: false),
          const ProductBuilder(),
        ],
      )),
    );
  }
}


// ListView.builder(
//           itemCount: controller.products.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(controller.products[index].title.toString()),
//             );
//           },
//         ),
