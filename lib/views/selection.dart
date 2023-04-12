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
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.grey[200]
              ),
              // color: Colors.grey,
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
            ),
            const SizedBox(
              height: 70,
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
                    foregroundColor: Color.fromARGB(255, 240, 231, 227),
                    backgroundColor: Color.fromARGB(176, 184, 86, 48)
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
                    foregroundColor: Color.fromARGB(255, 240, 231, 227),
                    backgroundColor: Color.fromARGB(176, 184, 86, 48)
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 218, 189, 150),
    );
  }
}