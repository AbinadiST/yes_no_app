import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding( //LEADING = es un espacio para agregar un icono del lado izq
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar( // Crea un circulo
            backgroundImage: NetworkImage('https://www.sonica.mx/u/fotografias/fotosnoticias/2021/9/27/11474.jpg'),
          ),
        ),
        title: const Text('Avril Lavigne'),
        centerTitle: false,
      ),
      body: _ChatView(), // CTRL + . = para extraer el WIDGET
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>(); 
    //realizamos la instancia de <ChatProvider> que configuramos en el MAIN
    //Existe WATCH, READ, SELECT (PROVIDER), esto estará al pendiente de los cambios que haga
    //en esa instancia de la clase

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(  // Abarca toda la pantalla de ese WIDGET HIJO
              child: ListView.builder( // hay varios LISTVIEW, en este caso es como RECYCLERVIEW
                controller: chatProvider.chatScrollController, //se enlaza con SCROLLCONTOLLER
                itemCount: chatProvider.messageList.length,//con esto sabremos cuantos msj hay
                itemBuilder: (context, index) {

                //return ( index %2 == 0 ) // Hacemos una division, si es = a cero, es # PAR
                //()? const HerMessageBubble() // Si es # par, muestra HerMessageBubble
                // : const MyMessageBubble(); // Si es lo contrario muestra MyMessageBubble

                final message = chatProvider.messageList[index]; 

                return (message.fromWho == FromWho.her) // es una condicion IF
                  ? HerMessageBubble(message: message)
                  : MyMessageBubble( message: message);

              })
              ),
          
          // Caja de texto de mensajes

            MessageFieldBox(
              //onValue: (value) => chatProvider.sendMessage(value), es lo mismo que lo de abajo
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
