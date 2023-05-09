import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/views/selection.dart';
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/plantbackground.jpeg"),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                height: 250,
              ),
              Card(
                elevation: 20,
                color: const Color.fromARGB(82, 141, 90, 90),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8,0,8,0),
                  child: Text("Plant Disease Detection", style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 227, 236, 218)
                  ),),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  elevation: 20,
                  color: Color.fromARGB(96, 56, 207, 56),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text("Provide us with an image and we will let you know your plant's health", style: GoogleFonts.poppins(
                      fontSize:16,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 235, 223, 219)
                    ),
                    textAlign: TextAlign.center,
                    ),
                  ),
                )
              ),
              TextButton.icon(
                onPressed: (){
                  Get.to(() => const Selection());
                }, 
                icon: const Icon(Icons.image), 
                label: Text("Get Started!", style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),),
                style: TextButton.styleFrom(
                  elevation: 20,
                  foregroundColor: const Color.fromARGB(255, 240, 231, 227),
                  backgroundColor: const Color.fromARGB(200, 211, 137, 108)
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}