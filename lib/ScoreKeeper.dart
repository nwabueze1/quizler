import 'package:flutter/material.dart';

class ScoreKeeper {
  List<Widget> _scores = [];

  updateScores(bool score) {
    _scores.add(score == true
        ? const Icon(
            Icons.check,
            color: Colors.green,
          )
        : const Icon(
            Icons.cancel,
            color: Colors.red,
          ));
  }

  get scores {
    return _scores;
  }

  void reset() {
    _scores = [];
  }
}
