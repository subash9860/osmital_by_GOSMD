import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  get_image() async {
    XFile? new_image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      image = new_image;
    });
    log(image?.path.toString() ?? '');
  }

  get_image_from_gallary() async {
    XFile? new_image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = new_image;
    });
    log(image?.path.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    var size, height;
    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Send Accident Image to police station",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: (image == null)
                    ? Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 1),
                              blurRadius: 7.0,
                            )
                          ],
                          image: DecorationImage(
                              image: AssetImage('./assets/addimage.png')),
                        ),
                        child: Icon(
                          Icons.add_a_photo,
                          size: 80,
                        ),
                      )
                    : Image(
                        image: FileImage(File(image?.path ?? '')),
                        height: 300,
                        width: 300,
                      ),
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 246, 68, 68)),
                    onPressed: () {
                      get_image_from_gallary();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.photo),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Select form gallary"),
                      ],
                    )),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 246, 68, 68)),
                    onPressed: () {
                      get_image();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 20,
                        ),
                        Text("upload image from cammera "),
                      ],
                    )),
              ),
              SizedBox(
                height: size.height / 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 246, 68, 68)),
                  onPressed: () {
                  
                  },
                  child: const Text("Send to police Station ", style: TextStyle(fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}
