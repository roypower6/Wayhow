import 'package:get/get.dart';

class FilterController extends GetxController {
  final RxBool showFavoritesFirst = true.obs;
  final RxString selectedCategory = ''.obs;
  final RxString selectedIcon = ''.obs;

  void toggleFavoritesFirst() => showFavoritesFirst.toggle();

  void setCategory(String category) => selectedCategory.value = category;

  void setIcon(String icon) => selectedIcon.value = icon;

  void resetFilters() {
    selectedCategory.value = '';
    selectedIcon.value = '';
  }
}
