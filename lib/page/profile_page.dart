import 'package:codigo6_future/services/my_service.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  MyService myService = MyService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil",
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: myService.getProfile(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
            if (snap.hasData) {
              Map<String, dynamic> profile = snap.data;
              return Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  CircleAvatar(
                      radius: 60.0,
                      //backgroundColor: Colors.amber,
                      backgroundImage: NetworkImage(profile["image"])),
                  ListTile(
                    title: Text(profile["name"]),
                    subtitle: const Text("Nombres"),
                  ),
                  ListTile(
                    title: Text(profile["lastname"]),
                    subtitle: const Text("Apellidos"),
                  ),
                  ListTile(
                    title: Text(profile["phone"]),
                    subtitle: const Text("Teléfono"),
                  ),
                  ListTile(
                    title: Text(profile["address"]),
                    subtitle: const Text("Dirección"),
                  ),
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
