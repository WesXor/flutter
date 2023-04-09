import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bullets Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BulletsNavigationPage(),
    );
  }
}

class BulletsNavigationPage extends StatefulWidget {
  @override
  _BulletsNavigationPageState createState() => _BulletsNavigationPageState();
}

class _BulletsNavigationPageState extends State<BulletsNavigationPage> {
  int _currentPageIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bullets Navigation'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Page 1',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Page 2',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  child: Center(
                    child: Text(
                      'Page 3',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBullet(0),
              SizedBox(width: 8),
              _buildBullet(1),
              SizedBox(width: 8),
              _buildBullet(2),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildBullet(int index) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: _currentPageIndex == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
