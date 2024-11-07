import 'package:flutter/material.dart';
import 'package:flutter_app/addDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task A"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Text("SA"),
              ),
              accountName: Text("Shaikh Asfak"),
              accountEmail: Text("asfak0258@gmail.com"),
            ),

            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add Details"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return addDetails();
                  },
                )).then((value) {
                  setState(() {});
                });
              },
            )
          ],
        ),
      ),
    );
  }
}