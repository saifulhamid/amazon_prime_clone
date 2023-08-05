// ignore_for_file: must_be_immutable

import 'package:amazon_clone/pages/subPages/all.dart';
import 'package:amazon_clone/pages/subPages/movies.dart';
import 'package:amazon_clone/pages/subPages/tv_shows.dart';
import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  StorePage({super.key});

  List allMoviesList = [];
  List trendingMoviesList = [];
  List tvShows = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Store',
          style: TextStyle(
            fontSize: 25,
            color: Colors.yellow,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
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
              text: 'Rent',
            ),
            Tab(
              text: 'Channels',
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            tileMode: TileMode.clamp,
            colors: [
              Color.fromARGB(255, 123, 115, 45),
              Color.fromARGB(255, 0, 0, 0),
              Colors.black,
              Colors.black,
            ],
          ),
        ),
        child: TabBarView(
          children: [
            AllMovies(allMovies: allMoviesList),
            Movies(trendingMovies: trendingMoviesList),
            TvShows(tvShows: tvShows)
          ],
        ),
      ),
    );
  }
}
