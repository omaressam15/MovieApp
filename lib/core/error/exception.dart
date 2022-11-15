import '../network/error_message_model.dart';

class ServerException implements Exception {

  ErrorMassageModel errorMassage;

  ServerException({required this.errorMassage});
}