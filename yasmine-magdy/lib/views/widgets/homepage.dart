import 'package:flutter/material.dart';
import 'package:helloworld/models/albums.dart';
import 'package:helloworld/services/albumsS.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<Albums> users = [];
  bool isLoading = true;
  Future<void> getUsersFromApi() async {
    users = await AlbumsS().getAlbums();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUsersFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(users[index].title ?? "--"),
                );
              },
            ),
    );
  }
}
