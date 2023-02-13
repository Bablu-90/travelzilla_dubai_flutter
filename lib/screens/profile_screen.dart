import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  TextEditingController travelController = TextEditingController();

  final ImagePicker picker = ImagePicker();
  File? selectedImage;

  takeImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget imageLogo() {
      return Container(
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Travelzillalogo.PNG"),
            fit: BoxFit.fill,
          ),
        ),
        height: Get.height * 0.3,
        child: Container(
          height: Get.height * 0.2,
          width: Get.width,
          margin: EdgeInsets.only(bottom: Get.height * 0.05),
        ),
      );
    }

    TextFormFieldWidget(
        String title, IconData iconData, TextEditingController controller) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 80),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'NAME',
                    labelText: 'Name',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'ADDRESS',
                      labelText: 'Address',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'TRAVEL DESTINATION',
                      labelText: 'Travel Destination',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                )
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              child: Stack(
                children: <Widget>[
                  imageLogo(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        takeImage(ImageSource.camera);
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white70,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.camera_alt_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormFieldWidget(
                      'Name', Icons.person_outline, nameController),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormFieldWidget(
                      'Address', Icons.home_outlined, homeController),
                  SizedBox(height: 10),
                  TextFormFieldWidget('Travel Destination',
                      Icons.place_outlined, travelController),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
