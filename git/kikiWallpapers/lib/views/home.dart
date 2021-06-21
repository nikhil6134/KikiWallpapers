import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kikiWallpapers/data/data.dart';
import 'package:kikiWallpapers/models/categorymodel.dart';
import 'package:kikiWallpapers/models/wallpaper_model.dart';
import 'package:kikiWallpapers/views/categories.dart';
import 'package:kikiWallpapers/views/image_view.dart';
import 'package:kikiWallpapers/views/search.dart';
import 'package:kikiWallpapers/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List();
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchTextcontroller = new TextEditingController();

  @override
  void initState() {
    categories = getCategories();
    gettrendingWallpapers();
    super.initState();
  }

  gettrendingWallpapers() async {
    String url =
        'https://pixabay.com/api/?key=21229713-7e284b2e01dc3d96c88c9d012&q=superheros&image_type=photo';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BrandName(),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchTextcontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search"),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchquery: searchTextcontroller.text,
                                    )));
                      },
                      child: Icon(Icons.search))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
                height: 80,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (context, index) {
                    return CategoriesTile(
                      imgurl: categories[index].imgurl,
                      title: categories[index].category,
                    );
                  },
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                )),
            SizedBox(
              height: 20,
            ),
            wallpapersList(wallpapers: wallpapers, context: context)
          ],
        )),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  String imgurl;
  String title;

  CategoriesTile({@required this.imgurl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryView(
                      categoryname: title.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imgurl,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(16)),
                height: 100,
                width: 150,
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                )),
          ],
        ),
      ),
    );
  }
}
