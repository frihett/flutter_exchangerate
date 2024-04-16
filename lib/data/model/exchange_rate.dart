class ExchangeRate {
  final String timeLastUpdateUtc;
  final Map<String, dynamic> conversionRates;

//<editor-fold desc="Data Methods">
  const ExchangeRate({
    required this.timeLastUpdateUtc,
    required this.conversionRates,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExchangeRate &&
          runtimeType == other.runtimeType &&
          timeLastUpdateUtc == other.timeLastUpdateUtc &&
          conversionRates == other.conversionRates);

  @override
  int get hashCode => timeLastUpdateUtc.hashCode ^ conversionRates.hashCode;

  @override
  String toString() {
    return 'ExchangeRate{' +
        ' timeLastUpdateUtc: $timeLastUpdateUtc,' +
        ' conversionRates: $conversionRates,' +
        '}';
  }

  ExchangeRate copyWith({
    String? timeLastUpdateUtc,
    Map<String, num>? conversionRates,
  }) {
    return ExchangeRate(
      timeLastUpdateUtc: timeLastUpdateUtc ?? this.timeLastUpdateUtc,
      conversionRates: conversionRates ?? this.conversionRates,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timeLastUpdateUtc': this.timeLastUpdateUtc,
      'conversionRates': this.conversionRates,
    };
  }

  factory ExchangeRate.fromJson(Map<String, dynamic> map) {
    return ExchangeRate(
      timeLastUpdateUtc: map['timeLastUpdateUtc'] as String,
      conversionRates: map['conversionRates'] as Map<String, num>,
    );
  }

//</editor-fold>
}
