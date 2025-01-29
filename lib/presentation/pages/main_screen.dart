import 'dart:convert';
import 'package:cinemate/core/utils/color_palette.dart';
import 'package:cinemate/presentation/bloc/fetch_home_data_bloc.dart';
import 'package:cinemate/presentation/widgets/banner_carosal.dart';
import 'package:cinemate/presentation/widgets/concerts_near_list.dart';
import 'package:cinemate/presentation/widgets/custom_appbar.dart';
import 'package:cinemate/presentation/widgets/custom_drawer.dart';
import 'package:cinemate/presentation/widgets/events_list.dart';
import 'package:cinemate/presentation/widgets/new_movies_banner.dart';
import 'package:cinemate/presentation/widgets/requirement_screen.dart';
import 'package:cinemate/presentation/widgets/running_success_list.dart';
import 'package:cinemate/presentation/widgets/top_rated_list.dart';
import 'package:cinemate/presentation/widgets/trending_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    _loadCachedData(); // Load cached data first
    context.read<FetchHomeDataBloc>().add(FetchHomeData());
  }

  Future<void> _cacheData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('cached_home_data', data);
  }

  Future<String?> _getCachedData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('cached_home_data');
  }

  Future<void> _loadCachedData() async {
    final cachedData = await _getCachedData();
    if (cachedData != null) {
      final jsonData = jsonDecode(cachedData);
      context.read<FetchHomeDataBloc>().add(FetchHomeData());
    }
  }

  Future<void> _onRefresh() async {
    context.read<FetchHomeDataBloc>().add(FetchHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(),
      ),
      backgroundColor: ColorPalette.whiteColor,
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: ColorPalette.primaryColor,
        child: BlocBuilder<FetchHomeDataBloc, FetchHomeDataState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return _buildShimmerLoading(); // Show shimmer effect while loading
            }
            if (state is HomeLoaded) {
              _cacheData(jsonEncode(state.movies)); // Cache the loaded data
              return _buildHomeContent(state);
            }
            if (state is HomeError) {
              return Center(child: Text("NO DATA FOUND"));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            5,
                (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeContent(HomeLoaded state) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerCarouselClass(
              banners: state.movies.banners,
            ),
            RequirementScreen(
              category: state.movies.category,
            ),
            SizedBox(height: 10),
            EventsList(
              menus: state.movies.menus,
            ),
            TrendingList(
              title: state.movies.section1data?.title ?? '',
              sectionOne: state.movies.section1data?.data,
            ),
            SizedBox(height: 50),
            NewMoviesBanner(
              title: state.movies.section2data?.title,
              sectionFour: state.movies.section2data?.data,
            ),
            SizedBox(height: 20),
            TopRatedList(
              title: state.movies.section3data?.title,
              sectionData3: state.movies.section3data!.data,
            ),
            SizedBox(height: 20),
            ConcertsNearList(
              title: state.movies.section4data?.title,
              sectionFour: state.movies.section4data?.data,
            ),
            SizedBox(height: 20),
            RunningSuccessList(
              sectionData5: state.movies.section5data,
              title: state.movies.sectionTitles?[0].section5Name,
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

