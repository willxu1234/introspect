import 'dart:collection';

import 'package:flutter/material.dart';

class Emotion {
  String name;
  Color color;
  Map<String, Emotion> children;

  Emotion(this.name, this.color, this.children);
}

// The full emotion wheel is at Emotions.wheel.
class Emotions {
  // TODO: Add actual color interpolation.

  // Joyful, level 3.
  static final Emotion jubilant = Emotion("Jubilant", Colors.yellow, HashMap());
  static final Emotion elated = Emotion("Elated", Colors.yellow, HashMap());
  static final Emotion zealous = Emotion("Zealous", Colors.yellow, HashMap());
  static final Emotion enthusiastic =
      Emotion("Enthusiastic", Colors.yellow, HashMap());
  static final Emotion hopeful = Emotion("Hopeful", Colors.yellow, HashMap());
  static final Emotion eager = Emotion("Eager", Colors.yellow, HashMap());
  static final Emotion illustrious =
      Emotion("Illustrious", Colors.yellow, HashMap());
  static final Emotion triumphant =
      Emotion("Triumphant", Colors.yellow, HashMap());
  static final Emotion playful = Emotion("Playful", Colors.yellow, HashMap());
  static final Emotion amused = Emotion("Amused", Colors.yellow, HashMap());
  static final Emotion delighted =
      Emotion("Delighted", Colors.yellow, HashMap());
  static final Emotion jovial = Emotion("Jovial", Colors.yellow, HashMap());
  static final Emotion pleased = Emotion("Pleased", Colors.yellow, HashMap());
  static final Emotion satisfied =
      Emotion("Satisfied", Colors.yellow, HashMap());
  static final Emotion serene = Emotion("Serene", Colors.yellow, HashMap());
  static final Emotion tranquil = Emotion("Tranquil", Colors.yellow, HashMap());

// Joyful, level 2.
  static final Emotion euphoric = Emotion("Euphoric", Colors.yellow, {
    "jubliant": jubilant,
    "elated": elated,
  });
  static final Emotion excited = Emotion("Excited", Colors.yellow, {
    "zealous": zealous,
    "enthusiastic": enthusiastic,
  });
  static final Emotion optimistic = Emotion("Optimistic", Colors.yellow, {
    "hopeful": hopeful,
    "eager": eager,
  });
  static final Emotion proud = Emotion("Proud", Colors.yellow, {
    "illustrious": illustrious,
    "triumphant": triumphant,
  });
  static final Emotion cheerful = Emotion("Cheerful", Colors.yellow, {
    "playful": playful,
    "amused": amused,
  });
  static final Emotion happy = Emotion("Happy", Colors.yellow, {
    "delighted": delighted,
    "jovial": jovial,
  });
  static final Emotion content = Emotion("Content", Colors.yellow, {
    "pleased": pleased,
    "satisfied": satisfied,
  });
  static final Emotion peaceful = Emotion("Peaceful", Colors.yellow, {
    "serene": serene,
    "tranquil": tranquil,
  });

  // Joyful, level 1.
  static final Emotion joyful = Emotion("Joyful", Colors.yellow, {
    "euphoric": euphoric,
    "excited": excited,
    "optimistic": optimistic,
    "proud": proud,
    "cheerful": cheerful,
    "happy": happy,
    "content": content,
    "peaceful": peaceful,
  });

  // The beeg emotion wheel.
  static final Emotion wheel = Emotion("default", Colors.white, {
    "joyful": joyful,
  });
}
