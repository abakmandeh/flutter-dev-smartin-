import 'dart:convert';

// List<Registrasi> registrasiFromJson(String str) => List<Registrasi>.from(json.decode(str).map((x) => Registrasi.fromMap(x)));

// String registrasiToJson(List<Registrasi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Registrasi {
  int userId;
  int id;
  String title;
  bool completed;

  Registrasi({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory Registrasi.fromJson(Map<String, dynamic> map) {
    return Registrasi(
        userId: map["userId"], id: map["id"], title: map["title"], completed: map["completed"]);
  }

  // get toJson => null;

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };

  @override
  String toString() {
    return 'Registrasi{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}

List<Registrasi> registrasiFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Registrasi>.from(data.map((item) => Registrasi.fromJson(item)));
}

String registrasiToJson(Registrasi data) {
  final jsonData = data.toJson;
  return json.encode(jsonData);
}
