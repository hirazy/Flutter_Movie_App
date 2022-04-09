import 'package:flutter/material.dart';

class L10n{
  static final all = [
       Locale('en'),
       Locale('ar'),
       Locale('hi'),
       Locale('es'),
       Locale('hi'),
        Locale('vn')
  ];

  static String getFlag(String code){
    switch(code){
      case 'ar':
        return '🇦🇪';
      case 'hi':
        return '🇮🇳';
      case 'es':
        return '🇪🇸';    
      case 'de':
        return '🇩🇪';
      case 'vn':
        return 'vn';
      case 'en':
      default:
        return '🇺🇸';  
    }
  }
}