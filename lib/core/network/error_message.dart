// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  const ErrorMessageModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  final bool success;
  final int statusCode;
  final String statusMessage;

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "status_message": statusMessage,
      };

  @override
  List<Object> get props => [success, statusCode, statusMessage];
}
