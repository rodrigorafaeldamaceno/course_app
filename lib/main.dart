import 'package:course_app/routes.dart';
import 'package:course_app/utils/tema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coopercredi',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: Tema.corPrincipal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Tema.fundo,
        primarySwatch: Colors.blueGrey,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Tema.fundo,
          // iconTheme: IconThemeData(
          //   color: Colors.black38,
          // ),
          // textTheme: TextTheme(
          //   headline6: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 16,
          //     color: Colors.black38,
          //   ),
          // ),
        ),
      ),
    );
  }
}
