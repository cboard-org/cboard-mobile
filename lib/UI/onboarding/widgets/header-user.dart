import 'dart:io';

import 'package:cboard_mobile/services/utils.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class UserHeader extends StatefulWidget {
  bool shouldSetPhoto;

  UserHeader({Key key, this.shouldSetPhoto = true}) : super(key: key);

  @override
  _UserHeaderState createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeader> {
  File _profilePicture;

  Future<File> _cropUtility(File file) async {
    return await ImageCropper.cropImage(
        sourcePath: file.path,
        compressQuality: 70,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: "Edit Profile Picture",
            toolbarColor: white,
            toolbarWidgetColor: Colors.black));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          widget.shouldSetPhoto
              ? Container(
                  child: Image.asset('assets/images/user.png',
                      scale: 0.75, fit: BoxFit.fill),
                )
              : Container(
                  width: screenWidth / 5,
                  height: screenHeight / 10,
                  child: Image.file(_profilePicture,
                      scale: 0.55, fit: BoxFit.fill),
                ),
          widget.shouldSetPhoto
              ? InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                              height: 180,
                              child: Container(
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        "Choose",
                                        style: CustomTypography.Typography
                                            .header(),
                                      ),
                                    ),
                                    InkWell(
                                      child: ListTile(
                                        leading: Icon(Icons.photo_camera),
                                        title: Text("Camera"),
                                      ),
                                      onTap: () async {
                                        final file = await Utils.pickMedia(
                                            isGallery: false,
                                            cropImage: _cropUtility);
                                        if (file != null) {
                                          setState(() {
                                            _profilePicture = file;
                                          });
                                          widget.shouldSetPhoto = false;
                                        }
                                        Navigator.pop(context);
                                      },
                                    ),
                                    InkWell(
                                        child: ListTile(
                                            leading: Icon(Icons.photo_library),
                                            title: Text("Gallery")),
                                        onTap: () async {
                                          final file = await Utils.pickMedia(
                                              isGallery: true,
                                              cropImage: _cropUtility);
                                          if (file != null) {
                                            setState(() {
                                              _profilePicture = file;
                                            });
                                            widget.shouldSetPhoto = false;
                                          }
                                          Navigator.pop(context);
                                        })
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: Container(
                    child: Text(
                      'Set Photo',
                      style: TextStyle(color: electric_violet),
                    ),
                    margin: EdgeInsets.only(top: 5),
                  ),
                )
              : Container()
        ],
      ),
      color: white,
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
    );
  }
}
