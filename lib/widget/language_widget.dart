import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/l10n/l10n.dart';

class LanguageWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();

    final locale = Localizations.localeOf(context);

    final flag = L10n.getFlag(locale.languageCode);


    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 72,
        child: Text(
          flag,
          style: TextStyle(fontSize: 80),
        ),
      ),
    );

  }

}