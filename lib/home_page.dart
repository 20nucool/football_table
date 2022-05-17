import 'package:flutter/material.dart';
import 'package:football_table/services/remote_services.dart';
import 'package:football_table/widget/table_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static late Map<String, dynamic>? standing;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getStanding();
  }

  getStanding() async {
    HomePage.standing = await RemoteServices().getTable();
    if (HomePage.standing != null) {
      print(HomePage.standing);
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Visibility(
        visible: isLoaded,
        child: const TableWidget(),
        replacement: const Center(child: CircularProgressIndicator()),
      )),
    );
  }
}
