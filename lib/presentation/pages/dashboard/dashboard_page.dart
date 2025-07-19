import 'package:flutter/material.dart';
import 'kap_funds_tab.dart';
import 'mkk_funds_tab.dart';
import 'mkk_members_tab.dart';


class DashboardPage extends StatelessWidget {
  final String token;
  const DashboardPage({required this.token});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Piyasalar"),
          bottom: TabBar(
            indicatorColor: Colors.deepPurpleAccent,
            tabs: const [
              Tab(text: "Kap Funds"),
              Tab(text: "MKK Funds"),
              Tab(text: "MKK Members"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            KapFundsTab(token: token),
            MkkFundsTab(token: token),
            MkkMembersTab(token: token),
          ],
        ),
      ),
    );
  }
}
