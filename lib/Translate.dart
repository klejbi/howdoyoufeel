import 'package:flutter/material.dart';
import 'package:namer_app/emotion_entity.dart';

class TranslatePage extends StatelessWidget {
  final EmotionEntity emotionEntity;

  const TranslatePage({super.key, required this.emotionEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("selected emotion:", style: TextStyle(fontSize: 20)),
            Text(
              emotionEntity.name,
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
                  image: AssetImage(emotionEntity.imagePath),
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
