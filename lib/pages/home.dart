// ignore_for_file: must_be_immutable

import 'package:amazon_clone/pages/subPages/all.dart';
import 'package:amazon_clone/pages/subPages/movies.dart';
import 'package:amazon_clone/pages/subPages/tv_shows.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List allMoviesList = [];
  List trendingMoviesList = [];
  List tvShows = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/image/primelogo.png',
          height: 25,
        ),
        actions: [
          const Icon(
            Icons.cast,
            color: Colors.white,
          ),
          const SizedBox(width: 20),
          Icon(
            Icons.supervised_user_circle,
            color: Colors.blue.shade100,
            size: 32,
          ),
          const SizedBox(width: 40)
        ],
        bottom: const TabBar(
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Movies',
            ),
            Tab(
              text: 'TV shows',
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: TabBarView(
        children: [
          AllMovies(allMovies: allMoviesList),
          Movies(trendingMovies: trendingMoviesList),
          TvShows(tvShows: tvShows)
        ],
      ),
    );
  }
}
