import 'dart:convert';

List<Dropdown> dropdownFromJson(String str) =>
    List<Dropdown>.from(json.decode(str).map((x) => Dropdown.fromJson(x)));

String dropdownToJson(List<Dropdown> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dropdown {
  Dropdown({
    required this.id,
    required this.namaDebitur,
  });

  @override
  String toString() {
    return '{id: $id, namaDebitur: $namaDebitur}';
  }

  int id;
  String namaDebitur;

  factory Dropdown.fromJson(Map<String, dynamic> json) => Dropdown(
        id: json["id"],
        namaDebitur: json["nama_debitur"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_debitur": namaDebitur,
      };
}
