import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_favourite_app/provider/favourite_provider.dart';
import 'package:provider_favourite_app/screens/favourite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavouriteItemProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FavouriteScreen(),
      ),
    );
  }
}
