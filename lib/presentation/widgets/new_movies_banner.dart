import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemate/data/model/home_models.dart';
import 'package:cinemate/presentation/widgets/reusable_cards/shadow_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/utils/color_palette.dart';

class NewMoviesBanner extends StatefulWidget {
  NewMoviesBanner({super.key, this.title, this.sectionFour});
  final String? title;
  final List<BannerList>? sectionFour;

  @override
  State<NewMoviesBanner> createState() => _NewMoviesBannerState();
}

class _NewMoviesBannerState extends State<NewMoviesBanner> {
  int _currentIndexPoster = 0;

  final CarouselSliderController _controllerPoster = CarouselSliderController();

  final CacheManager _cacheManager = DefaultCacheManager();

  Future<ImageProvider> _getImage(String imageUrl) async {
    final file = await _cacheManager.getSingleFile(imageUrl);
    return FileImage(file);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            widget.title ?? "New Movies Releases",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 10),
        CarouselSlider(
          carouselController: _controllerPoster,
          options: CarouselOptions(
            height: 500.0,
            autoPlay: false,
            enlargeCenterPage: true,
            aspectRatio: 16 / 10,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndexPoster = index;
              });
            },
          ),
          items: widget.sectionFour?.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return FutureBuilder<ImageProvider>(
                  future: _getImage(banner.media ?? ''),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: ShadowCard(image: null),
                      );
                    } else if (snapshot.hasError) {
                      return ShadowCard(image: null);
                    } else {
                      return ShadowCard(image: banner.media);
                    }
                  },
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.sectionFour!.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controllerPoster.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndexPoster == entry.key
                      ? ColorPalette.blackColor
                      : Color(0xffD9D9D9),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
