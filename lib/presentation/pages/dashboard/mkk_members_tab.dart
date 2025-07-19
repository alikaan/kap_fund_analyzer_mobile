import 'package:flutter/material.dart';
import '../../../data/models/mkk_member.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class MkkMembersTab extends StatefulWidget {
  final String token;
  const MkkMembersTab({required this.token});

  @override
  State<MkkMembersTab> createState() => _MkkMembersTabState();
}

class _MkkMembersTabState extends State<MkkMembersTab> {
  List<MkkMember> _members = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadMkkMembers();
  }

  Future<void> _loadMkkMembers() async {
    final baseUrl = dotenv.env['API_BASE_URL'] ?? 'http://localhost:8080';
    final url = Uri.parse('$baseUrl/mkkmembers?limit=10&offset=0&all_records=true');
    final res = await http.get(url, headers: {
      'accept': 'application/json',
      'Authorization': 'Bearer ${widget.token}',
    });

    final decoded = utf8.decode(res.bodyBytes);
    final List data = json.decode(decoded);

    setState(() {
      _members = data.map((e) => MkkMember.fromJson(e)).toList();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return Center(child: CircularProgressIndicator());

    return ListView.separated(
      itemCount: _members.length,
      separatorBuilder: (_, __) => Divider(color: Colors.white12),
      itemBuilder: (context, i) {
        final mkk_member = _members[i];
        return ListTile(
          leading: Text("${i + 1}", style: TextStyle(color: Colors.white70)),
          title: Text(mkk_member.title ?? '-', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          subtitle: Text(mkk_member.memberType ?? '-', style: TextStyle(color: Colors.white54)),
          trailing: Text("→", style: TextStyle(color: Colors.grey)),
        );
      },
    );
  }
}