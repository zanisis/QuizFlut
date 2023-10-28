part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseSuccess extends CourseState {
  final CourseResponse courseResponse;

  CourseSuccess({required this.courseResponse});
}

final class CourseFailed extends CourseState {
  final String? message;
  CourseFailed({this.message});
}
