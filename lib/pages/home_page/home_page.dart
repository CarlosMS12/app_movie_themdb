import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ep.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Color(0xff0066ff),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff979797)),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0066ff)),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 60,
                    ),
                    suffixIcon: Iconify(Ep.search, color: Color(0xff004cd9)),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Color(0xff979797)),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Now Playing",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                const SizedBox(height: 20),
                CarouselSlider.builder(
                  itemCount: 10,
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    height: 300,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    viewportFraction: 0.55,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 300,
                        width: 200,
                        color: Colors.green[100],
                        child: Center(child: Text('$index')),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
