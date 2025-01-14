

//Esta clase será de intermedio entre DOMAIN y PRESENTATION
//Y tener TODAS las propiedades de la respuesta del API
import 'package:yes_no_app/config/domain/entities/message.dart';


class YesNoModel{

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image
  });

  final String answer;
  final bool forced;
  final String image;

  
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => 
    YesNoModel(
      answer: json["answer"], 
      forced: json["forced"], 
      image: json["image"],
      );

  Map<String, dynamic> toJason() =>{
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  Message toMessageEntity()=> Message(
    text: answer == 'yes' ? 'Si' : 'No', 
    fromWho: FromWho.her,
    imageUrl: image
    );
}