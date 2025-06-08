class Crypto {
  final String name;
  final String symbol;
  final DateTime dateAdded;
  final double priceUsd;
  final double priceBrl;

  Crypto({
    required this.name,
    required this.symbol,
    required this.dateAdded,
    required this.priceUsd,
    required this.priceBrl,
  });

  factory Crypto.fromMap(Map<String, dynamic> map) {
    final quote = map['quote'] as Map<String, dynamic>?;

    final usdData = quote?['USD'] as Map<String, dynamic>?;
    final brlData = quote?['BRL'] as Map<String, dynamic>?;

    return Crypto(
      name: map['name'] ?? '',
      symbol: map['symbol'] ?? '',
      dateAdded:
          DateTime.tryParse(map['date_added'] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      priceUsd: (usdData?['price'] as num?)?.toDouble() ?? 0.0,
      priceBrl: (brlData?['price'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
