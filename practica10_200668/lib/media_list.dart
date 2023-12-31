import 'package:flutter/material.dart';
import 'package:practica8_200668/common/HttpHandler.dart';
import 'package:practica8_200668/model/Media.dart';
import 'package:practica8_200668/media_list_item.dart';

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = [];
  //List<Media> _media = new List.empty();
  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return MediaListItem(_media[index]);
        },
      ),
    );
  }
}
