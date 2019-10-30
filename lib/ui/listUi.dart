import 'package:flutter/material.dart';
import 'package:flutter_developer_test/api/api_service.dart';
import 'package:flutter_developer_test/model/registrasi.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

class ListData extends StatefulWidget {
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  BuildContext context;
  ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: apiService.getRegistrasi(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Registrasi>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Registrasi> registrasis = snapshot.data;
            return _buildListView(registrasis);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildListView(List<Registrasi> registrasis) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('GET JSON TODOS')),
        backgroundColor: Colors.teal[600],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0), //SET MARGIN DARI CONTAINER
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          //MEMBUAT LISTVIEW

          itemBuilder: (BuildContext context, int index) {
            Registrasi registrasi = registrasis[index];
            return Container(
              child: Card(
                semanticContainer: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //ListTile MENGELOMPOKKAN WIDGET MENJADI BEBERAPA BAGIAN
                    ListTile(
                      leading: CircleAvatar(
                        child: 
                        //Icon(Icons.people),
                        Text(
                            registrasi.id.toString(),
                            //style: TextStyle(fontSize: 10.0),
                          ),
                      ),
                      title:
                      Text(
                        registrasi.title.toString(),
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      //   ],
                      // ),
                      subtitle: 
                      Row(
                        children: <Widget>[
                          Text('Complete : '
                            
                          ),
                          Text(
                            registrasi.completed.toString(),
                            //style: TextStyle(fontSize: 10.0),
                          ),
                        ],
                      ),
                     
                      trailing: 
                      Text(
                        registrasi.userId.toString(),
                        style: TextStyle(fontSize: 10.0),
                      ),
                      
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
