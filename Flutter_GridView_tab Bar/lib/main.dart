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
        title: 'Flutter Mid Preparation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(
          title: "hello",
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "hello";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              iconSize: 25,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
              iconSize: 25,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              iconSize: 25,
            ),
          ],
          bottom: const TabBar(tabs: [
            Tab(
              child: Text("chats"),
            ),
            Tab(
              child: Text("status"),
            ),
            Tab(
              child: Text("Calls"),
            )
          ]),
          backgroundColor: const Color.fromRGBO(18, 140, 126, 50),
        ),
        body: TabBarView(children: [
          lab_dub(),
          const GridWidget(),
          const Text(
            "The Call History has been deleted",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ]),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
            ),
          ]),
        ),
      ),
    ));
  }
}

class GridWidget extends StatefulWidget {
  const GridWidget({super.key});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

// ignore: camel_case_types, must_be_immutable
class lab_dub extends StatelessWidget {
  lab_dub({super.key, this.name, this.roll});

  String? name, roll;
  List<String> students = ["Tokiyo", "Rio", "Berlin", "professor", "Richael"];
  List<String> num = [
    '03344556343',
    '03163629638',
    '0324666644',
    '0325454256',
    '031538656432'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(students[index]),
                subtitle: Text(num[index]),
              );
            }));
  }
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: 12,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 60, crossAxisSpacing: 60),
          itemBuilder: (context, index) {
            return Container(
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 5,
                width: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.abc,
                      size: 50,
                    ),
                    Text("BOX $index")
                  ],
                ));
          },
        ),
      ),
    );
  }
}
