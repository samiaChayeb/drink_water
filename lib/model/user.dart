class User {
  final String email;
  final String name;
  final String surname;
  final String height;
  final String weight;
  final String age;
  final String creation_date;
  final String update_date;

  const User({
    required this.email,
    required this.name,
    required this.surname,
    required this.height,
    required this.weight,
    required this.age,
    required this.creation_date,
    required this.update_date,
  });

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        name = json['name'],
        surname = json['surname'],
        weight = json['weight'],
        age = json['age'],
        height = json['height'],
        creation_date = json['creation_date'],
        update_date = json['update_date'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'surname': surname,
        'height': height,
        'weight': weight,
        'age': age,
        'creation_date': creation_date,
        'update_date': update_date,
      };
}
