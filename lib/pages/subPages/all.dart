import 'package:amazon_clone/data/functions/all_functions.dart';
import 'package:amazon_clone/data/functions/movies_function.dart';
import 'package:amazon_clone/data/functions/tv_shows_functions.dart';
import 'package:amazon_clone/data/url.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AllMovies extends StatelessWidget {
  final List allMovies;
  AllMovies({Key? key, required this.allMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FutureBuilder(
              future: getMovieApi(),
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
                  return SizedBox(
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      itemCount: movieList.length,
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayCurve: Curves.decelerate,
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                        pageSnapping: true,
                      ),
                      itemBuilder: (context, index, pageViewIndex) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            // height: 600,
                            width: screenWidth,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(imgBaseUrl +
                                        movieList[index]
                                            .backdropPath
                                            .toString()))),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            headLines('Trending TV shows'),
            FutureBuilder(
              future: getTrendingTvApi(),
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
                  return tvShowsListView(trendingTvShows);
                }
              },
            ),
            const SizedBox(height: 20),
            headLines('Trending Movies'),
            FutureBuilder(
              future: getTrendingMovieApi(),
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
                  return moviesListView(trendingMovieList);
                }
              },
            ),
            const SizedBox(height: 20),
            headLines('Popular Movies'),
            FutureBuilder(
              future: getPopularMovies(),
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
                  return moviesListView(popularMovieList);
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
            headLines('Top Rated Movies'),
            FutureBuilder(
              future: getTopRatedMovies(),
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
                  return moviesListView(topRatedMoviesList);
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
            const SizedBox(height: 20),
            headLines('Upcoming Movies'),
            FutureBuilder(
              future: getUpcomingMovies(),
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
                  return moviesListView(upcomingMovieList);
                }
              },
            )
          ],
        ));
  }
}
