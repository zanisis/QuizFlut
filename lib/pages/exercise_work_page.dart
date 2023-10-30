import 'package:edproject/dataSource/exercise_course_datasource.dart';
import 'package:edproject/dataSource/exercise_work_datasource.dart';
import 'package:edproject/model/exercise_work_model.dart';
import 'package:flutter/material.dart';

class ExerciseWorkPage extends StatefulWidget {
  final String exerciseId;

  const ExerciseWorkPage({super.key, required this.exerciseId});

  @override
  State<ExerciseWorkPage> createState() => _ExerciseWorkPageState();
}

class _ExerciseWorkPageState extends State<ExerciseWorkPage> {
  final exerciseWorkDataSource = ExerciseWorkDataSource();

  ExerciseWorkResponse? exerciseWorkResponse;

  @override
  void initState() {
    // TODO: implement initState
    getInit();
    super.initState();
  }

  void getInit() async {
    exerciseWorkResponse = await exerciseWorkDataSource.getExerciseWork(
        exerciseId: widget.exerciseId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
