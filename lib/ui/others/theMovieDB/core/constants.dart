import 'package:flutter/material.dart';
import 'package:start_flutter/resources/resources.dart';
import 'package:start_flutter/ui/others/theMovieDB/movies/movies.dart';

class Constants{
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

  static final moviesData = [
    MovieModel(id: 0,imageName: Images.mvdbExample, title: "The Super Mario Bros. Movie", time: "05 Apr 2023", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." ),
    MovieModel(id: 1,imageName: Images.mvdbExample2, title: "John Wick: Chapter 4 (2023)", time: "22 Mar 2023", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." ),
    MovieModel(id: 2,imageName: Images.mvdbExample, title: "The Super Mario Bros. Movie", time: "05 Apr 2023", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." ),
    MovieModel(id: 3,imageName: Images.mvdbExample2, title: "John Wick: Chapter 4 (2023)", time: "22 Mar 2023", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." ),
    MovieModel(id: 4,imageName: Images.mvdbExample, title: "The Super Mario Bros. Movie", time: "05 Apr 2023", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." ),
    MovieModel(id: 5,imageName: Images.mvdbExample2, title: "John Wick: Chapter 4 (2023)", time: "22 Mar 2023", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." ),
  ];
}