import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int? _counter;
  List<Color> _colorlist = [
    Color.fromARGB(255, 0, 14, 14),
    Color.fromARGB(255, 123, 123, 123),
    Color.fromARGB(210, 33, 6, 204),
  ];
  int? _colorindex = 0;
  @override
  void initState() {
    _counter = 0;
    log("INIT STATE");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log("Did CHANGE DEPENDENCIES");
  }

  @override
  Widget build(BuildContext context) {
    String satr1 = "SubhanAlloh";
    String satr2 = "Alhamdulillah";
    String satr3 = "Allohu Akbar";
    String matn;
    if (_counter! <= 33) {
      matn = satr1;
    } else if (_counter! <= 66) {
      matn = satr2;
    } else {
      matn = satr3;
    }

    log("BUILD");
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasbeh'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(213, 112, 51, 203),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/tasbeh.jpg',
                fit: BoxFit.cover,
              ),
              Text('$matn'),
              AnimatedSwitcher(
                  duration: Duration(milliseconds: 100),
                  //switchOutCurve: Curves.bounceIn,
                  transitionBuilder: (child, animation) => ScaleTransition(
                        scale: animation,
                        child: RotationTransition(
                          turns: animation,
                          child: child,
                        ),
                      ),
                  child: Text(
                    _counter.toString(),
                    key: ValueKey<int>(_counter!),
                    style: TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.w700,
                        color: _colorlist[_colorindex!]),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            backgroundColor: Color.fromARGB(31, 219, 138, 9),
            heroTag: '1',
            onPressed: () {
              _counter = 0;
              setState(() {});
            },
            label: Text('Yangilash'),
          ),
          SizedBox(
            width: 35,
            height: 600,
          ),
          FloatingActionButton.extended(
            backgroundColor: Color.fromARGB(31, 219, 138, 9),
            heroTag: '2',
            onPressed: () {
              _colorindex;
              _counter = _counter! + 1;
              if (_counter == 33 || _counter == 66 || _counter == 99) {
                _colorindex = _counter! ~/ 33 - 1;
              } else {
                _colorindex = _counter! ~/ 33;
              }

              if (_counter! >= 99) {
                _counter = 0;
              }
              setState(() {});
            },
            label: Text('Qoshish'),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
