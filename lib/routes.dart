import 'home_page/home_page_binding.dart';
import 'login_page/login_page_binding.dart';
import 'package:get/get.dart';

import 'home_page/home_page_view.dart';
import 'login_page/login_page_view.dart';

class AppRoutes {
  //Define Routes for named navigation
  static String loginPage='/loginPage';
  static String homePage='/homePage';
}


//Creating Route List of getPage
List<GetPage> pages=[
  GetPage(name: AppRoutes.loginPage, page:()=> LoginPageView(),binding: LoginPageBinding()),
  GetPage(name: AppRoutes.homePage, page: ()=>const HomePageView(),binding: HomePageBinding()),
];