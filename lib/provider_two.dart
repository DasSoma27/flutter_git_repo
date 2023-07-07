import 'package:flutter/material.dart';
import 'package:flutter_pract_one/provider_class/count_number.dart';
import 'package:provider/provider.dart';

void main(){
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CountNumber()),
    ],
    child: const MainApp(),
  ),);
}
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProviderTwo() ,
    );
  }
}
class ProviderTwo extends StatefulWidget {
  const ProviderTwo({Key? key}) : super(key: key);

  @override
  State<ProviderTwo> createState() => _ProviderTwoState();
}

class _ProviderTwoState extends State<ProviderTwo> {
  List<String> name =[
    "Soma",
    "Payel",
    "Vita",
  ];






  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CountNumber>(context);

    return  Scaffold(
      body: Column(
        children: [
          ListView.separated(
            separatorBuilder: (context , index)=>const Divider(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title:Image.network(
                    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(name[index]),
                Text('${counter.count}')
                  ],
                ),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    InkWell(
                      onTap: () {
                        counter.increment() ;
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        color: Colors.green,
                        child: Text("+"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        counter.decrement();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        color: Colors.red,
                        child: Text("-"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}


