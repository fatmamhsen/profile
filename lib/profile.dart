import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
//create alertDialog
  Future<String> alertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Your Comment ?'),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Enter'),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
              ),
            ],
          );
        });
  }

  //create bottomSheet

  String _selected = '';
  void _onPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text('Cooling'),
                onTap: () => _selectItem('cooling'),
              ),
              ListTile(
                leading: Icon(Icons.accessibility_new),
                title: Text('People'),
                onTap: () => _selectItem('People'),
              ),
            ],
          );
        });
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selected = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.redAccent,
            width: double.infinity,
            height: 350.0,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(60.0),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 70.0,
                  backgroundImage: AssetImage('images/girl.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Text(
                  'Alisa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Text(
                  '22 want | 35 done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.reorder,
                    color: Colors.pinkAccent.shade100,
                  ),
                  title: Text('Order'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Divider(
                  height: 10.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.pinkAccent.shade200,
                  ),
                  title: Text('Like'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Divider(
                  height: 10.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.comment,
                    color: Colors.orange.shade400,
                  ),
                  title: Text('comment'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    alertDialog(context).then((onValue) {
                      SnackBar mySnack = SnackBar(
                        content: Text('$onValue'),
                      );
                      Scaffold.of(context).showSnackBar(mySnack);
                    });
                  },
                ),
                Divider(
                  height: 10.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blueAccent.shade200,
                  ),
                  title: Text('Download'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Divider(
                  height: 10.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.border_color,
                    color: Colors.blueAccent.shade100,
                  ),
                  title: Text('Edit $_selected'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => _onPressed(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
