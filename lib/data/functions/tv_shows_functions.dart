import 'dart:convert';
import 'package:amazon_clone/data/functions/movies_function.dart';
import 'package:amazon_clone/data/model/GetModel.dart';
import 'package:amazon_clone/pages/detailsPages/tv_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../url.dart';

Widget tvShowsListView(List<GetModel> list) {
  list.shuffle();
  return SizedBox(
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
                    builder: (context) => TvDetailsPage(index: index, list: list),
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

// ================ TV shows Trending ==============

List<GetModel> tvShowsCarousel = [];
Future<List<GetModel>> getTvShows() async {
  final response = await http.get(Uri.parse('$tvShowBaseUrl?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      tvShowsCarousel.clear();

      for (Map<String, dynamic> i in data) {
        tvShowsCarousel.add(GetModel.fromJson(i));
      }
      return movieCarousel;
    } else {
      return [];
    }
  } else {
    return [];
  }
}

// ============= Airing Today ==============

List<GetModel> airingTodayList = [];
Future<List<GetModel>> getAiringTvShows() async {
  final response = await http.get(Uri.parse('$airingTodayUrl?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      airingTodayList.clear();

      for (Map<String, dynamic> i in data) {
        airingTodayList.add(GetModel.fromJson(i));
      }
      return airingTodayList;
    } else {
      return [];
    }
  } else {
    return [];
  }
}

// ================ On the Air ===============

List<GetModel> ontheAirList = [];
Future<List<GetModel>> getOnTheAir() async {
  final response = await http.get(Uri.parse('$onTheAirUrl?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      ontheAirList.clear();

      for (Map<String, dynamic> i in data) {
        ontheAirList.add(GetModel.fromJson(i));
      }
      return ontheAirList;
    } else {
      return [];
    }
  } else {
    return [];
  }
}
// ================ Popular TV Shows ===============

List<GetModel> popularTvShowsList = [];
Future<List<GetModel>> getPopularTvShows() async {
  final response =
      await http.get(Uri.parse('$popularTvShowsUrl?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      popularTvShowsList.clear();

      for (Map<String, dynamic> i in data) {
        popularTvShowsList.add(GetModel.fromJson(i));
      }
      return popularTvShowsList;
    } else {
      return [];
    }
  } else {
    return [];
  }
}
// ================ Top Rated TV Shows ===============

List<GetModel> ToRatedTvShowsList = [];
Future<List<GetModel>> getTopRatedTvShows() async {
  final response =
      await http.get(Uri.parse('$topTatedTvShowsUrl?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      ToRatedTvShowsList.clear();

      for (Map<String, dynamic> i in data) {
        ToRatedTvShowsList.add(GetModel.fromJson(i));
      }
      return ToRatedTvShowsList;
    } else {
      return [];
    }
  } else {
    return [];
  }
}
