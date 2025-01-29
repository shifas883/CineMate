import 'package:cinemate/data/model/home_models.dart';
import 'package:cinemate/presentation/widgets/reusable_cards/success_card.dart';
import 'package:flutter/material.dart';

class RunningSuccessList extends StatelessWidget {
  const RunningSuccessList({super.key, this.title, this.sectionData5});
  final String? title;
  final List<BannerList>? sectionData5;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(title??"Running Successful",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: sectionData5?.length,
            itemBuilder: (context, index) {
              return SuccessCard(
                image: sectionData5?[index].image,
              );
            },
          ),
        ),
      ],
    );
  }
}
