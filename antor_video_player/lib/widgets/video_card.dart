import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoCard extends StatelessWidget {
  final String thumbnailUrl;
  final String channelIconUrl;
  final String title;
  final String views;
  final String uploadedTime;
  final String duration;
  final VoidCallback onTap;
  const VideoCard(
      {super.key,
      required this.thumbnailUrl,
      required this.channelIconUrl,
      required this.title,
      required this.views,
      required this.uploadedTime,
      required this.duration,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  thumbnailUrl,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Image.network(
                        'https://mahfilbucket.s3.amazonaws.com/media_test/video_content_thumbnail/mob_thumbnail_iSF2BuYYZg_Mahfil_Waz_1.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA5G25YRBXUVQTFY73%2F20231230%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20231230T104040Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=86724dafd85592d3c2a4642f333d653c24016a0428ec1bfd6ded3e7d67a326cb');
                  },
                  fit: BoxFit.cover,
                  height: 200.h,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 8.0,
                  right: 8.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      duration,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(channelIconUrl),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.tiroBangla(
                              fontSize: 15.sp, fontWeight: FontWeight.w600),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          '$views views • $uploadedTime',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/more_vert.png',
                    height: 24,
                    width: 24,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
