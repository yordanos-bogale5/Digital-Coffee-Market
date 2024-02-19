

class Commodity {
  final String name;
  final String symbol;
  final double price;

  Commodity({required this.name, required this.symbol, required this.price});

  factory Commodity.fromJson(Map<String, dynamic> json) {
    return Commodity(
      name: json['name'],
      symbol: json['symbol'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'symbol': symbol,
      'price': price,
    };
  }
}
