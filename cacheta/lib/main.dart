import 'package:flutter/material.dart';

void main() {
  runApp(Cacheta());
}

class Cacheta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pontos = 7;

  void decrement() {
    setState(() {
      pontos--;
    });
  }

  void increment() {
    setState(() {
      pontos++;
    });
  }

  bool get isEmpty => pontos == 0;
  bool get isFull => pontos == 10;

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu marcador de cacheta'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/cacheta.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
              child: Text(
                'Quantos pontos terÃ¡ estÃ¡ rodada?',
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                      backgroundColor: isEmpty
                          ? Colors.blue.withOpacity(0.3)
                          : const Color.fromARGB(255, 12, 94, 161),
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )

                      // padding: const EdgeInsets.all(32),
                      ),
                  child: const Text(
                    '-',
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  pontos.toString(),
                  style: TextStyle(
                    fontSize: 100,
                    color: isFull || isEmpty
                        ? Colors.red
                        : Color.fromARGB(255, 10, 48, 79),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                      backgroundColor: isFull
                          ? Colors.blue.withOpacity(0.3)
                          : const Color.fromARGB(255, 12, 94, 161),
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )

                      // padding: const EdgeInsets.all(32),
                      ),
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
