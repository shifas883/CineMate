import 'package:flutter/material.dart';

class SuccessCard extends StatelessWidget {
  const SuccessCard({super.key, this.image});

  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(
                image??'https://wallpapercave.com/wp/wp1946074.jpg',

              ),
              alignment: Alignment.topCenter,
              fit: BoxFit.cover)));
  }
}
