import 'dart:convert';

import 'package:amazon_clone/data/model/GetModel.dart';
import 'package:amazon_clone/data/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// =================== All - Carousel =====================================
List<GetModel> movieList = [];
Future<List<GetModel>> getMovieApi() async {
  final response = await http.get(Uri.parse('$allBaseUrl?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      movieList.clear();

      for (Map<String, dynamic> i in data) {
        movieList.add(GetModel.fromJson(i));
      }
      return movieList;
    } else {
      return [];
    }
  } else {
    return [];
  }
}

// =============================All Trending Movies ======================
List<GetModel> trendingMovieList = [];
Future<List<GetModel>> getTrendingMovieApi() async {
  final response =
      await http.get(Uri.parse('$trendingMoviesUrl?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      trendingMovieList.clear();

      for (Map<String, dynamic> i in data) {
        trendingMovieList.add(GetModel.fromJson(i));
      }
      return trendingMovieList;
    } else {
      return [];
    }
  } else {
    return [];
  }
}

// =============================All Trending Movies ======================

List<GetModel> trendingTvShows = [];
Future<List<GetModel>> getTrendingTvApi() async {
  final response = await http.get(Uri.parse('$trendingTvUrl?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      trendingTvShows.clear();

      for (Map<String, dynamic> i in data) {
        trendingTvShows.add(GetModel.fromJson(i));
      }
      return trendingTvShows;
    } else {
      return [];
    }
  } else {
    return [];
  }
}

// ========================= Heading =============================
Widget headLines(String heading) {
  return Row(
    children: [
      const Text(
        'Prime',
        style: TextStyle(
            color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w700),
      ),
      Text(
        ' - $heading',
        style: const TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

// ========================================================================

Widget allMoviesListView(List<GetModel> list) {
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
          child: Container(
            height: 250,
            width: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        imgBaseUrl + list[index].posterPath.toString()))),
          ),
        );
      },
    ),
  );
}
