import 'package:flutter/material.dart';
import 'page_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchFilterWidget(),
            SizedBox(height: 5),
            HeadingWidget(),
            Container(
              height: 410,
              child: HorizontalCardList(),
            ),
            Categories(),
            Container(
              margin: EdgeInsets.all(10.0),
              child: SmallTaskCard(),
            ),
            SizedBox(height: 50),
            BottomTabBar(),
          ],
        ),
        floatingActionButton: Ink(
          decoration: BoxDecoration(
            color: Color.fromRGBO(165, 142, 255, 1),
            shape: BoxShape.circle,
          ),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            elevation: 2,
            backgroundColor: Colors.transparent,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class SearchFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
              icon: Image.asset(
                'assets/icons/icon.png',
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
          title: 'Go for a walk and feed the dog',
        ),
        HorizontalCard(
          image: 'assets/images/imgkaktus.png',
          title: 'Water the flowers once a week',
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: 30),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 230,
                      ),
                    ),
                    Positioned(
                      top: 22,
                      right: 25,
                      child: Image.asset(
                        'assets/icons/love.png',
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Text(
                        'Until 26.09',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 9,
                      left: 9,
                      child: Container(
                        width: 150,
                        height: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          color: Colors.white.withOpacity(0.4),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/icons/Ava.png'),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'KRISH',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.verified,
                                  color: Colors.green,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 63.0),
                    Image.asset(
                      'assets/icons/Icon_Chat.png',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Categories',
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
                  text: 'See All ',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromARGB(151, 93, 93, 88),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          Icon(Icons.chevron_right,
              size: 24.0, color: Color.fromARGB(151, 93, 93, 88))
        ],
      ),
    );
  }
}

class SmallTaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/icons/Icon_Moving.png',
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Moving and Things',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '24 tasks',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, size: 24.0),
          ],
        ),
      ),
    );
  }
}

class BottomTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/icons/iconMenuList.png',
            ), // Ikon menu list
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              'assets/icons/iconMenuHeart.png',
            ),
            onPressed: () {},
          ),
          SizedBox(width: 48),
          IconButton(
            icon: Image.asset(
              'assets/icons/iconMenuChat.png',
            ), // Ikon menu chat
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              'assets/icons/iconMenuUser.png',
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
