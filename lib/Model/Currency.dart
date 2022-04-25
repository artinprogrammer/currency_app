

class Currency {
  String? id;
  String? symbol;
  String? name;
  String? image;
  var current_price;
  int? marketCap;
  var market_cap_rank;
  int? fullyDilutedValuation;
  int? totalVolume;
  var high_24h;
  var low_24h;
  var price_change_24h;
  var price_change_percentage_24h;
  double? marketCapChange24H;
  double? marketCapChangePercentage24H;
  int? circulatingSupply;
  int? totalSupply;
  int? maxSupply;
  var ath;
  double? athChangePercentage;
  DateTime? athDate;
  double? atl;
  double? atlChangePercentage;
  DateTime? atlDate;
  dynamic? roi;
  DateTime? last_updated;

  Currency({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.current_price,
    required this.marketCap,
    required this.market_cap_rank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high_24h,
    required this.low_24h,
    required this.price_change_24h,
    required this.price_change_percentage_24h,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.roi,
    required this.last_updated,
  });
}
