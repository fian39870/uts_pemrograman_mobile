import 'package:flutter/material.dart';
import '/api/api_service.dart';
import '/model/task_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailPage(),
    );
  }
}

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<List<Task>> futureTasks;

  @override
  void initState() {
    super.initState();
    futureTasks = ApiService().fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var tinggiGambarLatarBelakang = screenHeight * 2 / 3.6;

    return Scaffold(
      body: FutureBuilder<List<Task>>(
        future: futureTasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tasks available'));
          } else {
            // Use the first task for demonstration
            Task task = snapshot.data!.first;

            return Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: tinggiGambarLatarBelakang,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/imgFlowers1.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(23),
                            bottomRight: Radius.circular(23),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: 30,
                        child: Image.asset(
                          'assets/icons/iconShare.png',
                        ),
                      ),
                      Positioned(
                        top: 29,
                        left: 18,
                        child: IconButton(
                          icon: Image.asset('assets/icons/iconBack.png'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 18,
                        left: 17,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          color: Colors.white.withOpacity(0.4),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(task.assignedTo.picture),
                                ),
                                SizedBox(width: 13),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          task.assignedTo
                                              .username, // Ganti dengan properti yang sesuai dari User
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(
                                          Icons.verified_rounded,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.star,
                                            color: Colors.white, size: 20),
                                        Text(
                                          ' ${task.assignedTo.rating}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 38,
                        right: 20,
                        child: Text(
                          task.date,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TitleWidget(task: task),
                SizedBox(
                  height: 5,
                ),
                BottomButtonsWidget(),
              ],
            );
          }
        },
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final Task task;

  TitleWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  task.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Image.asset(
                'assets/icons/iconMenuHeart.png',
                color: Colors.black,
                width: 40,
                height: 40,
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            task.description,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: <Widget>[
              Icon(
                Icons.wallet,
                color: Colors.black,
                size: 24.0,
              ),
              SizedBox(width: 8),
              Text(
                "Reward ${task.reward}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.black,
                size: 24.0,
              ),
              SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: task.location,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BottomButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(10.0),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                minimumSize: Size(50, 50),
              ),
              child: Image.asset(
                'assets/icons/iconMenuChat.png',
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(165, 142, 255, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Respond',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
