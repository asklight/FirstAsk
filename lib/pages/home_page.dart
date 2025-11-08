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
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('主页'),
        ),
        body: ListView(
          children: [
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              elevation: 10,
              shadowColor: Colors.grey,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/images/trump.jpg"),
                    ),
                    title: Text("特朗普"),
                    subtitle: Text("美国总统"),
                  ),
                  Divider(color: Colors.grey.shade400,indent: 10,endIndent: 10,thickness: 1),
                  const ListTile(
                    title: Text("党派：共和党",style: TextStyle(fontSize: 16),),
                  ),
                  const ListTile(
                    title: Text("口号：Make American great again"),
                  )
                ],
              ),
            ),
            
            Card(
              color: Colors.white,
              margin: EdgeInsets.all(10),
              elevation: 10,
              shadowColor: Colors.grey.shade400,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/images/biden.jpg"),
                    ),
                    title: Text("拜登"),
                    subtitle: Text("美国前总统"),
                  ),
                  Divider(color: Colors.grey.shade400,indent: 10,endIndent: 10,thickness: 1),
                  const ListTile(
                    title: Text("党派：民主党",style: TextStyle(fontSize: 16),),
                  ),
                  const ListTile(
                    title: Text("口号：Let me think"),
                  )
                ],
              ),
            )
          ],
        )
        );
        // ------------添加左侧边栏---------------
        drawer: const Drawer(
          child: Text('左侧边栏'),
        );
  }
  
}