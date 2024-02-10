class ApiErrorModel {
  final String? message;
  final int? code;

  const ApiErrorModel({required this.message, this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'] as String?,
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'code': code};
}
