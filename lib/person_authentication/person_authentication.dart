import 'package:flutter/material.dart';
import 'package:gulidai_flutter/person_authentication/page_one.dart';
import 'package:gulidai_flutter/person_authentication/page_three.dart';
import 'package:gulidai_flutter/person_authentication/page_two.dart';

class PersonAuthentication extends StatefulWidget {
  PersonAuthentication({Key key}) : super(key: key);

  _PersonAuthenticationState createState() => _PersonAuthenticationState();
}

class _PersonAuthenticationState extends State<PersonAuthentication> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromRGBO(254, 249, 243, 1),
      appBar: new AppBar(
        title: new Text('个人信息认证'),
        backgroundColor: Colors.white,
      ),
      body: new Container(
        padding: new EdgeInsets.all(8.0),
        width: double.infinity,
        height: double.infinity,
        child: new SingleChildScrollView(
          child: new Container(
            padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
            ),
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.only(bottom: 24.0),
                  child: new Image.asset('assets/images/gulidai4.png', fit: BoxFit.cover),
                ),
                new ListTile(
                  title: new Text('实名身份认证'),
                  trailing: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text('未认证', style: new TextStyle(
                        color: Colors.grey
                      )),
                      new Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new PageOne()
                    ));
                  },
                ),
                new Divider(height: 0),
                new ListTile(
                  title: new Text('添加银行卡'),
                  trailing: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text('未添加', style: new TextStyle(
                        color: Colors.grey
                      )),
                      new Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new PageTwo()
                    ));
                  },
                ),
                new Divider(height: 0),
                new ListTile(
                  title: new Text('绑定手机号'),
                  trailing: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text('未绑定', style: new TextStyle(
                        color: Colors.grey
                      )),
                      new Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new PageThree()
                    ));
                  },
                ),
                new Divider(height: 0),
                new ListTile(
                  title: new Text('添加常用联系人'),
                  trailing: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text('未添加', style: new TextStyle(
                        color: Colors.grey
                      )),
                      new Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    ],
                  ),
                ),
                new Divider(height: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}