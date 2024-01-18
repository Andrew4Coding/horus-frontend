import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:horus_frontend/Components/appbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShowImage extends StatefulWidget {
  final List<String> imageLocation;

  const ShowImage({super.key, required this.imageLocation});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: myCustomAppBar().leading,
          title: const Text(
            "Image View",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: myCustomAppBar().actions),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider(
                  items: widget.imageLocation.map((e) {
                    return Image.asset(
                      e,
                      fit: BoxFit.fitWidth,
                    );
                  }).toList(),
                  options: CarouselOptions(
                      viewportFraction: 1,
                      height: double.infinity,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      })),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: widget.imageLocation.length,
              curve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }
}
