class MkkFund {
  final int fundId;
  final String? fundName;
  final String? fundCode;
  final String? kapUrl;
  final String? fundCompanyTitle;

  MkkFund({
    required this.fundId,
    required this.fundName,
    this.fundCode,
    this.kapUrl,
    this.fundCompanyTitle,
  });

  factory MkkFund.fromJson(Map<String, dynamic> json) {
    return MkkFund(
      fundId: json['fundId'],
      fundName: json['fundName'],
      fundCode: json['fundCode'],
      kapUrl: json['kapUrl'],
      fundCompanyTitle: json['fundCompanyTitle'],
    );
  }
}