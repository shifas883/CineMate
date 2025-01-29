import 'package:cinemate/data/model/home_models.dart';
import 'package:cinemate/presentation/widgets/reusable_cards/concerts_card.dart';
import 'package:flutter/material.dart';

class ConcertsNearList extends StatelessWidget {
  const ConcertsNearList({super.key, this.title, this.sectionFour});
  final String? title;
  final List<BannerList>? sectionFour;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(title??"Concerts Near You",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: sectionFour?.length,
            itemBuilder: (context, index) {
              return ConcertsCard(
                text: sectionFour?[index].name,
                image: sectionFour?[index].image,
              );
            },
          ),
        ),
      ],
    );
  }
}
