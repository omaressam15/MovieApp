import 'package:equatable/equatable.dart';

class ErrorMassageModel extends Equatable {

 final int statusCode ;

 final String statusMassage;

 final bool success;

 const ErrorMassageModel({required this.statusCode,required this.statusMassage,required this.success});

 factory ErrorMassageModel.fromJson(Map<String,dynamic>json)=>
     ErrorMassageModel(
       statusCode: json['"status_code'],
       statusMassage: json['status_message"'],
       success: json['success'],
     );

  @override
  // TODO: implement props
  List<Object?> get props => [
    statusCode,
    statusMassage,
    success,
  ];

}