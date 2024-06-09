import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

//ESTILO GLOBAL PARA LA APLICACION

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ //ingresamo el tipo de PROVIDER que ya habiamos EXTENDIDO
        ChangeNotifierProvider(create: (_) => ChatProvider())
        //se realiza instancia de CHATPROVIDER | Se ingresa '_' porque es un argumento innecesario
        //Con esto realizamos nuestro CHATPROVIDER a nivel global de la aplicacion
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 6).theme(),
        home: const ChatScreen()
      ),
    );
  }
}
