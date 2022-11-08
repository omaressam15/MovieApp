import 'package:equatable/equatable.dart';

class ErrorMassage extends Equatable {

 final int statusCode ;

 final String statusMassage;

 final bool success;

 const ErrorMassage({required this.statusCode,required this.statusMassage,required this.success});

 factory ErrorMassage.fromJson(Map<String,dynamic>json)=>
     ErrorMassage(
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