import 'profile.dart';
import 'match.dart';

class Player extends Profile with PlayerMixin {
  Player({
    required super.name,
    required super.location,
    required super.contact,
    required this.playerID,
    required this.position,
    this.goalsScored = 0,
    required this.matchesPlayed,
  });
 

  final String playerID;
  String position;
  int goalsScored;
  @override
  final List<Match> matchesPlayed; //Using a backing field (_matchesPlayed) allows the Player class to manage how matches are stored and modified.
}

mixin PlayerMixin {
  List<Match> get matchesPlayed; 
  
  // Total matches played
  int get totalMatches => 
    matchesPlayed.length;

  // Total goals
  int get totalGoals => 
    matchesPlayed.fold(0, (sum, m) => sum + m.goals);

  // Total win counts
  int get totalWins  => matchesPlayed.where((m) => m.result).length;
}

extension PlayerExtension on Player {
  void printInfo() {
    print(playerID);
    print(name);
    print(location);
    print(position);
    print("Matches played: $totalMatches");
    print("Goals: $totalGoals");
    print("Wins: $totalWins");
  }
}