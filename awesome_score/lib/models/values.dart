import 'dart:convert';

class Value {
  final int amount;
  bool enabled;

  Value({
    required this.amount,
    this.enabled = false,
  });

  Value copyWith({
    int? amount,
    bool? enabled,
  }) {
    return Value(
      amount: amount ?? this.amount,
      enabled: enabled ?? this.enabled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'enabled': enabled,
    };
  }

  factory Value.fromMap(Map<String, dynamic> map) {
    return Value(
      amount: map['amount']?.toInt() ?? 0,
      enabled: map['enabled'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Value.fromJson(String source) => Value.fromMap(json.decode(source));

  @override
  String toString() => 'Value(amount: $amount, enabled: $enabled)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Value && other.amount == amount && other.enabled == enabled;
  }

  @override
  int get hashCode => amount.hashCode ^ enabled.hashCode;
}
