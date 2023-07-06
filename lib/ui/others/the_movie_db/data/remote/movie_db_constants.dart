class MovieDbConstants {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "db4f25ed06d95e5c2ca4d4695470a0dd";

  static const getToken = "/authentication/token/new?";
  static const postValidateUser = "/authentication/token/validate_with_login?";
  static const postSession = "/authentication/session/new?";

  static const getMovies = "/movie/popular";
}
