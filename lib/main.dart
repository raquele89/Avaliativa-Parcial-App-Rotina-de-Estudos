
import 'package:flutter/material.dart';
import 'views/splash_view.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minha Rotina de Estudos',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),

      home: const SplashView(),
    );
  }
}
