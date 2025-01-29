import 'package:cinemate/data/datasource/api_services.dart';
import 'package:cinemate/data/repository/repository.dart';
import 'package:cinemate/presentation/bloc/fetch_home_data_bloc.dart';
import 'package:cinemate/presentation/pages/home_page.dart';
import 'package:cinemate/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures plugins are initialized
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

  runApp(MyApp(isFirstLaunch: isFirstLaunch));
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;

  const MyApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FetchHomeDataBloc(HomeRepository(ApiService()))
              ..add(FetchHomeData())),
      ],
      child: MaterialApp(
        title: 'Cinemate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SFProText',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: isFirstLaunch ? SplashScreen() : HomePageScreen(),
      ),
    );
  }
}
