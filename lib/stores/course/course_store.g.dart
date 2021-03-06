// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CourseStore on _CourseStoreBase, Store {
  final _$coursesAtom = Atom(name: '_CourseStoreBase.courses');

  @override
  ObservableList<Course> get courses {
    _$coursesAtom.reportRead();
    return super.courses;
  }

  @override
  set courses(ObservableList<Course> value) {
    _$coursesAtom.reportWrite(value, super.courses, () {
      super.courses = value;
    });
  }

  final _$getCoursesAsyncAction = AsyncAction('_CourseStoreBase.getCourses');

  @override
  Future<List<Course>> getCourses() {
    return _$getCoursesAsyncAction.run(() => super.getCourses());
  }

  @override
  String toString() {
    return '''
courses: ${courses}
    ''';
  }
}
