import 'package:antor_video_player/model/video.dart';
import 'package:antor_video_player/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoDetailsPage extends StatefulWidget {
  final Video video;
  const VideoDetailsPage({required this.video, super.key});

  @override
  State<VideoDetailsPage> createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.video.manifest.toString()))
          ..initialize().then((_) {
            setState(() {});
            _controller.play(); 
          });
  }

  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayer(_controller),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.video.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '${widget.video.viewers} views . 3 days ago',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                    SizedBox(height: 16.h),
                    //  like, dislike, share, report buttons 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          icon: Icons.favorite_outline,
                          text: 'MASH ALLAH (12K)',
                        ),
                        CustomButton(
                          icon: Icons.thumb_up_alt_outlined,
                          text: 'LIKE',
                          num: '(12K)',
                        ),
                        CustomButton(
                          icon: Icons.share_outlined,
                          text: 'SHARE',
                        ),
                        CustomButton(
                          icon: Icons.flag_outlined,
                          text: 'REPORT',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundImage:
                                    NetworkImage(widget.video.channelImage),
                              ),
                              SizedBox(width: 8.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.video.channelName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '${widget.video.channelSubscriber} Subscriber',
                                    style:const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('+ Subscribe'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Comments  7.5K'),
                        Image.asset('assets/arrow.png')
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: const Icon(Icons.send)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
