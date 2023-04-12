import 'package:flutter/material.dart';
import 'core/serviece/services_locatore.dart';

import 'movie_app/presentation/pages/movies_screen.dart';

void main() {
  ServiecesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MainMoviesScreen(),
    );
  }
}
