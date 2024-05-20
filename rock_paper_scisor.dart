import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }

void main() {
  final rng = Random();
  while (true) {
    stdout.write("Select rock, paper, or scissors? (R/P/S): ");
    final input = stdin.readLineSync()?.trim();
    var playermove;

    if (input == 'r' ||
        input == 'p' ||
        input == 's' ||
        input == 'R' ||
        input == 'P' ||
        input == 'S') {
      if (input == 'r' || input == 'R') {
        playermove = Move.rock;
      } else if (input == 'p' || input == 'P') {
        playermove = Move.paper;
      } else {
        playermove = Move.scissors;
      }

      final random = rng.nextInt(3);
      final aimove = Move.values[random];
      print("User Selected: ${moveToString(playermove)}");
      print("AI selected: ${moveToString(aimove)}");

      if (aimove == playermove) {
        print("DRAW");
      } else if (playermove == Move.rock && aimove == Move.scissors ||
          playermove == Move.paper && aimove == Move.rock ||
          playermove == Move.scissors && aimove == Move.paper) {
        print("WINNER WINNER CHICKEN DINNER");
      } else {
        print("LOOSER");
      }
    } else if (input == 'q' || input == 'Q') {
      break;
    } else {
      print("Invalid input");
    }
  }
}

String moveToString(Move move) {
  switch (move) {
    case Move.rock:
      return 'rock';
    case Move.paper:
      return 'paper';
    case Move.scissors:
      return 'scissors';
    default:
      return '';
  }
}
