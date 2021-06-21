class WallpaperModel {
  String imageURL;
  String previewURL;
  String largeImageURL;
  String fullHDURL;

  WallpaperModel(
      {this.fullHDURL, this.imageURL, this.largeImageURL, this.previewURL});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
      imageURL: jsonData['imageURL'],
      previewURL: jsonData['previewURL'],
      largeImageURL: jsonData['largeImageURL'],
      fullHDURL: jsonData['fullHDURL'],
    );
  }
}
