class MkkMember {
  final String id;
  final String title;
  final String? memberType;
  final String? kfiUrl;

  MkkMember({
    required this.id,
    required this.title,
    this.memberType,
    this.kfiUrl,
  });

  factory MkkMember.fromJson(Map<String, dynamic> json) {
    return MkkMember(
      id: json['id'],
      title: json['title'],
      memberType: json['memberType'],
      kfiUrl: json['kfiUrl'],
    );
  }
}