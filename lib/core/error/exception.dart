import 'package:movies_app/core/network/errorMessageModel.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

 const ServerException({required this.errorMessageModel});
}
class LocalDatabaseException implements Exception{
  final String error;

  const LocalDatabaseException({required this.error});
}