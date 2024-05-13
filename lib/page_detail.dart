import 'package:flutter/material.dart';

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

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var tinggiGambarLatarBelakang = screenHeight * 2 / 3.5;

    return Scaffold(
      body: Column(
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
                            backgroundImage: AssetImage('assets/icons/Ava.png'),
                          ),
                          SizedBox(width: 17),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'KRISH',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.star,
                                      color: Colors.white, size: 20),
                                  Text(
                                    ' 4.9',
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
                // Teks "Until 26.09"
                Positioned(
                  bottom: 30,
                  right: 20,
                  child: Text(
                    'Until 26.09',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ],
            ),
          ),
          TitleWidget(),
          BottomButtonsWidget(),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
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
                  'Go for a walk',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 24.0,
              ),
            ],
          ),
          Text(
            'and feed the dog',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Leaving for a week, French Bulldog Wilfred needs help feeding twice a day and walk from 26 to 30 September. I bought food, it will be easy.',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16.0,
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: <Widget>[
              Icon(
                Icons.wallet_giftcard, // Ikon dompet
                color: Colors.black,
                size: 24.0,
              ),
              SizedBox(width: 8), // Tambahkan ruang antara ikon dan teks
              Text(
                "Reward 34",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
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
              Text(
                '3 HERALD 400m from you',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
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
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Color.fromRGBO(165, 142, 255, 1),
              shape: CircleBorder(),
            ),
            child: Icon(Icons.chat),
          ),
          SizedBox(width: 16),
          Expanded(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color.fromRGBO(165, 142, 255, 1),
              ),
              child: Text('Response'),
            ),
          ),
        ],
      ),
    );
  }
}
