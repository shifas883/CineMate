import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:io';

import '../../../core/utils/color_palette.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key, this.title, this.description, this.image});

  final String? title;
  final String? description;
  final String? image;

  Future<File?> _getCachedImage(String imageUrl) async {
    try {
      return await DefaultCacheManager().getSingleFile(imageUrl);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder<File?>(
          future: image != null ? _getCachedImage(image!) : null,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 250,
                  height: 150,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                ),
              );
            } else {
              return Container(
                width: 250,
                height: 150,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: FileImage(snapshot.data!),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter
                  ),
                ),
                 child: Align(
                   alignment: Alignment.bottomLeft,
                child: Container(
                width: 80,
                child: Text(
                  "Trending News",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      color: ColorPalette.whiteColor, fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
            ),
              );
            }
          },
        ),
        SizedBox(height: 5),
        Container(
          width: 250,
          child: Text(
            title ?? "Latest Film News",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ColorPalette.blackColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          width: 250,
          child: Text(
            description ?? "Stay Informed on Latest news from the film industry ...",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ColorPalette.blackColor,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
