import 'dart:convert';
import 'package:antor_video_player/data/api.dart';
import 'package:antor_video_player/model/video.dart';
import 'package:http/http.dart' as http;

class VideoService {
  Future<List<Video>> fetchTrendingVideos(int content_page, int page) async {
    final response = await http.get(Uri.parse(Api.trendingVideoUrl(content_page, page)));
    if (response.statusCode == 200) {
      final List<dynamic> data =
          json.decode(utf8.decode(response.bodyBytes))['results'];

      final List<Video> videos =
          data.map((json) => Video.fromJson(json)).toList();
      return videos;
    } else {
      throw Exception('Failed to load trending videos');
    }
  }
}
