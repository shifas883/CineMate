import 'package:cinemate/core/utils/color_palette.dart';
import 'package:cinemate/core/utils/string_extention.dart';
import 'package:cinemate/data/model/home_models.dart';
import 'package:flutter/material.dart';

class RequirementScreen extends StatelessWidget {
  const RequirementScreen({super.key, this.category});
  final List<CategoryList>? category;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffECECEC),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Find your requirement here",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: (category?.length ?? 0) + 1,
              itemBuilder: (_, index) {
                if (index == (category?.length ?? 0)) {
                  return _buildViewAllButton();
                } else {
                  return _buildRequirementButton(
                      category?[index].name.toString().toTitleCase() ?? '');
                }
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.8,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewAllButton() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorPalette.primaryColor,
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        'View All',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: ColorPalette.whiteColor),
      ),
    );
  }

  Widget _buildRequirementButton(String text) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.whiteColor,
        borderRadius:
            BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: ColorPalette.blackColor.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
