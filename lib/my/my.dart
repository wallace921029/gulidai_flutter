import 'package:flutter/material.dart';
import 'package:gulidai_flutter/bloc/login_bloc.dart';
import 'package:gulidai_flutter/login/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String _phone;
  
  @override
  void initState() { 
    super.initState();
    _getPhone();
  }

  _getPhone() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _phone = sharedPreferences.getString('phone');
  setState(() {
    _phone = sharedPreferences.getString('phone');
  });
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<LoginInfo>(
              stream: Provider.of<LoginBloc>(context).stream,
              initialData: Provider.of<LoginBloc>(context).loginInfo,
              builder: (BuildContext context, AsyncSnapshot<LoginInfo> snapshot) {
                return  new Text('用户 $_phone 您好！');
              },
            ),
            new FlatButton(
              color: Colors.orange,
              textColor: Colors.white,
              child: new Text('清除登录信息$_phone'),
              onPressed: () async {
                SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.remove('loginStatus');
                Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new Login()
                  ),
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}