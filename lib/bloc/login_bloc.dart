import 'package:rxdart/rxdart.dart';

class LoginBloc {
  LoginInfo _loginInfo;

  BehaviorSubject<LoginInfo> _behaviorSubject = new BehaviorSubject<LoginInfo>();
  Observable<LoginInfo> get stream => _behaviorSubject.stream;
  LoginInfo get loginInfo => _loginInfo;

  // 添加登录信息
  addLoginInfo(LoginInfo loginInfo) {
    _loginInfo = loginInfo;
    _behaviorSubject.add(_loginInfo);
  }

}

class LoginInfo {
  String phone;
  String code;

  LoginInfo({this.phone, this.code});
}