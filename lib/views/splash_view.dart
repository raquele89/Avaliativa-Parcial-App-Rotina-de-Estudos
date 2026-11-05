
import 'package:flutter/material.dart';
import 'home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Icon(
                Icons.menu_book,
                size: 100,
                color: Colors.blue,
              ),

              const SizedBox(height: 25),

              const Text(
                'Minha Rotina de Estudos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Organize suas tarefas,\nconquiste seus objetivos!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                  },
                  child: const Text('Começar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

