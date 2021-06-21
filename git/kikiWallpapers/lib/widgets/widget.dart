import 'package:flutter/material.dart';
import 'package:kikiWallpapers/models/wallpaper_model.dart';
import 'package:kikiWallpapers/views/image_view.dart';

Widget BrandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "KiKi",
        style: TextStyle(color: Colors.deepPurple),
      ),
      Text(
        "Wallpapers",
        style: TextStyle(color: Colors.black),
      )
    ],
  );
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: wallpapers.map((e) {
          return GridTile(
              child: Container(
                  child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgurl: e.largeImageURL,
                          )));
            },
            child: Hero(
              tag: e.largeImageURL,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    e.largeImageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )));
        }).toList()),
  );
}
