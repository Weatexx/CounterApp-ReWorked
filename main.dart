import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;  // sayaç başlangıç değeri
  double _fontSize = 25.0; //sayaç başlangıç fontu
  bool _isDarkMode = false; // gece-gündüz modu başlangıç modu (gündüzde başlıyor)

  void _incrementCounter() { // sayacı arttırma fonksiyonu
    setState(() {
      _counter++; // 1 arttır
    });
  }

  void _decrementCounter() { // sayacı azaltma fonksiyonu
    setState(() {
      _counter--; // azalt
    });
  }

  void _increaseFontSize() { // sayaç fontunu arttırma fonksiyonu
    setState(() {
      _fontSize += 2.0; // 2 arttır
    });
  }

  void _decreaseFontSize() { // saya. fontunu azaltma fonksiyonu
    setState(() {
      _fontSize -= 2.0; // 2 azalt
    });
  }

  void _toggleDarkMode() { // Gece-gündüz modu butonuna basıldığında çağrılacak fonksiyon
    setState(() {
      _isDarkMode = !_isDarkMode; // değişken değerini tersine çevir 
    });
  }

  Color _getTextColor() { // Sayı metni rengini belirleyen fonksiyon
    if (_counter < 0) { // 0'dan küçükse 
      return Colors.red; // kırmızı yap
    } else { // 0'dan büyükse
      return Colors.green; // yeşil yap
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '18648 Sayaç', // browser adı
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(), // Gece-gündüz modu temaları
      home: Scaffold(
        appBar: AppBar(
          title: Text('18648 Sayaç'),  //appbard'da gözüken ad
          actions: [
            
              IconButton(
                icon: Text(
                  'A',
                  style: TextStyle(fontSize: 20.0), // A ikonu fontu
                ),
                onPressed: _increaseFontSize, // basılırsa çalıştır _increasefontsize
              ),
            
            
              IconButton(
                icon: Text(
                  'a',
                  style: TextStyle(fontSize: 20.0), // a ikonu fontu
                ),
                onPressed: _decreaseFontSize, // basılırsa çalıştır _decreasefontsize
              ),
            
            IconButton( // Gece-gündüz modu butonu
              icon: Icon(
                _isDarkMode ? Icons.wb_sunny : Icons.mode_night_outlined, //ikonlar
                color: Colors.white, //ikon renkleri
              ),
              onPressed: _toggleDarkMode, // basılırsa çalıştır _toggledarkmode
            ),
          ],
        ),
        
        
        
              //SAYAÇ 
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sayaç Değeri:', // ortadaki yazı
                style: TextStyle(fontSize: _fontSize),
              ),
              Text( // yazının altındaki 0 değeri
                '$_counter',                                   //font değerine göre ayarlayan copywith
                style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: _fontSize, color: _getTextColor()),
              ),
              SizedBox(height: 16.0),
              
              
              
              
              
              
              //SAYAÇ ICON VE TEXTLER
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Arttır',
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 16.0),
                  FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Azalt',
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
