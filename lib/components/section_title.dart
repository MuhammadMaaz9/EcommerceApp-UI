import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final bool value;
  final String title;
  const SectionTitle({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          Text(
            value == true ? "See more" : '',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
