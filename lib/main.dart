import 'package:flutter/material.dart';
import 'package:gulidai_flutter/bloc/login_bloc.dart';
import 'package:gulidai_flutter/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    // new MultiProvider(
    //   providers: <SingleChildCloneableWidget>[
    //     Provider<LoginBloc>.value(value: new LoginBloc())
    //   ],
    //   child: new MyApp()
    // )
    new MyApp()
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MultiProvider(
      providers: <SingleChildCloneableWidget>[
        Provider<LoginBloc>.value(value: new LoginBloc())
      ],
      child: new MaterialApp(
        title: '谷粒贷',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          splashColor: Colors.transparent
        ),
        home: new Home(),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}