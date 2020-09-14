import 'package:flutter/material.dart';

class Emotion {
  String name;
  Color color;
  Map<String, Emotion> children;

  Emotion(this.name, this.color, this.children);

  // Return a list of size count containing interpolated colors from start to
  // end.
  static List<Color> interpolateColor(int count, Color start, Color end) {
    double deltaR = (end.red - start.red) / (count + 1);
    double deltaG = (end.green - start.green) / (count + 1);
    double deltaB = (end.blue - start.blue) / (count + 1);

    double r = start.red.toDouble();
    double g = start.green.toDouble();
    double b = start.blue.toDouble();

    List<Color> colors = [];
    for (int i = 0; i < count; ++i) {
      colors.add(Color.fromRGBO(r.round(), g.round(), b.round(), 1.0));
      r += deltaR;
      g += deltaG;
      b += deltaB;
    }

    return colors;
  }

  // Basically just used to add level 2 children, interpolating color between
  // the two surrounding level 1 emotions.
  void addChildren(List<String> childNames, Color start, Color end) {
    if (childNames.isEmpty) {
      return;
    } else if (childNames.length == 1) {
      children[childNames[0]] = Emotion(childNames[0], this.color, {});
    } else if (childNames.length % 2 == 0) {
      // Even length case.
      List<Color> startColors =
          interpolateColor(childNames.length + 1, start, this.color);
      List<Color> endColors =
          interpolateColor(childNames.length + 1, this.color, end);

      // Add start half.
      for (int i = 0; i < childNames.length ~/ 2; ++i) {
        String childName = childNames[i];
        this.children[childName] =
            Emotion(childName, startColors[i + childNames.length ~/ 2], {});
      }
      // Add end half.
      for (int i = 0; i < childNames.length ~/ 2; ++i) {
        String childName = childNames[i + childNames.length ~/ 2];
        this.children[childName] = Emotion(childName, endColors[i + 1], {});
      }
    } else {
      // Odd length case.
      List<Color> startColors =
          interpolateColor(childNames.length, start, this.color);
      List<Color> endColors =
          interpolateColor(childNames.length, this.color, end);
      String childName;

      // Add start half.
      for (int i = 0; i < childNames.length ~/ 2; ++i) {
        childName = childNames[i];
        this.children[childName] =
            Emotion(childName, startColors[i + childNames.length ~/ 2 + 1], {});
      }

      // Add middle color.
      childName = childNames[childNames.length ~/ 2];
      this.children[childName] = Emotion(childName, this.color, {});

      // Add end half.
      for (int i = 0; i < childNames.length ~/ 2; ++i) {
        String childName = childNames[i + childNames.length ~/ 2 + 1];
        this.children[childName] = Emotion(childName, endColors[i + 1], {});
      }
    }
  }
}

// The full emotion wheel is at Emotions.wheel.
class Emotions {
  static Emotion generateWheel() {
    Emotion joy = Emotion("joy", joyColor, {});
    Emotion love = Emotion("love", loveColor, {});
    Emotion fear = Emotion("fear", fearColor, {});
    Emotion anger = Emotion("anger", angerColor, {});
    Emotion sadness = Emotion("sadness", sadnessColor, {});
    Emotion surprise = Emotion("surprise", surpriseColor, {});

    joy.addChildren([
      "peaceful",
      "content",
      "happy",
      "cheerful",
      "proud",
      "optimistic",
      "excited",
      "euphoric"
    ], surpriseColor, loveColor);

    love.addChildren(
        ["enchanted", "romantic", "affectionate", "sentimental", "grateful"],
        joyColor,
        fearColor);

    fear.addChildren(
        ["scared", "terrified", "insecure", "nervous", "horrified"],
        loveColor,
        angerColor);

    anger.addChildren(
        ["enraged", "exasperated", "irritable", "jealous", "disgusted"],
        fearColor,
        sadnessColor);

    sadness.addChildren(
        ["hurt", "unhappy", "disappointed", "shameful", "lonely", "gloomy"],
        angerColor,
        surpriseColor);

    surprise.addChildren(["stunned", "confused", "amazed", "overcome", "moved"],
        sadnessColor, joyColor);

    return Emotion("default", Colors.white, {
      "joy": joy,
      "love": love,
      "fear": fear,
      "anger": anger,
      "sadness": sadness,
      "surprise": surprise
    });
  }

  static final Color joyColor = Colors.green;
  static final Color loveColor = Colors.yellow;
  static final Color fearColor = Colors.orange;
  static final Color angerColor = Colors.pink[500];
  static final Color sadnessColor = Colors.blue[600];
  static final Color surpriseColor = Colors.white;
  static final Emotion wheel = generateWheel();
}
