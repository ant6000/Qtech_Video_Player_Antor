import 'package:antor_video_player/controllers/video_controller.dart';
import 'package:antor_video_player/widgets/video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final VideoController _videoController = Get.find();
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _videoController.loadMoreVideos();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Videos',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.h),
              Obx(
                () => _videoController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount: _videoController.videos.length,
                          itemBuilder: (context, index) {
                            final video = _videoController.videos[index];
                            return VideoCard(
                              title: video.title,
                              thumbnailUrl: video.thumbnail,
                              channelIconUrl: video.channelImage,
                              uploadedTime: formatApiDate(video.dateAndTime),
                              views: video.viewers,
                              duration: video.duration,
                              onTap: () => _videoController.playVideo(video),
                            );
                          },
                        ),
                      ),
              ),
              _videoController.isFetchingMore
                  ? const CircularProgressIndicator()
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  String formatApiDate(String apiDate) {
    DateTime dateTime = DateTime.parse(apiDate);
    String formattedDate = DateFormat('MMM d, y').format(dateTime.toLocal());
    return formattedDate;
  }
}
