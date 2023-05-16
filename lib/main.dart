import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Kalkulator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nilaiSatuController = TextEditingController();
  TextEditingController nilaiDuaController = TextEditingController();
  double _hasil = 0;

 void _operasi(op) {
    if (nilaiSatuController.text.isEmpty || nilaiDuaController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Harap masukkan kedua nilai terlebih dahulu"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
      return;
    }

    double? nilaiSatu = double.tryParse(nilaiSatuController.text);
    double? nilaiDua = double.tryParse(nilaiDuaController.text);
   
    if (op == '+') {
      double? _hasilAkhir = nilaiSatu! + nilaiDua!;
       setState(() {
      _hasil = _hasilAkhir;
    });
    } else if (op == '-') {
      double? _hasilAkhir = nilaiSatu! - nilaiDua!;
      setState(() {
      _hasil = _hasilAkhir;
    });
      
    } else if (op == 'x') {
      double? _hasilAkhir = nilaiSatu! * nilaiDua!;
      setState(() {
      _hasil = _hasilAkhir;
    });
    } else if (op == '/') {
      double? _hasilAkhir = nilaiSatu! / nilaiDua!;
      setState(() {
      _hasil = _hasilAkhir;
    });
    } else {
      nilaiSatuController.clear();
      nilaiDuaController.clear();
      setState(() {
        _hasil = 0;
      });
    }
   
  }

  ElevatedButton _buildButton(String text, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nilaiSatuController,
              decoration: const InputDecoration(
                labelText: "Nilai 1",
                hintText: "Masukkan nilai",
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nilaiDuaController,
              decoration: const InputDecoration(
                labelText: "Nilai 2",
                hintText: "Masukkan nilai 2",
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('+', () => _operasi('+')),
                _buildButton('-', () => _operasi('-')),
                _buildButton('x', () => _operasi('x')),
                _buildButton('/', () => _operasi('/')),
                _buildButton('C', () => _operasi('c'))
              ],
            ),
            SizedBox(height: 16),
            Text(
              '$_hasil',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }

 
}
