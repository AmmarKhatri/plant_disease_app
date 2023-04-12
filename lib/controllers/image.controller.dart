import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var isPresent = false.obs;
  var temporaryImage = XFile("").obs;
  
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      temporaryImage.value = XFile(image.path);
      isPresent.value = true;
    } on PlatformException catch (e){
      print("Platform exception: $e");
    }
  }
}