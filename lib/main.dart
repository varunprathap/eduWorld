import 'package:flutter/material.dart';
import './Notification.dart' as notification;
import './More.dart' as more;
import './Tools.dart' as tools;
import './Classes.dart' as classes;





void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
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


  TabController controller;


  @override
  void initState(){

     super.initState();
     controller=new TabController(vsync: this,length: 4);
  }

  @override
  void dispose(){

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),backgroundColor:Colors.amber
      ),bottomNavigationBar: new Material(
color: Colors.amber,
        child: new TabBar(
                controller: controller,
                tabs: <Tab>[

                 new Tab(icon: new Icon(Icons.notifications),),
                 new Tab(icon: new Icon(Icons.settings),),
                 new Tab(icon: new Icon(Icons.rss_feed),)


                ],

        ),
      ),

      body: new TabBarView(

          controller: controller,
          children: <Widget>[new notification.Notification(),new tools.Tools(),new more.More()],
      ),
    ); 
  }
}
