import 'package:get/get.dart';

import '../models/player.dart';

class PlayerController extends GetxController {
  RxList<Player> players = RxList();

  void addPlayer(Player player) {
    players.add(player);
  }

  void removePlayer(Player player) {
    players.remove(player);
  }

  void changePlayerName(Player? player, String newName) {
    int index = players.indexOf(player);
    Player newPlayer = players[index];
    newPlayer.name = newName;
    players[index] = newPlayer;
  }

  void changeScore(Player player, int value) {
    int index = players.indexOf(player);
    Player newPlayer = players[index];
    newPlayer.score += value;
    players[index] = newPlayer;
  }
}
