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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Search  ',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "upload the image ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () {
                get_image();
              },
              child: (image == null)
                  ? Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 2),
                            blurRadius: 20.0,
                          )
                        ],
                        image: DecorationImage(
                            image: AssetImage('./assets/addimage.png')),
                      ),
                    )
                  : Image(
                      image: FileImage(File(image?.path ?? '')),
                      height: 300,
                      width: 100,
                    ),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    get_image_from_gallary();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.photo),
                      SizedBox(
                        width: 20,
                      ),
                      Text("upload image from gallary "),
                    ],
                  )),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
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
            ElevatedButton(onPressed: () {}, child: const Text("upload "))
          ],
        ),
      ),
    );
  }
}
