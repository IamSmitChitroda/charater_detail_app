import 'package:character_detail_app/view/screens/detail_page.dart';
import 'package:character_detail_app/view/screens/favourite_page.dart';
import 'package:character_detail_app/view/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'favouritepage': (context) => const FavouritePage(),
        'detailPage': (context) => const DetailPage(),
      },
    );
  }
}
