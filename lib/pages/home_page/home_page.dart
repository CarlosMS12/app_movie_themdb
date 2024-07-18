import 'package:app_movie_tbm/api/api.dart';
import 'package:app_movie_tbm/api/movie.dart';
import 'package:app_movie_tbm/pages/home_page/widgets/my_carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ep.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> _nowPlayingMovies;
  late Future<List<Movie>> _popularMovies;
  late Future<List<Movie>> _trendingMovies;

  @override
  void initState() {
    _nowPlayingMovies = Api().getNowPlayingMovies();
    _popularMovies = Api().getPopularMovies();
    _trendingMovies = Api().getTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SingleChildScrollView(
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
                  Text(
                    "Now Playing",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  // Carousel
                  FutureBuilder(
                    future: _nowPlayingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return _buildMyCarouselSlider(
                          context,
                          itemCount: snapshot.data!.length,
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Trending',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Trending
                  FutureBuilder(
                    future: _trendingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MyCarouselSlider(
                          snapshot: snapshot,
                          itemCount: 10,
                          width: 150,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Popular',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),

                  // Popular
                  FutureBuilder(
                    future: _popularMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else if (snapshot.hasData) {
                        return MyCarouselSlider(
                          snapshot: snapshot,
                          itemCount: 10,
                          width: 150,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildMyCarouselSlider(
  BuildContext context, {
  required int itemCount,
  required AsyncSnapshot snapshot,
}) {
  return CarouselSlider.builder(
    itemCount: itemCount,
    options: CarouselOptions(
      aspectRatio: 16 / 9,
      height: 300,
      autoPlay: true,
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      viewportFraction: 0.55,
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
    ),
    itemBuilder: (context, index, realIndex) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                '${Constans.imagePath}${snapshot.data[index].posterPath}',
              ),
            ),
          ),
        ),
      );
    },
  );
}
