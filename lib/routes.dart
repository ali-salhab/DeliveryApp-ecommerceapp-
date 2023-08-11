import 'package:deliveryapp/core/middleware/mymiddleware.dart';
import 'package:deliveryapp/test.dart';
import 'package:deliveryapp/view/screens/homepage.dart';
import 'package:deliveryapp/view/screens/login.dart';
import 'package:get/get.dart';

import 'core/constants/route.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: AppRoutes.login,
      page: () => Login(),
      middlewares: [MyMiddleware()]),
  GetPage(
    name: AppRoutes.homepage,
    page: () => Homepage(),
  ),
  GetPage(
    name: "/test",
    page: () => Test(),
  ),

  // GetPage(name: AppRoutes.editcategorie, page: () => EditCategorie()),
  // GetPage(name: AppRoutes.homepage, page: () => HomePage()),
  // GetPage(name: AppRoutes.categories, page: () => CategoriesPage()),
  // GetPage(name: AppRoutes.addcategorie, page: () => AddCategories()),
  // GetPage(name: AppRoutes.item, page: () => ItemsPage()),
  // GetPage(name: AppRoutes.additem, page: () => AddItems()),
  // GetPage(name: AppRoutes.edititem, page: () => EditItems()),
  // GetPage(name: AppRoutes.orderpage, page: () => OrdersPage()),

  // GetPage(name: AppRoutes.test, page: () => Test())
];
