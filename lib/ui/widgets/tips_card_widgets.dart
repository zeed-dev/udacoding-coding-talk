import 'package:coding_talk/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:coding_talk/models/tips.dart';

class TipsCardMentor extends StatelessWidget {
  final Tips tips;

  const TipsCardMentor({
    this.tips,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(tips.photo),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              tips.tips,
              style: whiteFontStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
