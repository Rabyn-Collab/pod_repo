

class MealCategory {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  MealCategory({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });
  factory MealCategory.fromJson(Map<String, dynamic> json) {
    return MealCategory(
      idCategory: json['idCategory'] ?? '',
      strCategory: json['strCategory'] ?? 'no-category',
      strCategoryThumb: json['strCategoryThumb'] ?? '',
      strCategoryDescription: json['strCategoryDescription'] ?? '',
    );
  }
}


class MealItem{

  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  MealItem({
    required this.strMealThumb,
    required this.strMeal,
    required this.idMeal
  });

  factory MealItem.fromJson(Map<String,dynamic> json){
    return MealItem(
        strMealThumb: json['strMealThumb'],
        strMeal: json['strMeal'],
        idMeal: json['idMeal']
    );
  }
}



class Recipe {
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strTags;
  final String strYoutube;

  Recipe(
      {required this.strMeal,
        required this.strCategory,
        required this.strArea,
        required this.strInstructions,
        required this.strMealThumb,
        required this.strTags,
        required this.strYoutube});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      strMeal: json['strMeal'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
    );
  }
}