import 'package:flutter/material.dart';

import '../../l10n/localization_helper.dart';

class ErrorRoutePage extends StatelessWidget {
  const ErrorRoutePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getLocalizations(context).errorRoutPageTitle)),
      backgroundColor: Colors.redAccent[100],
      body: Center(
        child: Text(
          getLocalizations(context).errorRoutPageDescribe,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.red[800],
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
