import 'profile.dart';
import 'player.dart';
import 'match.dart';

class Team extends Profile with TeamMixin {
  Team({
    required super.name,
    required super.location,
    required super.contact,
    required this.teamID,
    List<Player>? players,
    List<Match>? matches,
  }) :  _players = players ?? [],
        _matches = matches ?? [];

  final String teamID;
  int totalPoints = 0;
  final List<Player> _players;
  final List<Match> _matches; // Store matches
  List<Player> get players => _players; // Players in this team
    @override
      List<Match> get teamMatches => _matches; // Implementation of teamMatches
}

mixin TeamMixin {
  List<Match> get teamMatches; // Getter for matches 

  // Win counts (result == true)
  int get totalWins => 
    teamMatches.where((m) => m.result).length;

  // Loss counts (result == false)
  int get totalLosses => 
    teamMatches.where((m) => !m.result).length;
}