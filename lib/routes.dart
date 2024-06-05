import 'package:assign_maxmobility/add_user_page/add_user_page_view.dart';
import 'package:get/get.dart';

import 'add_user_page/add_user_page_binding.dart';
import 'home_page/home_page_binding.dart';
import 'home_page/home_page_view.dart';
import 'login_page/login_page_binding.dart';
import 'login_page/login_page_view.dart';

class AppRoutes {
  //Define Routes for named navigation
  static String loginPage = '/loginPage';
  static String homePage = '/homePage';
  static String addUserPage = '/addUserPage';
}

//Creating Route List of getPage
List<GetPage> pages = [
  GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPageView(),
      binding: LoginPageBinding()),
  GetPage(
      name: AppRoutes.homePage,
      page: () => HomePageView(),
      binding: HomePageBinding()),
  GetPage(
      name: AppRoutes.addUserPage,
      page: () => AddUserPageView(),
      binding: AddUserPageBinding()),
];
