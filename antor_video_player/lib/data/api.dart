class Api {
  static const String baseUrl = "https://test-ximit.mahfil.net/api";
  static String trendingVideoEndpoint(int category) =>
      "/trending-video/$category";

  static String trendingVideoUrl(int category, int page) =>
      '$baseUrl${trendingVideoEndpoint(category)}?page=$page';
}
