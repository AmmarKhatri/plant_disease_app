import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_app/controllers/image.controller.dart';

class Selection extends StatelessWidget {
  const Selection({super.key});

  @override
  Widget build(BuildContext context) {
    final ImageController imageController = Get.put(ImageController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 168, 115, 45),
        title: const Text("Choose an image"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
            () => 
            imageController.isPresent.value 
            ? SizedBox(
              width: 200,
              height: 200,
              child: Image.file(
                  File(imageController.temporaryImage.value.path),
                ),
            )
            : Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.grey[200]
              ),
              width: 200,
              height: 200,
              child: Center(
                child: Text(
                  "No image selected",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: (){
                    imageController.pickImage(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.image_outlined),
                  label: const Padding(
                    padding: EdgeInsets.fromLTRB(16,5,16,5),
                    child: Text("Pick from Gallery"),
                  ),
                  style: TextButton.styleFrom(
                    elevation: 5,
                    foregroundColor: const Color.fromARGB(255, 240, 231, 227),
                    backgroundColor: const Color.fromARGB(176, 184, 86, 48)
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: (){
                    imageController.pickImage(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: const Padding(
                    padding: EdgeInsets.fromLTRB(4,5,4,5),
                    child: Text("Capture with Camera"),
                  ),
                  style: TextButton.styleFrom(
                    elevation: 5,
                    foregroundColor: const Color.fromARGB(255, 240, 231, 227),
                    backgroundColor: const Color.fromARGB(176, 184, 86, 48)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 218, 189, 150),
      floatingActionButton: Obx(() => imageController.isPresent.value ? Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: FloatingActionButton(
                onPressed: () async {
                  try{ 
                  var response = await imageController.predictImage();
                  Get.defaultDialog(
                    titlePadding: EdgeInsets.all(20),
                    title: "Prediction Accuracy: ${response.accuracy}",
                    middleText: response.type,
                    confirm: TextButton(
                      onPressed: (){
                         Get.back();
                      },
                      child: const Text("Ok"),
                    )
                  );
                  } catch(e){
                    Get.defaultDialog(
                    titlePadding: const EdgeInsets.all(20),
                    title: e.toString(),
                    middleText: "Please report this issue",
                    cancel: TextButton(
                      onPressed: (){
                         Get.back();
                      },
                      child: const Text("Ok"),
                    )
                  );
                  }
                },
                backgroundColor: const Color.fromARGB(255, 73, 52, 44),
                tooltip: "Classify image",
                child: imageController.isLoading.value ? const CircularProgressIndicator(
                  color: Colors.white,
                ) : const Icon(Icons.image_search_outlined),
              ),
            ): Container()),
    );
  }
}