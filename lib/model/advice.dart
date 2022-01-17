class Advice {
  final String name;
  final String description;
  final String creation_date;
  final String update_date;

  const Advice(
      {required this.name,
      required this.description,
      required this.creation_date,
      required this.update_date});
  Advice.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        creation_date = json['creation_date'],
        update_date = json['update_date'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'creation_date': creation_date,
    'update_date': update_date,
  };
}
