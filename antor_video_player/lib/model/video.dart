// class Video {
//   String thumbnail;
//   int id;
//   String title;
//   String dateAndTime;
//   String slug;
//   String createdAt;
//   String manifest;
//   int liveStatus;
//   String? liveManifest;
//   bool isLive;
//   String channelImage;
//   String channelName;
//   String? channelUsername;
//   bool isVerified;
//   String channelSlug;
//   String channelSubscriber;
//   int channelId;
//   String type;
//   String viewers;
//   String duration;
//   String objectType;

//   Video({
//     required this.thumbnail,
//     required this.id,
//     required this.title,
//     required this.dateAndTime,
//     required this.slug,
//     required this.createdAt,
//     required this.manifest,
//     required this.liveStatus,
//     this.liveManifest,
//     required this.isLive,
//     required this.channelImage,
//     required this.channelName,
//     this.channelUsername,
//     required this.isVerified,
//     required this.channelSlug,
//     required this.channelSubscriber,
//     required this.channelId,
//     required this.type,
//     required this.viewers,
//     required this.duration,
//     required this.objectType,
//   });

//   factory Video.fromJson(Map<String, dynamic> json) {
//     return Video(
//       thumbnail: json['thumbnail'],
//       id: json['id'],
//       title: json['title'],
//       dateAndTime: json['date_and_time'],
//       slug: json['slug'],
//       createdAt: json['created_at'],
//       manifest: json['manifest'],
//       liveStatus: json['live_status'],
//       liveManifest: json['live_manifest'],
//       isLive: json['is_live'],
//       channelImage: json['channel_image'],
//       channelName: json['channel_name'],
//       channelUsername: json['channel_username'],
//       isVerified: json['is_verified'],
//       channelSlug: json['channel_slug'],
//       channelSubscriber: json['channel_subscriber'],
//       channelId: json['channel_id'],
//       type: json['type'],
//       viewers: json['viewers'],
//       duration: json['duration'],
//       objectType: json['object_type'],
//     );
//   }
// }

class Video {
  String thumbnail;
  int id;
  String title;
  String dateAndTime;
  String slug;
  String createdAt;
  String? manifest;
  int liveStatus;
  String? liveManifest;
  bool isLive;
  String channelImage;
  String channelName;
  String? channelUsername;
  bool isVerified;
  String channelSlug;
  String channelSubscriber;
  int channelId;
  String type;
  String viewers;
  String duration;
  String objectType;

  Video({
    required this.thumbnail,
    required this.id,
    required this.title,
    required this.dateAndTime,
    required this.slug,
    required this.createdAt,
    required this.manifest,
    required this.liveStatus,
    this.liveManifest,
    required this.isLive,
    required this.channelImage,
    required this.channelName,
    this.channelUsername,
    required this.isVerified,
    required this.channelSlug,
    required this.channelSubscriber,
    required this.channelId,
    required this.type,
    required this.viewers,
    required this.duration,
    required this.objectType,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      thumbnail: json['thumbnail'],
      id: json['id'],
      title: json['title'],
      dateAndTime: json['date_and_time'],
      slug: json['slug'],
      createdAt: json['created_at'],
      manifest: json['manifest'],
      liveStatus: json['live_status'],
      liveManifest: json['live_manifest'],
      isLive: json['is_live'],
      channelImage: json['channel_image'],
      channelName: json['channel_name'],
      channelUsername: json['channel_username'],
      isVerified: json['is_verified'],
      channelSlug: json['channel_slug'],
      channelSubscriber: json['channel_subscriber'],
      channelId: json['channel_id'],
      type: json['type'],
      viewers: json['viewers'],
      duration: json['duration'],
      objectType: json['object_type'],
    );
  }
}
