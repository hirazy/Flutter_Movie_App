import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier{

  bool _isLightTheme = true;

  void init(){

  }

  void change(){
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

  bool get isLightTheme => _isLightTheme;
}