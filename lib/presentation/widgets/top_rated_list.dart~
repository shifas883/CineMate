import 'package:cinemate/data/model/home_models.dart';
import 'package:cinemate/presentation/widgets/reusable_cards/top_rated_card.dart';
import 'package:flutter/material.dart';

class TopRatedList extends StatelessWidget {
  const TopRatedList({super.key, this.title,  this.sectionData3});
  final String? title;
  final List<BannerList>? sectionData3;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(title??"Top Rated Movies",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: sectionData3?.length,
            itemBuilder: (context, index) {
              return TopRatedCard(
                image: sectionData3?[index].image,
              );
            },
          ),
        ),
      ],
    );
  }
}
