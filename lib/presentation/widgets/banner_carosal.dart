import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemate/data/model/home_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';

class BannerCarouselClass extends StatefulWidget {
  BannerCarouselClass({super.key, this.banners});
  final List<BannerList>? banners;

  @override
  State<BannerCarouselClass> createState() => _BannerCarouselClassState();
}

class _BannerCarouselClassState extends State<BannerCarouselClass> {
  int currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  // Cache manager instance
  final CacheManager _cacheManager = DefaultCacheManager();

  Future<ImageProvider> _getImage(String imageUrl) async {
    final file = await _cacheManager.getSingleFile(imageUrl);
    return FileImage(file);
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: 170.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 10,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      items: widget.banners?.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return FutureBuilder<ImageProvider>(
              future: _getImage(banner.image ?? ''),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show shimmer while image is loading
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  // In case of error, show a placeholder
                  return Container(
                    color: Colors.grey,
                    child: Center(
                      child: Icon(Icons.error, color: Colors.white),
                    ),
                  );
                } else {
                  // Display the image after loading
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
              },
            );
          },
        );
      }).toList(),
    );
  }
}
