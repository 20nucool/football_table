import 'package:flutter/material.dart';
import 'package:football_table/home_page.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  late List<dynamic> standing = HomePage.standing?['standings'][0]['table'];

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
       
      child: DataTable(
        // decoration: Decoration.lerp(a, b, t),
          headingTextStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          columnSpacing: 10,
          columns: const [
             DataColumn(
              label: Text('S.N.'),
            ),
            DataColumn(
              label: Text('Team'),
            ),
            DataColumn(
              label: Text('P'),
            ),
            DataColumn(
              label: Text('W'),
            ),
            DataColumn(
              label: Text('D'),
            ),
            DataColumn(
              label: Text('L'),
            ),
            DataColumn(
              label: Text('F'),
            ),
            DataColumn(
              label: Text('A'),
            ),
            DataColumn(
              label: Text('GD'),
            ),
            DataColumn(
              label: Text('Pts'),
            ),
          ],
          rows: [
            for (var i in standing)
              (
                DataRow(
                  color: MaterialStateProperty.resolveWith((states) {
                    if (i['position'] <= 4) {
                      return Colors.green;
                    } else if (i['position'] > 17) {
                      return Colors.red;
                    }
                   
                    return null;
                  }),
                
                  cells: [
                    DataCell(Text(i['position'].toString())),

                    DataCell(
                      Row(
                        
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Image.network(
                          //   'https://crests.football-data.org/94.png',
                          //   width: 20,
                          //   height: 20,
                          // ),
                          Text(i['team']['name']),
                        ],
                      )),
                    DataCell(Text(i['playedGames'].toString())),
                    DataCell(Text(i['won'].toString())),
                    DataCell(Text(i['draw'].toString())),
                    DataCell(Text(i['lost'].toString())),
                    DataCell(Text(i['goalsFor'].toString())),
                    DataCell(Text(i['goalsAgainst'].toString())),
                    DataCell(Text(i['goalDifference'].toString())),
                    DataCell(Text(i['points'].toString())),
                  ]))
          ]),
    );
  }
}
