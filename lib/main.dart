import 'package:flutter/material.dart';
import 'package:post_api/Post_Api/Post_Api.dart';
import 'package:post_api/Post_Api/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Api()
        //PostApi(),
        );
  }
}
