class Task {
  final int id;
  final User assignedTo;
  final String date;
  final String description;
  final String location;
  final double reward;
  final String status;
  final String title;
  final String image;
  final String image_detail;

  Task({
    required this.id,
    required this.assignedTo,
    required this.date,
    required this.description,
    required this.location,
    required this.reward,
    required this.status,
    required this.title,
    required this.image,
    required this.image_detail,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      assignedTo: User.fromJson(
          json['user']), // Adjust according to your JSON structure
      date: json['date'],
      description: json['description'],
      location: json['location'],
      reward: json['reward']
          .toDouble(), // Assuming reward is received as a numeric value
      status: json['status'],
      title: json['title'],
      image: json['image'],
      image_detail: json['image_detail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': assignedTo.toJson(), // Adjust according to your JSON structure
      'date': date,
      'description': description,
      'location': location,
      'reward': reward,
      'status': status,
      'title': title,
      'image': image,
      'image_detail': image_detail,
    };
  }
}

class User {
  final int id;
  final String email;
  final String picture;
  final double rating;
  final String username;

  User({
    required this.id,
    required this.email,
    required this.picture,
    required this.rating,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      picture: json['picture'],
      rating: json['rating']
          .toDouble(), // Assuming rating is received as a numeric value
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'picture': picture,
      'rating': rating,
      'username': username,
    };
  }
}
