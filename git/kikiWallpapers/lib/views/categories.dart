import 'package:flutter/material.dart';
import 'package:kikiWallpapers/widgets/widget.dart';
import 'package:kikiWallpapers/models/wallpaper_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryView extends StatefulWidget {
  final String categoryname;

  CategoryView({this.categoryname});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchTextcontroller = new TextEditingController();

  getcategoryWallpapers(String query) async {
    String url =
        'https://pixabay.com/api/?key=21229713-7e284b2e01dc3d96c88c9d012&q=$query&image_type=photo';
    var response = await http.get(url);
    print(response.body.toString());

    Map<String, dynamic> jsondata = jsonDecode(response.body);
    jsondata['hits'].forEach((element) {
      //print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getcategoryWallpapers(widget.categoryname);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BrandName(),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
