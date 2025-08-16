class Match {
  final String matchID;
  final String opponent;
  final DateTime date;
  final int goals;
  final bool result; // true for win, false for loss

  Match({
    required this.matchID,
    required this.opponent,
    required this.date,
    required this.goals,
    required this.result,
  });
}
