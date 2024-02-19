

// Data source for commodity.
class CommodityDataSource {
  final List<Commodity> _commodities;

  CommodityDataSource(this._commodities);

  List<Commodity> getCommodities() => _commodities;

  Commodity getCommodity(String id) =>
      _commodities.firstWhere((commodity) => commodity.id == id);
}

// Model for commodity.
class Commodity {
  final String id;
  final String name;
  final String description;
  final double price;

  Commodity(this.id, this.name, this.description, this.price);
}
