import '../network/error_message.dart';

class ServeierException implements Exception {
  final ErrorMessageModel errorMessageModel;
  ServeierException({required this.errorMessageModel});
}
