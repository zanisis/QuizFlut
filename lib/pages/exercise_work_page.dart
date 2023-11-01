import 'package:edproject/dataSource/exercise_work_datasource.dart';
import 'package:edproject/model/exercise_work_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ExerciseWorkPage extends StatefulWidget {
  final String exerciseId;

  const ExerciseWorkPage({super.key, required this.exerciseId});

  @override
  State<ExerciseWorkPage> createState() => _ExerciseWorkPageState();
}

class _ExerciseWorkPageState extends State<ExerciseWorkPage> {
  final exerciseWorkDataSource = ExerciseWorkDataSource();
  int indexExercise = 0;
  String answerQuestion = '';

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
    print(
        "exerciseId: ${widget.exerciseId} ${exerciseWorkResponse?.data.toString()}");
    setState(() {});
  }

  void selectedAnswer(int index) {
    if (index == 0) {
      answerQuestion = 'A';
    } else if (index == 1) {
      answerQuestion = 'B';
    } else if (index == 2) {
      answerQuestion = 'C';
    } else {
      answerQuestion = 'D';
    }
    setState(() {});
  }

  void nextQuestion() {}

  @override
  Widget build(BuildContext context) {
    final workExerciseData = exerciseWorkResponse?.data?[indexExercise];

    return Scaffold(
      backgroundColor: const Color(0xffF3F7F8),
      appBar: AppBar(
        title:
            const Text('Latihan Soal', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xff3A7FD5),
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 44,
            alignment: Alignment.center,
            color: Colors.white,
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: indexExercise == index
                            ? const Color(0xff3A7FD5)
                            : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1,
                            style: BorderStyle.solid,
                            color: const Color(0xff3A7FD5))),
                    child: Text('${index + 1}'),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
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
                    ListView.separated(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              selectedAnswer(index);
                            },
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
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
                                      child: Html(data: (() {
                                        if (index == 0) {
                                          return workExerciseData?.optionA ??
                                              '';
                                        } else if (index == 1) {
                                          return workExerciseData?.optionB ??
                                              '';
                                        } else if (index == 2) {
                                          return workExerciseData?.optionC ??
                                              '';
                                        } else if (index == 3) {
                                          return workExerciseData?.optionD ??
                                              '';
                                        }
                                      })()),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics()),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff3A7FD5)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                            ),
                            onPressed: nextQuestion,
                            child: const Text(
                              'Selanjutnya',
                              style: TextStyle(color: Colors.white),
                            )),
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
}
