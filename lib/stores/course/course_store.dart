import 'package:course_app/data/course_data.dart';
import 'package:course_app/models/course/course_model.dart';
import 'package:mobx/mobx.dart';
part 'course_store.g.dart';

class CourseStore = _CourseStoreBase with _$CourseStore;

abstract class _CourseStoreBase with Store {
  @observable
  ObservableList<Course> courses = ObservableList<Course>();

  CourseData data = CourseData();

  @action
  Future<List<Course>> getCourses() async {
    final response = await data.getCourses();

    courses.clear();
    courses.addAll(response);

    print(courses.toList());

    return courses;
  }
}
