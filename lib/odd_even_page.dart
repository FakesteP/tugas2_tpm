import 'package:flutter/material.dart';

class OddEvenPage extends StatefulWidget {
  @override
  _OddEvenPageState createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  final TextEditingController _numberController = TextEditingController();
  String _result = '';
  String _errorMessage = '';

  void _checkOddEven() {
    setState(() {
      _errorMessage = '';
      _result = '';

      if (_numberController.text.isEmpty) {
        _errorMessage = 'Harap masukkan angka!';
        return;
      }

      double? number = double.tryParse(_numberController.text);
      if (number == null) {
        _errorMessage = 'Masukkan angka yang valid!';
        return;
      }

      int integerPart = number.floor();
      _result = (integerPart % 2 == 0) ? 'Genap' : 'Ganjil';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cek Ganjil/Genap',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Angka',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.green.shade50,
                prefixIcon: Icon(Icons.numbers, color: Colors.green.shade700),
              ),
            ),
            SizedBox(height: 10),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkOddEven,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Cek',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.green.shade100,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  _result.isNotEmpty
                      ? 'Hasil: $_result'
                      : 'Hasil akan muncul di sini',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
