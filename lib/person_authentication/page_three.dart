import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gulidai_flutter/common_style/text_style.dart';

class PageThree extends StatefulWidget {
  PageThree({Key key}) : super(key: key);

  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromRGBO(254, 249, 243, 1),
      appBar: new AppBar(
        title: new Text('绑定手机号码'),
        backgroundColor: Colors.white,
      ),
      body: new Container(
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
                      title: new Text('手机号'),
                      trailing: new Container(
                        width: 100,
                        child: new NormalTextField(hintText: '请输入手机号'),
                      ),
                    ),
                    new Divider(height: 0),
                    new ListTile(
                      title: new Text('验证码'),
                      trailing: new Container(
                        width: 100,
                        child: new NormalTextField(hintText: '请输入验证码'),
                      ),
                    ),
                    new Divider(height: 0),
                    new Container(
                      width: double.infinity,
                      child: new FlatButton(
                        child: new Text('获取验证码', style: new TextStyle(
                          color: Colors.orange,
                        )),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}