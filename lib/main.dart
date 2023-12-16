// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Color_Screen()),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bgsplash.png'), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/guess.png',
                  width: 600,
                  height: 300,
                ),
                const SizedBox(height: 10),
                const Text(
                  'GUESS THE COLOR!',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      backgroundColor: Colors.white60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Color_Screen extends StatelessWidget {
  final List<String> colorNames = [
    'Red',
    'Blue',
    'Green',
    'Yellow',
    'Orange',
    'Purple',
    'Pink',
    'Brown',
    'Cyan',
  ];

  Color_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'GUESS The COLOR',
          style: TextStyle(
              backgroundColor: Colors.white,
              color: Colors.red,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bgsplash.png'), fit: BoxFit.fill),
        ),
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: colorNames.length,
          itemBuilder: (context, gcolr) {
            return GestureDetector(
              onLongPress: () {
                // On long press, name of the color will be displayed on grid box
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text('This COLOR is ${colorNames[gcolr]}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              onDoubleTap: () {
                // On double tapping, the name of the next color will be displayed.
                int nextIndex = (gcolr + 1) % colorNames.length;
                // String nextColor = colorNames[nextIndex]; this can also be done
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text('Next Color is ${colorNames[nextIndex]}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        //dialog box with OK initialized.
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                color: _getColor(gcolr), //get color
                child: const Center(
                  child: Text(
                    'Tap Tap!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _getColor(int colr) {
    //color
    switch (colr % 9) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.purple;
      case 6:
        return Colors.pink;
      case 7:
        return Colors.brown;
      case 8:
        return Colors.cyan;
      default:
        return Colors.grey;
    }
  }
}
