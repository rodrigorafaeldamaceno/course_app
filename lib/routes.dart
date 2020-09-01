import 'package:course_app/models/course/course_model.dart';
import 'package:course_app/screens/course/course_details_screen.dart';
import 'package:course_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static const String home = '/home';
  static const String courseDetails = '/course_details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    print(args);
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case courseDetails:
        return MaterialPageRoute(
            builder: (_) => CourseDetailsScreen(course: args as Course));
        break;

      default:
        _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Erro'),
        ),
        body: Container(
          child: Text('Rota não definida'),
        ),
      );
    });
  }
}
