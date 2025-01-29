import 'package:flutter/material.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({super.key, this.image, this.text});
  final String? image;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 200,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(
                  image??'https://wallpapercave.com/wp/wp1946074.jpg',
                ),
                fit: BoxFit.cover)),
        child: Center(
            child: Container(
              width: 100,
              child: Text(
                        text??"Music Updates",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                      ),
            )));
  }
}
