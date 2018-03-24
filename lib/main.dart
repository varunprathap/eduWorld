import 'package:flutter/material.dart';
import './Notification.dart' as notification;
import './More.dart' as more;
import './Tools.dart' as tools;






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
        primarySwatch: Colors.red
      ),
      home: new MyHomePage(title: 'eduWorld app'),
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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {


  PageController controller;
  int page =1;



  @override
  void initState(){

     super.initState();
     controller=new PageController(initialPage: this.page);
  }

  @override
  void dispose(){

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),backgroundColor:Colors.amber
      ),bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                icon: new Icon(new IconData(62008, fontFamily: "mdi")),
                title: new Text("trends"),
              ),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.location_on), title: new Text("feed")),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.people), title: new Text("community"))
            ],
            onTap: onTap,
            currentIndex: page
        ),
      body: new PageView(controller:controller,onPageChanged: onPageChanged, children: <Widget>[new notification.Notification(),new tools.Tools()],)
    ); 
  }

   void onTap(int index) {
    controller.animateToPage(
        index, duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
