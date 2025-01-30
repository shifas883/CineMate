import 'package:flutter/material.dart';
import 'package:shadow_overlay/shadow_overlay.dart';

import '../../../core/utils/color_palette.dart';

class ShadowCard extends StatelessWidget {
  const ShadowCard({super.key, this.image});

  final String? image;
  @override
  Widget build(BuildContext context) {
    return ShadowOverlay(
      child: Image.network(
        image??'https://assets.voxcinemas.com/posters/P_HO00008843.jpg',
        height: 500,
        width:800,
        fit: BoxFit.cover,
      ),
      shadowColor: ColorPalette.whiteColor,
      shadowWidth: 800,
      shadowHeight: 150,
    );
  }
}