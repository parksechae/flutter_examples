import 'package:flutter/material.dart';
import 'package:naver_map_web/cart.dart';
import 'package:naver_map_web/home.dart';

final Map<String, Widget> myRoutes = {
  '/': const HomePage(title: 'Flutter Demo Home Page'),
  '/cart': const CartPage(),
};
