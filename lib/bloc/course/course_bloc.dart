import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edproject/dataSource/course_datasource.dart';
import 'package:edproject/model/course_model.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final courseDataSource = CourseDataSource();

  CourseBloc() : super(CourseInitial()) {
    on<CourseGetEvent>((event, emit) async {
      emit(CourseLoading());

      final courseResponse = await courseDataSource.getCourse();

      emit(CourseSuccess(courseResponse: courseResponse));
    });
  }
}
