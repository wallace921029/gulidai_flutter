import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulidai_flutter/borrow/borrow_money.dart';
import 'package:gulidai_flutter/person_authentication/person_authentication.dart';

class Borrow extends StatefulWidget {
  Borrow({Key key}) : super(key: key);

  _BorrowState createState() => _BorrowState();
}

class _BorrowState extends State<Borrow> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        // 图片
        new Container(
          child: new Image.asset("assets/images/gulidai2.png"),
        ),
        new Container(
          height: 150,
          child: new Stack(
            children: <Widget>[
              new Positioned(
                child: new ClipPath(
                  clipper: new MyCustomClipper(),
                  child: Container(
                    height: 100,
                    decoration: new BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromRGBO(189, 154, 95, 1), Color.fromRGBO(206, 174, 117, 1)]
                      )
                    )
                  ),
                ),
              ),
              new Positioned(
                left: ScreenUtil().setWidth(25),
                child: new Container(
                  width: ScreenUtil().setWidth(700),
                  height: 120,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    boxShadow: [new BoxShadow(color: Color(0xffCCCCCC), offset: new Offset(0, 2) ,blurRadius: 2.0)],
                    borderRadius: new BorderRadius.all(new Radius.circular(16.0))
                  ),
                  child: new Column(
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.only(top: 16),
                        child: new Text("您的可申请借款额度（元）", style: new TextStyle(fontSize: 14, color: Colors.grey))
                      ),
                      new Text("¥3000 - 6000", style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      new Container(
                        width: ScreenUtil().setWidth(400),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
                          gradient: LinearGradient(
                            colors: [Color.fromRGBO(181, 144, 85, 1), Color.fromRGBO(255, 196, 140, 1)]
                          )
                        ),
                        child: new FlatButton(
                          color: Colors.transparent,
                          child: new Text("去借钱", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new BorrowMoney()
                            ));
                          }
                        )
                      )
                    ]
                  )
                )
              )
            ],
          ),
        ),
        new GestureDetector(
          child: new Container(
            width: ScreenUtil().setWidth(700),
            child: new Image.asset("assets/images/gulidai3.png", fit: BoxFit.cover)
          ),
          onTap: () {
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new PersonAuthentication()
            ));
          }
        )
      ]
    );
  }
}


class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var difHeight = 50.0;
    var path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - difHeight);
    var p1 = new Offset(size.width / 2, size.height);
    var p2 = new Offset(size.width, size.height - difHeight);
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.lineTo(size.width, size.height - difHeight);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}