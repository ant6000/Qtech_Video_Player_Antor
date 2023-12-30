import 'package:antor_video_player/model/video.dart';
import 'package:antor_video_player/pages/video_details_page.dart';
import 'package:antor_video_player/services/video_service.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  final VideoService _videoService = VideoService();
  final RxList<Video> videos = <Video>[].obs;
  RxBool isLoading = false.obs;
  int currentPage = 1;
  int content_page = 1;
  bool isFetchingMore = false;

  @override
  void onInit() {
    super.onInit();
    fetchTrendingVideos(content_page, currentPage);
  }

  Future<void> fetchTrendingVideos(int contentPage, int page) async {
    try {
      isLoading.toggle();
      final result = await _videoService.fetchTrendingVideos(contentPage, page);
      videos.addAll(result);
    } catch (e) {
      print('Error fetching trending videos: $e');
    } finally {
      isLoading.toggle();
    }
  }

  Future<void> loadMoreVideos() async {
    if (!isFetchingMore) {
      isFetchingMore = true;
      content_page++;
      await fetchTrendingVideos(content_page, currentPage);
    }
  }

  playVideo(Video video) {
    Get.to(
      () => VideoDetailsPage(
        video: video,
      ),
    );
  }
}
