import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulidai_flutter/common_style/text_style.dart';

class BorrowMoney extends StatefulWidget {
  BorrowMoney({Key key}) : super(key: key);

  _BorrowMoneyState createState() => _BorrowMoneyState();
}

class _BorrowMoneyState extends State<BorrowMoney> {
  String _use = '个人日常消费';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromRGBO(254, 249, 243, 1),
      appBar: new AppBar(
        title: new Text('借款'),
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
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
                ),
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: new Text('借款金额'),
                      trailing: new Container(
                        width: 100,
                        child: new NormalTextField(hintText: '输入借款金额'),
                      ),
                    ),
                    new Divider(height: 0),
                    new ListTile(
                      title: new RichText(
                        text: new TextSpan(
                          children: <TextSpan>[
                            new TextSpan(
                              text: '最多可借 ',
                              style: new TextStyle(color: Colors.grey, fontSize: 12)
                            ),
                            new TextSpan(
                              text: '3000',
                              style: new TextStyle(color: Colors.orange, fontSize: 12)
                            ),
                            new TextSpan(
                              text: ' 元，可提前还款',
                              style: new TextStyle(color: Colors.grey, fontSize: 12)
                            )
                          ]
                        ),
                      )
                    )
                  ],
                ),
              ),
              new Container(
                margin: new EdgeInsets.only(top: 8.0),
                padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(new Radius.circular(8.0))
                ),
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: new Text('借款用途'),
                      trailing: new Container(
                        width: 100,
                        child: Text('$_use >', textAlign: TextAlign.end, style: new TextStyle(color: Colors.grey)),
                      ),
                      onTap: () {
                        _showUsePicker(context);
                      },
                    ),
                    new Divider(height: 0),
                    new ListTile(
                      title: new Text('借款方式'),
                      trailing: new Text('7天 >', textAlign: TextAlign.end, style: new TextStyle(color: Colors.grey))
                    ),
                    new Divider(height: 0),
                    new ListTile(
                      title: new Text('还款方式'),
                      trailing: new Text('一次性', textAlign: TextAlign.end, style: new TextStyle(color: Colors.grey))
                    ),
                    new Divider(height: 0),
                    new ListTile(
                      title: new Text('总利息'),
                      trailing: new Text('4.2', textAlign: TextAlign.end, style: new TextStyle(color: Colors.grey))
                    ),
                    new Divider(height: 0),
                    new ListTile(
                      title: new Text('最晚还款时间'),
                      trailing: new Text('12月23日', textAlign: TextAlign.end, style: new TextStyle(color: Colors.grey))
                    ),
                    new Divider(height: 0),
                  ],
                ),
              ),
              new Container(
                width: ScreenUtil().setWidth(400),
                height: 40,
                margin: new EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(181, 144, 85, 1), Color.fromRGBO(255, 196, 140, 1)]
                  )
                ),
                child: new FlatButton(
                  color: Colors.transparent,
                  child: new Text("确定", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () {}
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  // 用途选择器
  _showUsePicker(BuildContext buidlContext) {
    List<String> list = ['个人日常消费', '贷款还贷', '医疗救治急用', '单纯想借钱', '体验人间疾苦'];
    List<Widget> widgetList = new List<Widget>();
    for(var i = 0; i < list.length; i ++) {
      final text = new Center(
        child: new Text(
          list[i], 
          style: new TextStyle(
            fontSize: 20, 
            color: Colors.black, 
            decoration: TextDecoration.none,
            fontWeight: FontWeight.normal,
            textBaseline: TextBaseline.alphabetic
          ),
        ),
      );
      widgetList.add(text);
    }
    
    CupertinoPicker cupertinoDatePicker = new CupertinoPicker(
      children: widgetList, 
      itemExtent: 40.0, 
      onSelectedItemChanged: (int value) {
        setState(() {
          _use = list[value];
        });
      }
    );
    showCupertinoModalPopup(
      builder: (BuildContext context) {
        return new Container(
          height: 200,
          child: cupertinoDatePicker,
        );
      }, 
      context: buidlContext,
    );
  }
}