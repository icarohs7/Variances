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
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      appBar: AppBar(
        title: Text('Variances'),
        centerTitle: true,
      ),
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
              return Row(
                children: [
                  Expanded(
                    child: DefaultTextStyle(
                      style: context.bodyText1!,
                      child: Theme(
                        data: ThemeData(
                          textTheme: TextTheme(caption: TextStyle(color: Colors.green)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text((value * 1.001).toStringAsFixed(8)),
                              subtitle: Text('+0.1%'),
                            ),
                            ListTile(
                              title: Text((value * 1.002).toStringAsFixed(8)),
                              subtitle: Text('+0.2%'),
                            ),
                            ListTile(
                              title: Text((value * 1.01).toStringAsFixed(8)),
                              subtitle: Text('+1%'),
                            ),
                            ListTile(
                              title: Text((value * 1.02).toStringAsFixed(8)),
                              subtitle: Text('+2%'),
                            ),
                            ListTile(
                              title: Text((value * 1.05).toStringAsFixed(8)),
                              subtitle: Text('+5%'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                        textTheme: TextTheme(caption: TextStyle(color: Colors.redAccent)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text((value * (1 - 0.001)).toStringAsFixed(8)),
                            subtitle: Text('-0.1%'),
                          ),
                          ListTile(
                            title: Text((value * (1 - 0.002)).toStringAsFixed(8)),
                            subtitle: Text('-0.2%'),
                          ),
                          ListTile(
                            title: Text((value * (1 - 0.01)).toStringAsFixed(8)),
                            subtitle: Text('-1%'),
                          ),
                          ListTile(
                            title: Text((value * (1 - 0.02)).toStringAsFixed(8)),
                            subtitle: Text('-2%'),
                          ),
                          ListTile(
                            title: Text((value * (1 - 0.05)).toStringAsFixed(8)),
                            subtitle: Text('-5%'),
                          ),
                        ],
                      ),
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
