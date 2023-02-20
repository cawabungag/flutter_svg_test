// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Flutter SVG Demo';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/earth-day-ecology-svgrepo-com.svg';
    const String url = 'https://jovial.com/images/jupiter.svg';

    final carouselSlider = CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return i % 2 > 0
                ? SvgPicture.network(url,
                    placeholderBuilder: (BuildContext context) =>
                        const CircularProgressIndicator())
                : SvgPicture.asset(assetName,
                    placeholderBuilder: (BuildContext context) =>
                        const CircularProgressIndicator());
          },
        );
      }).toList(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: carouselSlider,
      ),
    );
  }
}
