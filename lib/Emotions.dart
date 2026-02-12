import 'package:flutter/material.dart';
import 'package:namer_app/Translate.dart';
import 'package:namer_app/emotion_entity.dart';

const emotions = [
  EmotionEntity(imagePath: 'assets/sad.png', name: 'sad'),
  EmotionEntity(imagePath: 'assets/pic1.png', name: 'angry'),
  EmotionEntity(name: 'happy', imagePath: 'assets/hap.png'),
  EmotionEntity(name: 'thankful', imagePath: 'assets/hap.png'),
  EmotionEntity(name: 'grateful', imagePath: 'assets/hap.png'),
  EmotionEntity(name: 'proud', imagePath: 'assets/hap.png'),
];

class EmotionsPage extends StatefulWidget {
  const EmotionsPage({super.key});

  @override
  State<EmotionsPage> createState() => _EmotionsState();
}

class _EmotionsState extends State<EmotionsPage> {
  EmotionEntity? selectedEmotion;

  Widget _buildEmotionButton(EmotionEntity emotion) {
    bool isSelected = selectedEmotion == emotion;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedEmotion = emotion;
        });
        Future.delayed(const Duration(milliseconds: 2000), () {
          if (!mounted) return;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TranslatePage(emotionEntity: emotion),
            ),
          );
        });
      }, // <- Tutaj brakowało domknięcia funkcji onTap
      child: Align(
        alignment: Alignment.centerRight,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: const EdgeInsets.only(top: 20, left: 30),
          padding: const EdgeInsets.fromLTRB(25, 10, 15, 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            border: Border(
              top: const BorderSide(width: 3.0, color: Colors.black),
              bottom: const BorderSide(width: 3.0, color: Colors.black),
              left: const BorderSide(width: 3.0, color: Colors.black),
              right: BorderSide.none,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
            ),
          ),
          child: Text(
            emotion.name,
            style: TextStyle(
              fontSize: 32.0,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1.0),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: emotions
            .map((emotion) => _buildEmotionButton(emotion))
            .toList(),
      ),
    );
  }
}
