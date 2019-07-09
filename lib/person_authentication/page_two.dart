import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gulidai_flutter/common_style/text_style.dart';
import 'package:image_picker/image_picker.dart';

class PageTwo extends StatefulWidget {
  PageTwo({Key key}) : super(key: key);

  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  File _image;
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromRGBO(254, 249, 243, 1),
      appBar: new AppBar(
        title: new Text('添加银行卡'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: new EdgeInsets.all(8.0),
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
                ),
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: new Text('持卡人姓名'),
                      trailing: new Container(
                        width: 150,
                        child: new NormalTextField(hintText: '请输入持卡人姓名'),
                      ),
                    ),
                    new Divider(height: 0),
                    new ListTile(
                      title: new Text('卡号'),
                      trailing: new Container(
                        width: 150,
                        child: new NormalTextField(hintText: '请输入卡号'),
                      ),
                    ),
                  ],
                ),
              ),
              new GestureDetector(
                child: new Container(
                  height: 200,
                  margin: new EdgeInsets.only(top: 20.0),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
                    image: _image == null 
                           ? null 
                           : new DecorationImage(image: FileImage(_image)),
                  ),
                  child: _image == null 
                         ? new Center(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(Icons.cloud_upload),
                                new Text('上传银行卡正面照片'),
                              ],
                            ),
                          )
                          : null,
                ),
                onTap: () {
                  _showBottomSheet(context);
                },
              ),
              new Container(
                margin: new EdgeInsets.only(top: 20.0),
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(181, 144, 85, 1), Color.fromRGBO(255, 196, 140, 1)],
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(1000)),
                ),
                child: new FlatButton(
                  child: new Text('提交'),
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      builder: (BuildContext context) {
        return new Container(
          height: 80,
          child: new Column(
            children: <Widget>[
              new GestureDetector(
                child: new Container(
                  height: 40,
                  color: Colors.white,
                  child: new Center(
                    child: new Text('拍照'),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImageFromCamera();
                },
              ),
              new Divider(height: 0),
              new GestureDetector(
                child: new Container(
                  height: 40,
                  color: Colors.white,
                  child: new Center(
                    child: new Text('从相册选择'),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImageFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future _getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}