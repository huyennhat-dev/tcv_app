// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../urls/urls_api.dart';
import '../../model/slide.dart';

class SlideHomeTab extends StatefulWidget {
  const SlideHomeTab({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<SlideHomeTab> createState() => _SlideHomeTabState();
}

final _base = ApiUrls().baseUrl;
Future<List<Slide>> fetchListSlide() async {
  final response = await http.get(Uri.parse('$_base/tcv/public/api/v1/slide'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Slide.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _SlideHomeTabState extends State<SlideHomeTab> {
  int activateIndex = 0;
  late Future<List<Slide>> futureListSlide;

  @override
  void initState() {
    super.initState();
    futureListSlide = fetchListSlide();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return FutureBuilder<List<Slide>>(
      future: futureListSlide,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                itemCount: snapshot.data!.length,
                options: CarouselOptions(
                  height: (widget.size.width - 20) * 0.5,

                  autoPlay: true,
                  // reverse: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlayInterval: const Duration(seconds: 6),
                  onPageChanged: (index, reason) => setState(
                    () => activateIndex = index,
                  ),
                ),
                itemBuilder: (context, index, realIndex) {
                  final urlImage = '$_base/tcv/public/uploads/slide/' +
                      (snapshot.data![index].hinhanh).toString();
                  return BuildImage(urlImage, index);
                },
              ),
              const SizedBox(height: 10),
              buildIndicator(snapshot.data!.length),
            ],
          );
        }
        // By default show a loading spinner.
        return Container(
          width: size.width - 20,
          height: (size.width - 20) * 0.55,
          color: Colors.grey.shade100,
        );
      },
    );
  }

  Widget BuildImage(String urlImage, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildIndicator(count) {
    return AnimatedSmoothIndicator(
      activeIndex: activateIndex,
      count: count,
      effect: const WormEffect(
        dotHeight: 10,
        dotWidth: 10,
        dotColor: Colors.grey,
        activeDotColor: Colors.black,
      ),
    );
  }
}
