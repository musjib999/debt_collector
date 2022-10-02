import 'package:debt_collector/index.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: AppColors.darkBlue,
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: AppColors.fairlyWhite,
    ),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(color: AppColors.fairlyWhite,fontSize: 18,fontWeight: FontWeight.w500),
    color: AppColors.darkBlue,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.fairlyWhite),
  ),
  cardColor: AppColors.darkerBlue,
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),),
    prefixIconColor: Colors.grey,
  ),
);
