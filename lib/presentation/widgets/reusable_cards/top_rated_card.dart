import 'package:cinemate/core/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopRatedCard extends StatelessWidget {
  const TopRatedCard({super.key, this.image});

  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(
                  image??'https://wallpapercave.com/wp/wp1946074.jpg',
                ),
                fit: BoxFit.fill)),
        child: Align(
          alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.string(MySvgs.star),
                  SizedBox(width: 5,),
                  Text(
                    "4.5",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                ],
              ),
            )));
  }
}
