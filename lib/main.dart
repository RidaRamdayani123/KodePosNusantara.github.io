import 'package:flutter/material.dart';
import 'package:kode_pos_nusantara/http.dart';

void main() {
  runApp(const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kode Pos Nusantara',
      theme: ThemeData(primarySwatch: Colors.red,),
      home: const MyHomePage(title: 'Kode Pos Nusantara'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) :super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List data;
  late int dataCount;
  late HttpHelper helper;
  @override
  void initState() {
    data = [];
    dataCount = 0;
    helper = HttpHelper();
    super.initState();
  }

   Future search(text) async {
    
    data = await helper.findPostal(text);
    setState(() {
      dataCount = data.length;
      data = data;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            onSubmitted: (String text) {
              search(text);
            },
            decoration: InputDecoration(
              labelText: 'cari lokasi (cth: kel dan prov)', suffixIcon: Icon(Icons.search)
           ) ),
          const SizedBox(
              height: 20,
          ),
          Expanded(child: ListView.builder(
          itemCount: dataCount,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                     
                      title: Text(
                        data[position].urban,
                     
                      ),
                      subtitle: Text(
                        data[position].postalcode
                        // maxLines: 1,
                        // overflow: TextOverflow.ellipsis,
                        // softWrap: false,
                      ),

            ));
          },
        ),)
        ],)
    ));        
  }
}