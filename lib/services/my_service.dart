class MyService {
  Future<Map<String, dynamic>> getProfile() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return {
        "id": 10,
        "name": "Victor Augusto",
        "lastname": "Alegre Ibáñez",
        "phone": "924448546",
        "address": "Mz I2 Lot 1, COOVITIOMAR, Santa Rosa",
        "image":
            "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      };
    });
  }

  Future<List<Map<String, dynamic>>> getUsers() async{
    return Future.delayed(const Duration(seconds: 3), () {
      return [
        {
          "id": 1,
          "fullname": "Víctor Alegre",
          "email": "valegrei@outlook.com",
        },
        {
          "id": 2,
          "fullname": "Juana Hernandez",
          "email": "jhernandez@gmail.com",
        },
        {
          "id": 3,
          "fullname": "Gustavo Chavez",
          "email": "gchavez@gmail.com",
        },
        {
          "id": 4,
          "fullname": "Raul Zavaleta",
          "email": "rzavaleta@outlook.com",
        },
        {
          "id": 5,
          "fullname": "Mayra Rosales",
          "email": "mros23@gmail.com",
        },
      ];
    });
  }
}
