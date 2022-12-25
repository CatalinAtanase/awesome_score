import 'dart:convert';

class Player {
  String name;
  int score;

  Player({
    required this.name,
    this.score = 0,
  });

  Player copyWith({
    String? name,
    int? score,
  }) {
    return Player(
      name: name ?? this.name,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'score': score,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      name: map['name'] ?? '',
      score: map['score']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) => Player.fromMap(json.decode(source));

  @override
  String toString() => 'Player(name: $name, score: $score)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Player && other.name == name && other.score == score;
  }

  @override
  int get hashCode => name.hashCode ^ score.hashCode;
}
