import 'package:antor_video_player/controllers/video_controller.dart';
import 'package:get/get.dart';

class ViesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(VideoController());
  }
}
