import 'package:flutter/material.dart';
import 'package:variances/AppController.dart';
import 'package:variances/libs.dart';

late final controller = AppController();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
        brightness: Brightness.dark,
        inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.inputController,
                    decoration: InputDecoration(labelText: 'Base value'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: controller.satoshiInputController,
                    decoration: InputDecoration(labelText: 'Base value (satoshi [10E-9])'),
                  ),
                ),
              ],
            ),
            Observer(builder: (context) {
              final value = controller.inputValue.value;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Theme(
                    data: ThemeData(
                      textTheme: TextTheme(caption: TextStyle(color: Colors.green)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ValueTile(
                            title: (value * 1.001).toStringAsFixed(8),
                            subtitle: '+0.1%',
                          ),
                        ),
                        Expanded(
                          child: ValueTile(
                            title: (value * 1.002).toStringAsFixed(8),
                            subtitle: '+0.2%',
                          ),
                        ),
                        Expanded(
                          child: ValueTile(
                            title: (value * 1.01).toStringAsFixed(8),
                            subtitle: '+1%',
                          ),
                        ),
                        Expanded(
                          child: ValueTile(
                            title: (value * 1.02).toStringAsFixed(8),
                            subtitle: '+2%',
                          ),
                        ),
                        Expanded(
                          child: ValueTile(
                            title: (value * 1.05).toStringAsFixed(8),
                            subtitle: '+5%',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      textTheme: TextTheme(caption: TextStyle(color: Colors.redAccent)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ValueTile(
                            title: (value * (1 - 0.001)).toStringAsFixed(8),
                            subtitle: '-0.1%',
                          ),
                        ),
                        Expanded(
                          child: ValueTile(
                            title: (value * (1 - 0.002)).toStringAsFixed(8),
                            subtitle: '-0.2%',
                          ),
                        ),
                        Expanded(
                          child: ValueTile(
                            title: (value * (1 - 0.01)).toStringAsFixed(8),
                            subtitle: '-1%',
                          ),
                        ),
                        Expanded(
                          child: ValueTile(
                            title: (value * (1 - 0.02)).toStringAsFixed(8),
                            subtitle: '-2%',
                          ),
                        ),
                        Expanded(
                          child: ValueTile(
                            title: (value * (1 - 0.05)).toStringAsFixed(8),
                            subtitle: '-5%',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ValueTile extends StatelessWidget {
  const ValueTile({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Text(subtitle, style: context.textTheme.caption),
        ],
      ),
    );
  }
}
