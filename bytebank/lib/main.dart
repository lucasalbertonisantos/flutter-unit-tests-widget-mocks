import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/widgets/app_dependencies.dart';
import 'package:flutter/material.dart';

import 'database/dao/contact_dao.dart';

void main() => runApp(MyApp(contactDao: ContactDao()));

class MyApp extends StatelessWidget {
  final ContactDao contactDao;

  MyApp({@required this.contactDao});

  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      contactDao: this.contactDao,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: Dashboard(),
      ),
    );
  }
}
