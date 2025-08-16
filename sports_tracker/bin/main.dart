import 'match.dart';
import 'player.dart';
import 'team.dart';

void main() {
  // Sample matches
  final m1 = Match(
    matchID: 'M1',
    opponent: 'Wolves',
    date: DateTime(2025, 8, 1),
    goals: 2,
    result: true,   // win
  );
  final m2 = Match(
    matchID: 'M2',
    opponent: 'Bears',
    date: DateTime(2025, 8, 8),
    goals: 0,
    result: false,  // loss
  );
  final m3 = Match(
    matchID: 'M3',
    opponent: 'Eagles',
    date: DateTime(2025, 8, 12),
    goals: 1,
    result: true,   // win
  );

  // Sample Players
  final sam = Player(
    name: 'Sam',
    location: 'SF',
    contact: 'sam@greatSF.com',
    playerID: 'P001',
    position: 'Forward',
    matchesPlayed: [m1, m2, m3],
  );

  final kim = Player(
    name: 'Kim',
    location: 'SF',
    contact: 'kim@greatSF.com',
    playerID: 'P002',
    position: 'Midfielder',
    matchesPlayed: [m1, m2],
  );

  final team = Team(
    name: 'Sharks',
    location: 'San Francisco',
    contact: 'coach@SFsharks.com',
    teamID: 'T-001',
    players: [sam, kim],
  );

  print('Players on team: ${team.players.length}');
  print('Team wins: ${team.totalWins}');
  print('Team losses: ${team.totalLosses}');
}