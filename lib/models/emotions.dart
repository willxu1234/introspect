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

  // Joy, level 3.
  static final Emotion jubilant = Emotion("Jubilant", Colors.green, HashMap());
  static final Emotion elated = Emotion("Elated", Colors.green, HashMap());
  static final Emotion zealous = Emotion("Zealous", Colors.green, HashMap());
  static final Emotion enthusiastic =
      Emotion("Enthusiastic", Colors.green, HashMap());
  static final Emotion hopeful = Emotion("Hopeful", Colors.green, HashMap());
  static final Emotion eager = Emotion("Eager", Colors.green, HashMap());
  static final Emotion illustrious =
      Emotion("Illustrious", Colors.green, HashMap());
  static final Emotion triumphant =
      Emotion("Triumphant", Colors.green, HashMap());
  static final Emotion playful = Emotion("Playful", Colors.green, HashMap());
  static final Emotion amused = Emotion("Amused", Colors.green, HashMap());
  static final Emotion delighted =
      Emotion("Delighted", Colors.green, HashMap());
  static final Emotion jovial = Emotion("Jovial", Colors.green, HashMap());
  static final Emotion pleased = Emotion("Pleased", Colors.green, HashMap());
  static final Emotion satisfied =
      Emotion("Satisfied", Colors.green, HashMap());
  static final Emotion serene = Emotion("Serene", Colors.green, HashMap());
  static final Emotion tranquil = Emotion("Tranquil", Colors.green, HashMap());

// Joy, level 2.
  static final Emotion euphoric = Emotion("Euphoric", Colors.green, {
    "jubliant": jubilant,
    "elated": elated,
  });
  static final Emotion excited = Emotion("Excited", Colors.green, {
    "zealous": zealous,
    "enthusiastic": enthusiastic,
  });
  static final Emotion optimistic = Emotion("Optimistic", Colors.green, {
    "hopeful": hopeful,
    "eager": eager,
  });
  static final Emotion proud = Emotion("Proud", Colors.green, {
    "illustrious": illustrious,
    "triumphant": triumphant,
  });
  static final Emotion cheerful = Emotion("Cheerful", Colors.green, {
    "playful": playful,
    "amused": amused,
  });
  static final Emotion happy = Emotion("Happy", Colors.green, {
    "delighted": delighted,
    "jovial": jovial,
  });
  static final Emotion content = Emotion("Content", Colors.green, {
    "pleased": pleased,
    "satisfied": satisfied,
  });
  static final Emotion peaceful = Emotion("Peaceful", Colors.green, {
    "serene": serene,
    "tranquil": tranquil,
  });

  // Joy, level 1.
  static final Emotion joy = Emotion("Joyful", Colors.green, {
    "euphoric": euphoric,
    "excited": excited,
    "optimistic": optimistic,
    "proud": proud,
    "cheerful": cheerful,
    "happy": happy,
    "content": content,
    "peaceful": peaceful,
  });

  // Love, level 3.
  static final Emotion enthralled = Emotion("Enthralled", Colors.yellow, {});
  static final Emotion rapturous = Emotion("Rapturous", Colors.yellow, {});
  static final Emotion passionate = Emotion("Passionate", Colors.yellow, {});
  static final Emotion enamored = Emotion("Enamored", Colors.yellow, {});
  static final Emotion warmhearted = Emotion("Warmhearted", Colors.yellow, {});
  static final Emotion compassionate =
      Emotion("Compassionate", Colors.yellow, {});
  static final Emotion tender = Emotion("Tender", Colors.yellow, {});
  static final Emotion nostalgic = Emotion("Nostalgic", Colors.yellow, {});
  static final Emotion appreciative =
      Emotion("Appreciative", Colors.yellow, {});
  static final Emotion thankful = Emotion("Thankful", Colors.yellow, {});

  // Love, level 2.
  static final Emotion enchanted = Emotion("Enchanted", Colors.yellow, {
    "enthralled": enthralled,
    "rapturous": rapturous,
  });
  static final Emotion romantic = Emotion("Romantic", Colors.yellow, {
    "passionate": passionate,
    "enamored": enamored,
  });
  static final Emotion affectionate = Emotion("Affectionate", Colors.yellow, {
    "warmhearted": warmhearted,
    "compassionate": compassionate,
  });
  static final Emotion sentimental = Emotion("Sentimental", Colors.yellow, {
    "tender": tender,
    "nostalgic": nostalgic,
  });
  static final Emotion grateful = Emotion("Grateful", Colors.yellow, {
    "appreciative": appreciative,
    "thankful": thankful,
  });

  // Love, level 1.
  static final Emotion love = Emotion("Love", Colors.yellow, {
    "grateful": grateful,
    "sentimental": sentimental,
    "affectionate": affectionate,
    "romantic": romantic,
    "enchanted": enchanted,
  });

  // The beeg emotion wheel.
  static final Emotion wheel = Emotion("default", Colors.white, {
    "joy": joy,
    "love": love,
    // "fear": fear,
    // "anger": anger,
    // "sadness": sadness,
    // "surprise": surprise,
  });
}
