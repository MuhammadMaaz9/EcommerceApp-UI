import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomPopScreen extends StatelessWidget {
  String products;
  String image;
  String rating;

  BottomPopScreen(
      {super.key,
      required this.products,
      required this.image,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(
          children: [
            SizedBox(
              height: 0.02 * height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Text(
                        rating,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 0.01 * width,
                      ),
                      SvgPicture.asset(
                        'assets/star.svg',
                        height: 12,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image)),
              ),
              height: 0.2 * height,
              width: 0.4 * width,
            ),
            SizedBox(
              height: 0.02 * height,
            ),
            Row(
              children: [
                Text(
                  'Product Description:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.02 * height,
            ),
            Text(products),
          ],
        ),
      ),
    );
  }
}
