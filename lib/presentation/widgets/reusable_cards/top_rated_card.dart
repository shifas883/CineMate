import 'package:cinemate/core/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:io';

import '../../../core/utils/color_palette.dart';

class TopRatedCard extends StatelessWidget {
  const TopRatedCard({super.key, this.image});

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
    return FutureBuilder<File?>(
      future: image != null ? _getCachedImage(image!) : null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 110,
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
            width: 110,
            height: 150,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: FileImage(snapshot.data!),
                fit: BoxFit.fill,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.string(MySvgs.star),
                    SizedBox(width: 5),
                    Text(
                      "4.5",
                      style: TextStyle(
                        color: ColorPalette.whiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
