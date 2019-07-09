import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gulidai_flutter/common_style/text_style.dart';
import 'package:image_picker/image_picker.dart';

class PageOne extends StatefulWidget {
  PageOne({Key key}) : super(key: key);

  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  File _imageIDCard1;
  File _imageIDCard2;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromRGBO(254, 249, 243, 1),
      appBar: new AppBar(
        title: new Text('实名身份认证'),
        backgroundColor: Colors.white,
      ),
      body: new Container(
        width: double.infinity,
        height: double.infinity,
        padding: new EdgeInsets.all(8.0),
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
                  color: Colors.white,
                ),
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: new Text('姓名'),
                      trailing: new Container(
                        width: 100,
                        child: new NormalTextField(hintText: '输入姓名'),
                      )
                    ),
                    new Divider(height: 0),
                    new ListTile(
                      title: new Text('身份证号'),
                      trailing: new Container(
                        width: 200,
                        child: new NormalTextField(hintText: '输入身份证号'),
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
                    image: _imageIDCard1 != null 
                           ? new DecorationImage(image: new FileImage(_imageIDCard1)) 
                           : null
                  ),
                  child: _imageIDCard1 == null 
                        ? new Center(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(Icons.cloud_upload),
                                new Text('上传身份证正面照片'),
                              ],
                            ),
                          ) 
                        : null,
                ),
                onTap: () {
                  _showImagePicker(context: context);
                },
              ),
              new GestureDetector(
                child: new Container(
                  height: 200,
                  margin: new EdgeInsets.only(top: 20.0),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
                    image: _imageIDCard2 != null 
                           ? new DecorationImage(image: new FileImage(_imageIDCard2)) 
                           : null
                  ),
                  child: _imageIDCard2 == null 
                        ? new Center(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(Icons.cloud_upload),
                                new Text('上传身份证背面照片'),
                              ],
                            ),
                          ) 
                        : null,
                ),
                onTap: () {
                  _showImagePicker(context: context, isIdcardFront: false);
                },
              ),
              new Container(
                width: 300,
                height: 40,
                margin: new EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(181, 144, 85, 1), Color.fromRGBO(255, 196, 140, 1)]
                  )
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

  // 展示相机、图片选择 bottomSheet 层
  _showImagePicker({@required BuildContext context, isIdcardFront: true}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return new Container(
          height: 100,
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new GestureDetector(
                child: new Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.white,
                  child: new Center(
                    child: new Text('使用相机'),
                  ),
                ),
                onTap: () {
                  if (isIdcardFront) {
                    _getImage1();
                  } else {
                    _getImage2();
                  }
                  Navigator.pop(context);
                },
              ),
              new Divider(height: 0),
              new GestureDetector(
                child: new Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.white,
                  child: new Center(
                    child: new Text('从相册中选择'),
                  ),
                ),
                onTap: () {
                  _noticeCantUsePhoto(context: context);
                },
              ),
            ],
          ),
        );
      }
    );
  }

  Future _getImage1() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageIDCard1 = image;
    });
  }

  Future _getImage2() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageIDCard2 = image;
    });
  }

  // dialog 提示
  _noticeCantUsePhoto({@required BuildContext context}) async {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提示'),
          content: new Text('暂时只允许拍摄上传身份证件'),
          actions: <Widget>[
            FlatButton(
              child: Text('知道了'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}