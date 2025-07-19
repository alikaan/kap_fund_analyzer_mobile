class KapFund {
  final String fundOid;
  final String fundName;
  final String? fundCode;
  final String? fundPermaLink;
  final String? title;

  KapFund({
    required this.fundOid,
    required this.fundName,
    this.fundCode,
    this.fundPermaLink,
    this.title
  });

  factory KapFund.fromJson(Map<String, dynamic> json) {
    return KapFund(
      fundOid: json['fundOid'],
      fundName: json['fundName'],
      fundCode: json['fundCode'],
      fundPermaLink: json['fundPermaLink'],
      title: json['title'],
    );
  }
}