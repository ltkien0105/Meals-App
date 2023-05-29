import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (!mealIsFavorite) {
      state = [...state, meal];
      return true;
    } else {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());
