import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }

void main() {
  final rng = Random();
  while (true) {
    stdout.write('Rock, paper or scissors? (r/p/s) ');
    final inputValue = stdin.readLineSync();
    if (inputValue == 'r' || inputValue == 'p' || inputValue == 's') {
      var playMove;
      if (inputValue == 'r') {
        playMove = Move.rock;
      } else if (inputValue == 'p') {
        playMove = Move.paper;
      } else {
        playMove = Move.scissors;
      }

      final random = rng.nextInt(3);
      final aiMove = Move.values[random];
      print('You played: $playMove');
      print('AI played: $aiMove');
      if (playMove == aiMove) {
        print("It's a draw");
      } else if (playMove == Move.rock && aiMove == Move.scissors ||
          playMove == Move.paper && aiMove == Move.rock ||
          playMove == Move.scissors && aiMove == Move.paper) {
        print('You win');
      } else {
        print('You lose');
      }
    } else if (inputValue == 'q') {
      break;
    } else {
      print('Invalid value');
    }
  }
}
