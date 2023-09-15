import 'package:creditum/app/core/controller/app_controller.dart';
import 'package:creditum/app/data/models/account.dart';
import 'package:creditum/app/data/models/category.dart';
import 'package:creditum/app/data/services/account_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  Rx<List<CategoryModel>?> categories = Rx([
    CategoryModel(name: "Grocery", id: "11"),
    CategoryModel(name: "Transportation", id: "2"),
    CategoryModel(name: "Food", id: "3"),
    CategoryModel(name: "Personal Spending", id: "8"),
    CategoryModel(name: "Utility", id: "4"),
    CategoryModel(name: "Housing", id: "1"),
    CategoryModel(name: "Insurance", id: "5"),
    CategoryModel(name: "Medical & Healthcare", id: "6"),
    CategoryModel(name: "Saving & Investing", id: "7"),
    CategoryModel(name: "Entertainment", id: "9"),
    CategoryModel(name: "Other", id: "10"),
  ]);
}
