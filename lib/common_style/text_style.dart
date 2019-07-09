import 'package:flutter/material.dart';

// 定义普通输入框的样式
class NormalInputDecoration extends InputDecoration{
  final String hintText;
  
  NormalInputDecoration({@required this.hintText}):super(
    hintText: hintText,
    hintStyle: new TextStyle(fontSize: 12),
    focusedBorder: new OutlineInputBorder(borderSide: BorderSide.none),
    enabledBorder: new OutlineInputBorder(borderSide: BorderSide.none),
    border: new OutlineInputBorder(borderSide: BorderSide.none),
  );
}

class NormalTextField extends TextField{
  final String hintText;

  NormalTextField({@required this.hintText}):super(
    decoration: new NormalInputDecoration(hintText: hintText),
    keyboardType: TextInputType.number,
    textAlign: TextAlign.end,
    style: new TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold
    ),
  );
}