//RESPUESTA DE YESNO - WTF

import 'package:dio/dio.dart';
import 'package:yes_no_app/config/domain/entities/message.dart';
import 'package:yes_no_app/config/infrastructure/models/yes_no_model.dart';



//para hacer la peticion HTTP sería con: HTTP ó DIO
//Para esta seccion instalamos DIO
class GetYesNoAnswer{

  final _dio = Dio(); // Realizamos la instancia DIO
  
  Future<Message> getAnswer() async{
    final response = await _dio.get('https://yesno.wtf/api');

  //instanciamos la clase 
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

  //esto es un MAPER
    //return Message(
      //text: yesNoModel.answer, 
      //fromWho: FromWho.her, 
      //imageUrl: yesNoModel.image
      //);
    
      //Es lo mismo pero lo estamos sustiyendo con lo de arriba
      return yesNoModel.toMessageEntity();
  }

}
