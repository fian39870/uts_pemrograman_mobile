import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Horizontal Card List'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchFilterWidget(),
            SizedBox(height: 15),
            HeadingWidget(),
            SizedBox(width: 15),
            Expanded(
              child: HorizontalCardList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search, color: Colors.black),
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(165, 142, 255, 1),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Next to You',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: RichText(
                text: TextSpan(
                  text: 'On The Map >',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(151, 93, 93, 88),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        HorizontalCard(
          image: 'assets/images/imgDogCard.png',
          title: 'Card 1',
        ),
        HorizontalCard(
          image: 'assets/images/imgDogCard.png',
          title: 'Card 2',
        ),
        HorizontalCard(
          image: 'assets/images/imgDogCard.png',
          title: 'Card 3',
        ),
      ],
    );
  }
}

class HorizontalCard extends StatelessWidget {
  final String image;
  final String title;

  HorizontalCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 150.0,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.message),
                  SizedBox(width: 5.0),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
