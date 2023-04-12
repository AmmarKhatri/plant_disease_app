import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_app/globals.dart';
import 'dart:typed_data';
import 'package:plant_app/models/predict.response.dart';
import 'package:http/http.dart' as http;

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

  Future<PredictResponse> predictImage() async {
    final url = Uri.parse('$site/predict');
    final file = await http.MultipartFile.fromPath('file', temporaryImage.value.path);
    final request = http.MultipartRequest('POST', url)
      ..files.add(file);
    final response = await request.send();
    final responseData = await response.stream.bytesToString();
    if (response.statusCode == 201) {
      var res = PredictResponse.fromJson(json.decode(responseData));
      return res;
    } else {
      throw Exception('Error uploading file');
    }
  }
}