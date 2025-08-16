// Represents a team in the tournament
class Team {
  String name;
  int points = 0; // For standings
  int matchesPlayed = 0;

  Team(this.name);
}

// Represents a match between two teams
class Match {
  Team team1;
  Team team2;
  int? team1Score;
  int? team2Score;

  Match(this.team1, this.team2, {this.team1Score, this.team2Score});

  bool get isCompleted => team1Score != null && team2Score != null;
}

class Tournament with TournamentMixin {
  Tournament({
    required this.tournamentID,
    required this.name,
    required this.teams,
    required this.matches,
    required this.standings,
  });

  final String tournamentID;
  String name;
  List<Team> teams = [];
  List<Match> matches = [];
  Map<Team, int> standings;
}

mixin TournamentMixin {
  // Schedules matches 
  List<Match> scheduleMatches(List<Team> teams) {
    List<Match> matches = [];
    for (int i = 0; i < teams.length; i++) {
      for (int j = i + 1; j < teams.length; j++) {
        matches.add(Match(teams[i], teams[j]));
      }
    }
    return matches;
  }

  // Updates standings based on match results
  // Round-robin format: 3 pts for a win, 1 point for a draw, 0 points for a loss. 
  void updateStandings(List<Match> matches, Map<Team, int> standings) {
    for (var match in matches) {
      if (match.isCompleted) {
        if (match.team1Score! > match.team2Score!) {
          standings[match.team1] = (standings[match.team1] ?? 0) + 3; // Winner gets 3 points
          match.team1.matchesPlayed++;
          match.team2.matchesPlayed++;
        } else if (match.team2Score! > match.team1Score!) {
          standings[match.team2] = (standings[match.team2] ?? 0) + 3;
          match.team1.matchesPlayed++;
          match.team2.matchesPlayed++;
        } else {
          standings[match.team1] = (standings[match.team1] ?? 0) + 1; // Draw: 1 point each
          standings[match.team2] = (standings[match.team2] ?? 0) + 1;
          match.team1.matchesPlayed++;
          match.team2.matchesPlayed++;
        }
      }
    }
  }
}

