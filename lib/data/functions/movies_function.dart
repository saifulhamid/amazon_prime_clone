import 'dart:convert';

import 'package:amazon_clone/data/model/GetModel.dart';
import 'package:amazon_clone/data/url.dart';
import 'package:amazon_clone/pages/detailsPages/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Widget moviesListView(List<GetModel> list) {
  list.shuffle();
  return Container(
    height: 200,
    width: double.infinity,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsPage(index: index, list: list),
                  ));
            },
            child: Container(
              height: 250,
              width: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          imgBaseUrl + list[index].posterPath.toString()))),
            ),
          ),
        );
      },
    ),
  );
}

// ================ Movie Trending ==============

List<GetModel> movieCarousel = [];
Future<List<GetModel>> getMovies() async {
  final response = await http.get(Uri.parse('$movieBaseUrl?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      movieCarousel.clear();

      for (Map<String, dynamic> i in data) {
        movieCarousel.add(GetModel.fromJson(i));
      }
      return movieCarousel;
    } else {
      return [];
    }
  } else {
    return [];
  }
}

// ================= latest movie =============
// List<GetModel> latestMovie = [];
// Future<List<GetModel>> getLatestMovies() async {
//   final response = await http.get(Uri.parse('$latest?api_key=$apiKey'));

//   if (response.statusCode == 200) {
//     if (response.body.isNotEmpty) {
//       Map<String, dynamic> jsonData = jsonDecode(response.body);
//       List<dynamic> data = jsonData['results'];

//       latestMovie.clear();

//       for (Map<String, dynamic> i in data) {
//         latestMovie.add(GetModel.fromJson(i));
//       }
//       return latestMovie;
//     } else {
//       return [];
//     }
//   } else {
//     return [];
//   }
// }

// ================= popular movie =============
List<GetModel> popularMovieList = [];
Future<List<GetModel>> getPopularMovies() async {
  final response = await http.get(Uri.parse('$popularMovies?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      popularMovieList.clear();

      for (Map<String, dynamic> i in data) {
        popularMovieList.add(GetModel.fromJson(i));
      }
      return popularMovieList;
    } else {
      return [];
    }
  } else {
    return [];
  }
}

// =============== Top Rated Movies ==================

List<GetModel> topRatedMoviesList = [];
Future<List<GetModel>> getTopRatedMovies() async {
  final response = await http.get(Uri.parse('$topRatedMovies?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      topRatedMoviesList.clear();

      for (Map<String, dynamic> i in data) {
        topRatedMoviesList.add(GetModel.fromJson(i));
      }
      return topRatedMoviesList;
    } else {
      return [];
    }
  } else {
    return [];
  }
}

// =================== Upcoming Movies ===================

List<GetModel> upcomingMovieList = [];
Future<List<GetModel>> getUpcomingMovies() async {
  final response = await http.get(Uri.parse('$upcomingMovies?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      upcomingMovieList.clear();

      for (Map<String, dynamic> i in data) {
        upcomingMovieList.add(GetModel.fromJson(i));
      }
      return upcomingMovieList;
    } else {
      return [];
    }
  } else {
    return [];
  }
}
