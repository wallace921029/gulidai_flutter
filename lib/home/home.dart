import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulidai_flutter/borrow/borrow.dart';
import 'package:gulidai_flutter/login/login.dart';
import 'package:gulidai_flutter/my/my.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _list = new List<Widget>();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _getLoginStatus();
    _list.addAll([new Borrow(), new MyPage()]);
  }

  _getLoginStatus() async {
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    bool loginStatus = sharedPreferences.getBool('loginStatus');
    if (loginStatus == null) {
      print('未检测到登录状态');
      Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new Login()
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new Scaffold(
      backgroundColor: Colors.white,
      body: _list[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        elevation: 0,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.ac_unit),
            title: new Text('借钱')
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('我的')
          )
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      )
    );
  }
}