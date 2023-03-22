import 'package:codigo6_future/page/profile_page.dart';
import 'package:codigo6_future/services/my_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyService myService = MyService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "La tiendita de Ramón",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: myService.getUsers(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
            if (snap.hasData) {
              List<Map<String, dynamic>> users = snap.data;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(users[index]["fullname"]),
                      subtitle: Text(users[index]["email"]),
                      leading: CircleAvatar(
                        child: Text(users[index]["fullname"][0]),
                      ),
                    );
                  });
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
