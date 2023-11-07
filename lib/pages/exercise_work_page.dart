import 'package:edproject/dataSource/exercise_work_datasource.dart';
import 'package:edproject/model/exercise_work_model.dart';
import 'package:edproject/model/score_exercise_model.dart';
import 'package:edproject/widget/modal/score_modal_widget.dart';
import 'package:edproject/widget/modal/submit_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

enum Answer { A, B, C, D, E }

class ExerciseWorkPage extends StatefulWidget {
  final String exerciseId;

  const ExerciseWorkPage({super.key, required this.exerciseId});

  @override
  State<ExerciseWorkPage> createState() => _ExerciseWorkPageState();
}

class _ExerciseWorkPageState extends State<ExerciseWorkPage> {
  final exerciseWorkDataSource = ExerciseWorkDataSource();

  int indexExercise = 0;
  Map<String, String> lockAnswer = {};

  ExerciseWorkResponse? exerciseWorkResponse;
  ExerciseWorkResponse? submitExerciseWorkResponse;
  ScoreExerciseResponse? scoreExerciseResponse;

  @override
  void initState() {
    getInit();
    super.initState();
  }

  void getInit() async {
    exerciseWorkResponse = await exerciseWorkDataSource.getExerciseWork(
        exerciseId: widget.exerciseId);

    setState(() {});
  }

  void selectedAnswer(int index, String bankQuestion) {
    if (index == 0) {
      lockAnswer[bankQuestion] = Answer.A.name;
    } else if (index == 1) {
      lockAnswer[bankQuestion] = Answer.B.name;
    } else if (index == 2) {
      lockAnswer[bankQuestion] = Answer.C.name;
    } else {
      lockAnswer[bankQuestion] = Answer.D.name;
    }

    setState(() {});
  }

  void nextQuestion() {
    setState(() {
      indexExercise = indexExercise + 1;
    });
  }

  void submitAnswer(BuildContext context) async {
    List<String> bankQuestionId = lockAnswer.keys.toList();
    List<String> studentAnswer = lockAnswer.values.toList();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          onWillPop: () async {
            return false;
          },
        );
      },
    );
    submitExerciseWorkResponse =
        await exerciseWorkDataSource.submitExerciseWork(
      SubmitExercise(
        exerciseId: widget.exerciseId,
        bankQuestionId: bankQuestionId,
        studentAnswer: studentAnswer,
      ),
    );
    if (submitExerciseWorkResponse?.message == 'Sukses input jawaban') {
      scoreExerciseResponse =
          await exerciseWorkDataSource.getScoreExercise(widget.exerciseId);

      if (mounted) {
        Navigator.pop(context);
        Navigator.pop(context);
        modalScore(context);
      }
    }
  }

  Future<dynamic> modalScore(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: const Color(0xff3A7FD5),
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (context) =>
          ScoreModalWidget(scoreExerciseResponse: scoreExerciseResponse),
    );
  }

  @override
  Widget build(BuildContext context) {
    final workExerciseData = exerciseWorkResponse?.data?[indexExercise];

    return Scaffold(
      backgroundColor: const Color(0xffF3F7F8),
      appBar: AppBar(
        title: const Text(
          'Latihan Soal',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff3A7FD5),
        leading: const BackButton(color: Colors.white),
      ),
      body: exerciseWorkResponse == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 26,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: indexExercise >= index
                                  ? const Color(0xff3A7FD5)
                                  : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: const Color(0xff3A7FD5))),
                          child: Text('${index + 1}',
                              style: TextStyle(
                                  color: indexExercise >= index
                                      ? Colors.white
                                      : Colors.black)),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: exerciseWorkResponse?.data?.length ?? 0),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 24, left: 18, right: 18, bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Soal Nomor ${indexExercise + 1}',
                              style: const TextStyle(
                                  color: Color(0xff979797),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Html(data: workExerciseData?.questionTitle ?? ''),
                          optionalAnswer(workExerciseData),
                          const SizedBox(height: 6),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff3A7FD5),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  side: const BorderSide(
                                    color: Color(0xff3A7FD5),
                                    width: 1,
                                  ),
                                ),
                                onPressed: () => {
                                  if (indexExercise <
                                      (exerciseWorkResponse?.data?.length ??
                                              0) -
                                          1)
                                    {
                                      nextQuestion(),
                                    }
                                  else
                                    {modalSubmit(context, workExerciseData)}
                                },
                                child: Text(
                                  indexExercise ==
                                          (exerciseWorkResponse?.data?.length ??
                                                  0) -
                                              1
                                      ? 'Kumpulin'
                                      : 'Selanjutnya',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }

  Future<dynamic> modalSubmit(
      BuildContext context, ExerciseWorkData? workExerciseData) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SubmitModalWidget(submitAnswer: submitAnswer),
    );
  }

  ListView optionalAnswer(ExerciseWorkData? workExerciseData) {
    return ListView.separated(
      itemBuilder: (context, index) {
        String? bankQuestion = workExerciseData?.bankQuestionId ?? '';
        return GestureDetector(
          onTap: () {
            selectedAnswer(index, bankQuestion);
          },
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: (() {
                    if ((lockAnswer[bankQuestion] == Answer.A.name &&
                            index == 0) ||
                        (lockAnswer[bankQuestion] == Answer.B.name &&
                            index == 1) ||
                        (lockAnswer[bankQuestion] == Answer.C.name &&
                            index == 2) ||
                        (lockAnswer[bankQuestion] == Answer.D.name &&
                            index == 3)) {
                      return const Color.fromRGBO(58, 127, 213, 0.71);
                    }
                    return Colors.transparent;
                  })(),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    style: BorderStyle.solid,
                    width: 1,
                    color: const Color(0xffC9C9C9),
                  )),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: Text((() {
                      if (index == 0) {
                        return 'A';
                      } else if (index == 1) {
                        return 'B';
                      } else if (index == 2) {
                        return 'C';
                      } else {
                        return 'D';
                      }
                    })()),
                  ),
                  Expanded(
                    child: Html(
                      data: (() {
                        if (index == 0) {
                          return workExerciseData?.optionA ?? '';
                        } else if (index == 1) {
                          return workExerciseData?.optionB ?? '';
                        } else if (index == 2) {
                          return workExerciseData?.optionC ?? '';
                        } else if (index == 3) {
                          return workExerciseData?.optionD ?? '';
                        }
                      })(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
