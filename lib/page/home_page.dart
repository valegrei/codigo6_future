import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Mantequilla el utlimo de los mexicanos.";

  Future<String> getFullName() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return "Juan Carlos Montes";
    });
  }

  Future<List> getProducts() async {
    return Future.delayed(const Duration(seconds: 5), () {
      return ["Camisa", "Zapatos", "Corbata", "Traje"];
    });
  }

  @override
  Widget build(BuildContext context) {
    // getFullName().then( (value) {
    //   print("Estoy dentro del future");
    //   name = value;
    //   setState(() {});
    // });

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getProducts(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List products = snapshot.data;
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Text(products[index]);
                },
                itemCount: products.length,
                //shrinkWrap: true,
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
