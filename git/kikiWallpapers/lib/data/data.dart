import 'package:kikiWallpapers/models/categorymodel.dart';

String api_Key = '21229713-7e284b2e01dc3d96c88c9d012';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = new List();
  CategoryModel categoryModel = new CategoryModel();

  categoryModel = new CategoryModel();
  categoryModel.category = "Nature";
  categoryModel.imgurl =
      "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.category = "Wild Life";
  categoryModel.imgurl =
      "https://images.unsplash.com/photo-1522949729898-5a0dc937e94e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1188&q=80";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.category = "Cars";
  categoryModel.imgurl =
      "https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.category = "Bikes";
  categoryModel.imgurl =
      "https://images.unsplash.com/photo-1558981403-c5f9899a28bc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.category = "Street Art";
  categoryModel.imgurl =
      "https://images.unsplash.com/photo-1601196595039-74c770ae3385?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1060&q=80";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.category = "Anime";
  categoryModel.imgurl =
      "https://images.unsplash.com/photo-1581833971358-2c8b550f87b3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80";
  categories.add(categoryModel);

  return categories;
}
