import 'package:flutter/material.dart';

class Translate extends StatelessWidget {
  final String? selectedEmotion;

  const Translate({super.key, this.selectedEmotion});

  @override
  Widget build(BuildContext context) {
    // 1. Decydujemy, który obrazek wybrać na podstawie emocji
    String imagePath;
    
    if (selectedEmotion == 'angry') {
      imagePath = 'assets/pic1.png';
    } else if (selectedEmotion == 'happy') {
      imagePath = 'assets/hap.png';
    } else {
      imagePath = 'assets/sad.png'; // Obrazek domyślny
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "selected emotion:",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              selectedEmotion ?? 'no selected',
              style: const TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 135.0),
            Container(
              width: 300.0,
              height: 500.0,
              decoration: BoxDecoration(
                border: Border.all(width: 3.0),
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  // Używamy zmiennej imagePath, którą ustaliliśmy wyżej
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}