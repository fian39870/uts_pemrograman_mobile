import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/task_model.dart';

class ApiService {
  static const String apiUrl =
      'http://10.100.29.47:5000/tasks'; // Sesuaikan dengan alamat API Anda

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['tasks'];
      return jsonResponse.map((task) => Task.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<Task> fetchTaskById(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load task');
    }
  }
}
