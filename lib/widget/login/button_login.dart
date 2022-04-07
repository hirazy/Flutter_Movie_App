import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {

  ButtonLogin({
    Key? key,
    required this.handleClick
  }): super(key: key);

  final VoidCallback handleClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handleClick,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          "Login"
        ),
      ),
    );
  }

}