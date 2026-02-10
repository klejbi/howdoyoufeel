import 'package:flutter/material.dart';
import 'package:namer_app/Translate.dart';


class Emotions extends StatefulWidget {
  const Emotions({super.key});

  @override
  State<Emotions> createState() => _EmotionsState();
}

class _EmotionsState extends State<Emotions> {
  String? selectedEmotion;

  Widget _buildEmotionButton(String text) {
    bool isSelected = selectedEmotion == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedEmotion = text;
        });
        Future.delayed(const Duration(milliseconds: 250), () {
          if (!mounted) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Translate(selectedEmotion: text),
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
            text,
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: <Widget>[
          _buildEmotionButton('sad'),
          _buildEmotionButton('angry'),
          _buildEmotionButton('happy'),
          _buildEmotionButton('thankful'),
          _buildEmotionButton('grateful'),
          _buildEmotionButton('proud'),
        ],
      ),
    );
  }
}