import 'package:flutter/cupertino.dart';

class PublishPage extends StatefulWidget{
  const PublishPage({super.key});

  @override
  State<PublishPage> createState() {
    return _PublishPageState();
  }
}

class _PublishPageState extends State<PublishPage>{
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("发布"));
  }

}
