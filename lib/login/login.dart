import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulidai_flutter/bloc/login_bloc.dart';
import 'package:gulidai_flutter/home/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _validateCodeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 依据6s的尺寸
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: new Column(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.only(top: 20),
            child: new Image.asset('assets/images/gulidai1.png', fit: BoxFit.cover)
          ),
          new Container(
            width: ScreenUtil().setWidth(500),
            child: new TextField(
              controller: _phoneController,
              decoration: new InputDecoration(
                hintText: "请输入手机号码",
                hintStyle: new TextStyle(
                  fontSize: ScreenUtil().setSp(24)
                ),
                contentPadding: new EdgeInsets.fromLTRB(8, 16, 8, 16),
                enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Color(0xffdcdcdc)))
              ),
              keyboardType: TextInputType.number
            )
          ),
          new Container(
            width: ScreenUtil().setWidth(500),
            child: new TextField(
              controller: _validateCodeController,
              decoration: new InputDecoration(
                hintText: "请输入短信验证码",
                hintStyle: new TextStyle(
                  fontSize: ScreenUtil().setSp(24)
                ),
                contentPadding: new EdgeInsets.fromLTRB(8, 16, 8, 16),
                suffixIcon: new Container(
                  width: 100,
                  child: new Center(
                    child: new Text("获取验证码", style: new TextStyle(color: Colors.orangeAccent, fontSize: ScreenUtil().setSp(24)))
                  )
                ),
                enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: Color(0xffdcdcdc)))
              ),
              keyboardType: TextInputType.number
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 16.0),
            child: new ClipRRect(
              borderRadius: new BorderRadius.all(new Radius.circular(100)),
              child: new Container(
                width: ScreenUtil().setWidth(500),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(181, 144, 85, 1), Color.fromRGBO(255, 196, 140, 1)]
                  )
                ),
                child: new FlatButton(
                  color: Colors.transparent,
                  child: new Text("登录", style: new TextStyle(color: Colors.white)),
                  onPressed: () {
                    if (_phoneController.text != '' && _validateCodeController.text != '') {
                      LoginInfo _loginInfo = new LoginInfo();
                      _loginInfo.phone = _phoneController.text;
                      _loginInfo.code = _validateCodeController.text;
                      Provider.of<LoginBloc>(context).addLoginInfo(_loginInfo);

                      _setLoginStatus(_phoneController.text);

                      Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(
                          builder: (BuildContext b) {
                            return new Home();
                          }
                        ),
                        (route) => false,
                      );
                    }
                  },
                )
              )
            )
          )
        ]
      )
    );
  }

  _setLoginStatus(String phone) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('loginStatus', true);
    sharedPreferences.setString('phone', phone);
    print('设置登录状态为true');
  }
}