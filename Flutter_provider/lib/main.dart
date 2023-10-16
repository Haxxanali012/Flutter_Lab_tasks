import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class ColorProvider with ChangeNotifier {
  Color _backgroundColor = Colors.amberAccent;

  Color get backgroundColor => _backgroundColor;

  void changeColor() {
    _backgroundColor = Colors.white;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ColorProvider(),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Color Change provider task'),
      ),
      body: Container(
        color: colorProvider.backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              colorProvider.changeColor();
            },
            child: Text('Change Color'),
          ),
        ),
      ),
    );
  }
}
