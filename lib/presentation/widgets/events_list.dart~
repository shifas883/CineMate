import 'package:cinemate/data/model/home_models.dart';
import 'package:cinemate/presentation/widgets/reusable_cards/events_card.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  const EventsList({super.key, this.menus});
  final List<BannerList>? menus;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: menus?.length,
        itemBuilder: (context, index) {
          return EventsCard(
            text: menus?[index].title,
            image: menus?[index].image,
          );
        },
      ),
    );
  }
}
