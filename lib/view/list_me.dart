import 'package:catatan_lembur/control/my_controllers.dart';
import 'package:catatan_lembur/model/cat.dart';
import 'package:catatan_lembur/res/route_me.dart';
import 'package:flutter/material.dart';

class ListMe extends StatefulWidget {
  @override
  _ListMeState createState() => _ListMeState();
}

class _ListMeState extends State<ListMe> {
  List<Cat> _cats = [];


  @override
  void initState() {
    super.initState();
    MyControllers();
    _refreshCatList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Text(_cats[index].dateTime),
                title: Text(_cats[index].actHours.toString()),
                subtitle: Text(_cats[index].actHours.toString()),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
                onTap: _detailPage,
              ),
            ],
          ),
        );
      },
      itemCount: _cats.length,
    );
  }

  void _refreshCatList() async {
    List<Cat> x = await MyControllers.showData();
    setState(() {
      _cats = x;
    });
  }

  _detailPage() {
    Navigator.pushNamed(context, RouteMe.detailPage);
  }
}
