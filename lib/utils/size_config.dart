import 'package:flutter/cupertino.dart';

class SizeConfig {

  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  // SizeConfig._privateInit();

  // static final SizeConfig _instance = SizeConfig._privateInit();

  // factory SizeConfig(BuildContext context){
  //   if(_mediaQueryData == null){
  //     _mediaQueryData = MediaQuery.of(context);
  //     screenWidth = _mediaQueryData.size.width;
  //     screenHeight = _mediaQueryData.size.height;
  //     orientation = _mediaQueryData.orientation;
  //   }
  //   return _instance;
  // }

  double get width => screenWidth;

  SizeConfig(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

   init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 896 is the layout height that designer use
  // or you can say iPhone 11
  return (inputHeight / 896.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 414 is the layout width that designer use
  return (inputWidth / 414.0) * screenWidth;
}