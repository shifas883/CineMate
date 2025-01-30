import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:io';

class SuccessCard extends StatelessWidget {
  const SuccessCard({super.key, this.image});

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
              width: 250,
              height: 180,
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
            height: 180,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: FileImage(snapshot.data!),
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
          );
        }
      },
    );
  }
}
