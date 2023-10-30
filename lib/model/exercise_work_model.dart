class ExerciseWorkResponse {
  int? status;
  String? message;
  List<Map<String, String?>>? data;

  ExerciseWorkResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ExerciseWorkResponse.fromJson(Map<String, dynamic> json) =>
      ExerciseWorkResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Map<String, String?>>.from(json["data"]!.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
      };
}
