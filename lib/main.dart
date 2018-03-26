import 'package:flutter/material.dart';
import './Notification.dart' as notification;
import './More.dart' as more;
import './Tools.dart' as tools;
import './Classes.dart' as classes;
import './Feed.dart' as feed;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'eduWorld',
      theme: new ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.red),
      home: new MyHomePage(title: 'eduWorld app'),
      showPerformanceOverlay: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  PageController controller;
  int page = 0;

  @override
  void initState() {
    super.initState();
    controller = new PageController(initialPage: this.page);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text(widget.title),
          backgroundColor: Colors.amber,
          actions: <Widget>[
            new IconButton(
              // action button
              icon: new Icon(Icons.notification_important),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.cloud),
              backgroundColor: Colors.amber,
              title: new Text("Feed"),
            ),
            new BottomNavigationBarItem(
              title: new Text('Notifications'),
              icon: new Stack(children: <Widget>[
                new Icon(Icons.notifications),
                new Positioned(
                  // draw a red marble
                  top: 0.0,
                  right: 0.0,
                  child: new Icon(Icons.brightness_1,
                      size: 8.0, color: Colors.redAccent),
                )
              ]),
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.people),
                backgroundColor: Colors.amber,
                title: new Text("Classes")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.settings),
                backgroundColor: Colors.amber,
                title: new Text("Tools")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.store),
                backgroundColor: Colors.amber,
                title: new Text("More"))
          ],
          onTap: onTap,
          currentIndex: page,
        ),
        body: new PageView(
            controller: controller,
            onPageChanged: onPageChanged,
            children: <Widget>[
              new feed.Feed(),
              new notification.Notification(),
              new classes.Classes(),
              new tools.Tools(),
              new more.More()
            ]));
  }

  void onTap(int index) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
