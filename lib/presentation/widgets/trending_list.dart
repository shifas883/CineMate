import 'package:cinemate/data/model/home_models.dart';
import 'package:cinemate/presentation/widgets/reusable_cards/trending_card.dart';
import 'package:flutter/material.dart';

class TrendingList extends StatelessWidget {
  const TrendingList({super.key, this.title,  this.sectionOne});
  final String? title;
  final List<BannerList>? sectionOne;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(title??"Trending India",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: sectionOne?.length,
            itemBuilder: (context, index) {
              return TrendingCard(
                image: sectionOne?[index].image,
                title: sectionOne?[index].title,
                description: sectionOne?[index].description,
              );
            },
          ),
        ),
      ],
    );
  }
}
