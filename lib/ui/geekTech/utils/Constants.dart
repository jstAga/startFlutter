import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:start_flutter/ui/geekTech/utils/Ext.dart';

class Constants {
  //hw7m2
  static final Color lightGray = HexColor.fromHex("#949494");
  static final Color black = HexColor.fromHex("#1C1C1C");
  static final Color darkGray = HexColor.fromHex("#1C1C1C");
  static final Color orange = HexColor.fromHex("#FF9500");

  //Telegram Settings
  static final Color telegramBackground = HexColor.fromHex("#E9EBF0");

  //The Movie DB
  static const String theMovieDbAuthAppBar = "Login to your account";
  static const Color theMovieDbBackground = Color.fromRGBO(3, 37, 65, 1);
  static const Color theMovieDbBlue = Color(0xFF01B4E4);

  static const String theMovieDbHeader1 =
      "In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.";
  static const String theMovieDbHeader2 =
      "If you signed up but didn't get your verification email.";
  static const String theMovieDbUsername = "Username";
  static const String theMovieDbPassword = "Password";
  static const String theMovieDbLogin = "Login";
  static const String theMovieDbResetPassword = "Reset password";
  static const String theMovieDbRegister = "Register";
  static const String theMovieDbVerifyEmail = "Verify email";
  static const String theMovieDb = "";

  static final ButtonStyle baseTheMovieDbButton = ButtonStyle(
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
      textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      backgroundColor: MaterialStateProperty.all(Constants.theMovieDbBlue),
      foregroundColor: MaterialStateProperty.all(Colors.white));


  static final ButtonStyle baseTheMovieDbLinkButton = ButtonStyle(
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
      textStyle: MaterialStateProperty.all(const TextStyle(
        fontSize: 16,
      )),
      foregroundColor:
      MaterialStateProperty.all(Constants.theMovieDbBlue));

  static const String theMovieDbHomeTitle = "TMDB";
}
