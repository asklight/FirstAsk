import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Drawer Demo'),
        ),
        body: const Center(
            child: Text("Doubi")
        ),
        // ------------添加左侧边栏---------------
        drawer: const Drawer(
          child: Text('左侧边栏'),
        ),
        // ------------添加右侧边栏---------------
        endDrawer: const Drawer(
            child: Text('右侧边栏')
        )
    );
  }
  
}