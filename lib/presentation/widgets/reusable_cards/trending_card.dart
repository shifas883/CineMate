import 'package:flutter/material.dart';
import 'package:shadow_overlay/shadow_overlay.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key, this.title, this.description, this.image});
  final String? title;
  final String? description;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 300,
            height: 150,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(image??
                      'https://wallpapercave.com/wp/wp1946074.jpg',
                    ),
                    fit: BoxFit.cover)),),
        Container(
          width: 300,
          child: Text(title??"Latest Film News",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(

                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
          )),
        ),
        Container(
          width: 300,
          child: Text(description??"Stay Informed on  Latest news  from film industry ...",
              maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),),

        )
      ],
    );
  }
}

