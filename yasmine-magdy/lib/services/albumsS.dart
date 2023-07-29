import 'package:dio/dio.dart';
import 'package:helloworld/models/albums.dart';

class AlbumsS {
  String url = "https://jsonplaceholder.typicode.com/albums";
  Future<List<Albums>> getAlbums() async {
    List<Albums> albums = [];
    Response response = await Dio().get(url);
    var data = response.data;
    data.forEach((element) {
      Albums user = Albums.fromJson(element);
      albums.add(user);
    });

    return albums;
  }
}
