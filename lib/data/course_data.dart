import 'package:course_app/models/course/course_model.dart';
import 'package:course_app/utils/json.dart';

class CourseData {
  Future<List<Course>> getCourses() async {
    

    await Future.delayed(Duration(milliseconds: 100));

    return courses.map((course) => Course.fromJson(course)).toList();
  }
}
