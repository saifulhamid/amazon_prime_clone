import 'package:amazon_clone/data/functions/all_functions.dart';
import 'package:amazon_clone/data/functions/tv_shows_functions.dart';
import 'package:amazon_clone/data/url.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TvShows extends StatelessWidget {
  final tvShows;
  const TvShows({super.key, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FutureBuilder(
            future: getTvShows(),
            builder: (context, snapshot) {
              return SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: tvShowsCarousel.length,
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayCurve: Curves.decelerate,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    pageSnapping: true,
                  ),
                  itemBuilder: (context, index, pageViewIndex) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error fetching data'),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 600,
                          width: screenWidth,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(imgBaseUrl +
                                      tvShowsCarousel[index]
                                          .backdropPath
                                          .toString()))),
                        ),
                      );
                    }
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          headLines('Airing Today'),
          const SizedBox(height: 5),
          FutureBuilder(
            future: getAiringTvShows(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Error fetching data',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                return tvShowsListView(airingTodayList);
              }
            },
          ),
          const SizedBox(height: 20),
          headLines('On The Air'),
          FutureBuilder(
            future: getOnTheAir(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error fetching data'),
                );
              } else {
                return tvShowsListView(ontheAirList);
              }
            },
          ),
          const SizedBox(height: 20),
          headLines('Popular TV shows'),
          FutureBuilder(
            future: getPopularTvShows(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error fetching data'),
                );
              } else {
                return tvShowsListView(popularTvShowsList);
              }
            },
          ),
          const SizedBox(height: 20),
          headLines('Top Rated TV shows'),
          FutureBuilder(
            future: getTopRatedTvShows(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error fetching data'),
                );
              } else {
                return tvShowsListView(ToRatedTvShowsList);
              }
            },
          ),
        ],
      ),
    );
  }
}
