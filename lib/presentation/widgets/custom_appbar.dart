import 'package:cinemate/core/utils/color_palette.dart';
import 'package:cinemate/core/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorPalette.whiteColor,
      surfaceTintColor: ColorPalette.whiteColor,
      foregroundColor: Colors.grey,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        color: ColorPalette.blackColor,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Row(
            children: [
              SvgPicture.string(MySvgs.notification),
              SizedBox(width: 25),
              SvgPicture.string(MySvgs.message),
            ],
          ),
        )
      ],
    );
  }
}
