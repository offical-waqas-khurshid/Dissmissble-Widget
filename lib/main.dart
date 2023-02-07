import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){},
          child: Dismissible(
            secondaryBackground: Container(
              padding:const  EdgeInsets.only(right: 10.0),
              color: Colors.redAccent,
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete, color: Colors.white,),
            ),
            background: Container(
              padding:const  EdgeInsets.only(left: 10.0),
              color: Colors.green,
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.archive, color: Colors.white,),
            ),
            key: ValueKey<int>(items[index]),
            onDismissed: (DismissDirection direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            child: ListTile(
              title: Text(
                'Item ${items[index]}',
              ),
            ),
          ),
        );
      },
    );
  }
}
