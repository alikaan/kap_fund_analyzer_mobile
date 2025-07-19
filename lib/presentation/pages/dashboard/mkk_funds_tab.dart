import 'package:flutter/material.dart';
import '../../../data/models/mkk_fund.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class MkkFundsTab extends StatefulWidget {
  final String token;
  const MkkFundsTab({required this.token});

  @override
  State<MkkFundsTab> createState() => _KapFundsTabState();
}

class _KapFundsTabState extends State<MkkFundsTab> {
  List<MkkFund> _funds = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadFunds();
  }

  Future<void> _loadFunds() async {
    final baseUrl = dotenv.env['API_BASE_URL'] ?? 'http://localhost:8080';
    final url = Uri.parse('$baseUrl/mkkfunds?limit=10&offset=0&all_records=true');
    final res = await http.get(url, headers: {
      'accept': 'application/json',
      'Authorization': 'Bearer ${widget.token}',
    });

    final decoded = utf8.decode(res.bodyBytes);
    final List data = json.decode(decoded);

    setState(() {
      _funds = data.map((e) => MkkFund.fromJson(e)).toList();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return Center(child: CircularProgressIndicator());

    return ListView.separated(
      itemCount: _funds.length,
      separatorBuilder: (_, __) => Divider(color: Colors.white12),
      itemBuilder: (context, i) {
        final fund = _funds[i];
        return ListTile(
          leading: Text("${i + 1}", style: TextStyle(color: Colors.white70)),
          title: Text(fund.fundCode ?? '-', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          subtitle: Text(fund.fundName ?? '-', style: TextStyle(color: Colors.white54)),
          trailing: Text("→", style: TextStyle(color: Colors.grey)),
        );
      },
    );
  }
}