import 'package:app_movie_tbm/api/api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCarouselSlider extends StatelessWidget {
  final int itemCount;
  final double? aspectRatio;
  final double? height;
  final double width;
  final bool? autoPlay;
  final bool? enlargeCenterPage;
  final String? image;
  final AsyncSnapshot snapshot;
  const MyCarouselSlider({
    super.key,
    required this.itemCount,
    this.aspectRatio,
    this.height,
    required this.width,
    this.autoPlay,
    this.enlargeCenterPage,
    this.image,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: itemCount,
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        height: 250,
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 0.55,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      itemBuilder: (context, index, realIndex) {
        return Container(
            //color: Colors.red,
            child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        '${Constans.imagePath}${snapshot.data[index].posterPath}'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                '${snapshot.data[index].title}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
