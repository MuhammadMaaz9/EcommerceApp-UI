import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_practice/components/bottom_pop_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/home_screen_controller.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 370,
          childAspectRatio: 2 / 4,
          crossAxisSpacing: 0.04 * width,
          mainAxisSpacing: 0.03 * height,
        ),
        physics: ScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0))),
                context: context,
                builder: (context) {
                  return BottomPopScreen(
                    rating: controller.products[index].rating.rate.toString(),
                    image: controller.products[index].image,
                    products: controller.products[index].description.toString(),
                  );
                },
              );
            },
            child: Material(
              elevation: 8,
              shadowColor: Colors.grey.shade300,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 5,
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: controller.products[index].image,
                            placeholder: (context, url) => Shimmer.fromColors(
                              highlightColor: Colors.white,
                              baseColor: Colors.grey.shade300,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                color: Colors.grey.shade300,
                              ),
                            ),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              controller.products[index].title.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'RS${controller.products[index].price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
