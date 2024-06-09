import 'package:flutter/material.dart';
import 'package:yes_no_app/config/domain/entities/message.dart';


class HerMessageBubble extends StatelessWidget {

  final Message message;

  const HerMessageBubble({
    super.key, 
    required this.message
    });

  

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondaryHeaderColor,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: const TextStyle( color: Colors.white),),
          ),
        ),
        const SizedBox(height: 5),

        // "!" = siempre habrá una imagen(ya que el sistema indicaba ERROR)
        _ImageBubble(message.imageUrl!), 

        const SizedBox(height: 10)

        
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String imageUrl;

  const _ImageBubble( this.imageUrl );

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; // Nos da info. del dispositivo que lo ejecuta

    return ClipRRect(  //Widget que nos permite hacer bordes redondeados
    borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,  // indica 70%
        height: 150,
        fit: BoxFit.cover,  //indicamos a las dimensiones que le dimos... coloque los bordes
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child; //Indica si ya no hay progreso regresa la imagen

          return Container( //Mientras se carga la imagen haz lo siguiente
          width: size.width * 07,
          height: 150,
          padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5),
          child: const Text('Avril está escribiendo un mensaje'),
          );
        },
      ));
      }
}