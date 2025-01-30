import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:io';

import '../../../core/utils/color_palette.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({super.key, this.image, this.text});

  final String? image;
  final String? text;

  Future<File?> _getCachedImage(String imageUrl) async {
    try {
      final file = await DefaultCacheManager().getSingleFile(imageUrl);
      return file;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File?>(
      future: image != null ? _getCachedImage(image!) : null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 110,
              height: 200,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
            ),
          );
        } else {
          return Container(
            width: 110,
            height: 200,
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: FileImage(snapshot.data!),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                width: 100,
                child: Text(
                  text ?? "Music Updates",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorPalette.whiteColor, fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
