import 'package:flutter/material.dart';
import 'package:yes_no_app/config/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({
    super.key, 
    required this.message
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context); // THEME.OF = Busca el tema dentro del CONTEXTO
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primaryColor, //El color primario es el que configuramos en el MAIN(theme)
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text, 
              style: const TextStyle( color: Colors.white),
              ),
          ),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}