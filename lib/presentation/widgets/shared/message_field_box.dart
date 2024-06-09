//TEXTFORMFIELD

import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged <String> onValue;

  const MessageFieldBox({
    super.key, 
    required this.onValue
    });

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();//Nos dara control del INPUT que asociaremos

    final focusNode = FocusNode();//Es para colocar el FOCO en un elemento

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40) // cambiamos el tamaño del circulo del TEXTFIELD
    );

    final inputDecoration  = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder, // Al ingresar texto no pierda su diseño
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon( Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text; //Obtenemos el valor que ENVIA el usuario
            //print('button: $textValue'); //Obtenemos el valor al PRESIONAR el ícono de ENVIAR
            textController.clear();
            onValue(textValue);
          },
        ),
      );

    return TextFormField(
      onTapOutside: (event) { //Cuando damos clic AFUERA, el foco se desactiva
        focusNode.unfocus(); // y hace que el teclado se minimize 
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {  // obtenemos el valor al hacer ENTER en el TEXT FIELD
        //print('Submit value $value');
        textController.clear(); // Limpia lo que sea que escribio
        focusNode.requestFocus();//Mantenemos el FOCO en el lugar
        onValue(value);
      },
    );
  }
}