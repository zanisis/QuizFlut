part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class CourseGetEvent extends CourseEvent {}

class CourseExerciseGetEvent extends CourseEvent {}
