// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:amazon_clone/data/model/GetModel.dart';
import 'package:amazon_clone/data/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  SearchPage({Key? key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController query = TextEditingController();

  List<GetModel> searchResult = [];

  Future<void> _fetchSearchResults(String query) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query'));

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        List<dynamic> data = jsonData['results'];

        setState(() {
          searchResult.clear();

          for (Map<String, dynamic> i in data) {
            searchResult.add(GetModel.fromJson(i));
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Find',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          Icon(
            Icons.supervised_user_circle,
            color: Colors.blue.shade100,
            size: 30,
          ),
          const SizedBox(width: 30)
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 17,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      onChanged: (value) => _fetchSearchResults(value),
                      controller: query,
                      decoration: const InputDecoration(
                          label: Text(
                            'search...',
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    icon: searchResult.isNotEmpty
                        ? const Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 17,
                          )
                        : const SizedBox(),
                    onPressed: () {
                      query.clear();
                      searchResult.clear();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){},
                    child: ListTile(
                      title: Text(
                        searchResult[index].title!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
