class EndpointConstants {
  static List<String> couseGet = ["GET", "/exercise/data_course"];
  static List<String> bannerGet = ["GET", "/event/list"];
  static List<String> exerciseCourseGet = ["GET", "/exercise/data_exercise"];
  static List<String> exerciseWorkPost = ["POST", "/exercise/kerjakan"];
  static List<String> submitExerciseWorkPost = [
    "POST",
    "/exercise/input_jawaban"
  ];
  static List<String> scoreExerciseWorkGet = ["GET", "/exercise/score_result"];
  static List<String> userGet = ["GET", "/users"];
  static List<String> registerPost = ["POST", "/users/registrasi"];
}
