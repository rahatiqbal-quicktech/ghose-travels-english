import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  var selectedItemNumber = 0.obs;
  var selectedCategory = "".obs;

  setSelectedItemNumber({required int number, required String categoryName}) {
    selectedItemNumber.value = number;
    selectedCategory.value = categoryName;
  }
}
