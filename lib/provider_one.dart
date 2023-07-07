import 'package:flutter/material.dart';
import 'package:flutter_pract_one/provider_class/count_number.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountNumber()),
        ],
        child: const MyApp(),
      ),
     );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: ChangeNotifierProvider<CountNumber>(
      //   builder: (_)=> CountNumber(),
      home: ProviderOne(),
    );
  }
}

class ProviderOne extends StatefulWidget {
  const ProviderOne({Key? key}) : super(key: key);

  @override
  State<ProviderOne> createState() => _ProviderOneState();
}

class _ProviderOneState extends State<ProviderOne> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CountNumber>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${counter.count}' , style: const TextStyle(
              fontSize: 40
            ),),
            InkWell(
              onTap: () {
                counter.increment();
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                height: 50,
                width: 100,
                child: const Text("+", style: TextStyle(
                    fontSize: 30
                ),),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {
                counter.decrement();
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                height: 50,
                width: 100,
                child: const Text("-",style: TextStyle(
                    fontSize: 30
                ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
