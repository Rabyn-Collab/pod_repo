class Food {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  Food(
      {required this.idCategory,
        required this.strCategory,
        required this.strCategoryThumb,
        required this.strCategoryDescription});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      idCategory: json['idCategory'],
      strCategory: json['strCategory'],
      strCategoryThumb: json['strCategoryThumb'],
      strCategoryDescription: json['strCategoryDescription'],
    );
  }
}



class FoodItem {
  String strMeal;
  String strMealThumb;
  String idMeal;

  FoodItem({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }
}