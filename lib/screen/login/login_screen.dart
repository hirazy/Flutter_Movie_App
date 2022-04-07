import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/locale_provider.dart';
import '../../widget/login/button_login.dart';

class LoginScreen extends StatefulWidget{
  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>{
  
  
  @override
  Widget build(BuildContext context) {

    var localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ButtonLogin(
              handleClick: () => {

            },)
          ],
        )
      ),
    );

  }

}