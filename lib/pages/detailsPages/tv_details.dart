import 'package:amazon_clone/data/model/GetModel.dart';
import 'package:amazon_clone/data/url.dart';
import 'package:flutter/material.dart';

class TvDetailsPage extends StatelessWidget {
  final int index;
  final List<GetModel> list;
  const TvDetailsPage({super.key, required this.index, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
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
        ),
        backgroundColor: Colors.black,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      imgBaseUrl + list[index].backdropPath.toString()),
                ),
              ),
              alignment: FractionalOffset.topCenter,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    list[index].originalTitle.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(157, 84, 84, 84),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'How do I watch this?',
                      style: TextStyle(
                          color: Colors.white,
                          // fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.movie_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Trailer',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 35,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Add',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Share',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Original Language - ${list[index].originalLanguage.toString()}',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    list[index].overview.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
