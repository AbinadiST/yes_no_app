//PROVIDER GESTOR DE ESTADO
//Tenemos que instalar el PROVIDER en nuestras dependencias (PUBSPEC.YAML)
import 'package:flutter/material.dart';
import 'package:yes_no_app/config/domain/entities/message.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';


class ChatProvider extends ChangeNotifier{//Notifica cuando hay cambios | Necesitamos el paquete PROVIDER

  //Tipo de dato SCROLLCONTROLLER y se instancia 
  final ScrollController chatScrollController = ScrollController();

  //Tambien se puede realizar de esta manera la instanica, para que nos de METODOS y PROPIEDADES
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola Avril', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage( String text ) async{ //Recibiremos un mensaje 

    if (text.isEmpty) return; // Si mandamos un mensaje sin texto, no hará NADA
    
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);  // añadimos msj al MESSAGELIST

    if(text.endsWith('?')){
      herReplay();
    }

    notifyListeners(); //indicamos a FLUTTER que... algo del PROVIDER cambió
    moveScrollToBottom();
  }

  Future<void> herReplay() async{  //Solicitamos la peticion HTTP
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100)); 
    //Para que espere(AWAIT) mientras se procesa el mensaje y se envie y el SCROLL se mueva al 
    //ultimo msj
    
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, //Indica la posicion
      duration: const Duration(milliseconds: 300), //Indica duracion de animacion 
      curve: Curves.easeOut //Indica tipo de animacion
      );
  }

}