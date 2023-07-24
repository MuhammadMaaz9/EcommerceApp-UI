import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_screen_controller.dart';

class PopularProductSlider extends StatelessWidget {
  const PopularProductSlider({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 0.28 * height,
      padding: const EdgeInsets.only(right: 10),
      child: Obx(
        () => ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 15, 10),
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(
                                controller.products[index].image))),
                  ));
            }),
      ),
    );
  }
}
