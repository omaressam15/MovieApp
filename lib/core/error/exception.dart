import '../network/error_message_model.dart';

class ServerException implements Exception {

  ErrorMassage errorMassage;

  ServerException({required this.errorMassage});
}