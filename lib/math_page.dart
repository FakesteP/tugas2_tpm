import 'package:flutter/material.dart';

class MathPage extends StatefulWidget {
  @override
  _MathPageState createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  double? _result;
  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();
  String _errorMessage = '';

  void _calculate(bool isAddition) {
    setState(() {
      _errorMessage = '';
      _result = null;

      if (_num1.text.isEmpty || _num2.text.isEmpty) {
        _errorMessage = 'Harap isi kedua angka!';
        return;
      }

      double? n1 = double.tryParse(_num1.text);
      double? n2 = double.tryParse(_num2.text);

      if (n1 == null || n2 == null) {
        _errorMessage = 'Masukkan hanya angka yang valid!';
        return;
      }

      _result = isAddition ? (n1 + n2) : (n1 - n2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Penjumlahan & Pengurangan',
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
              controller: _num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka 1',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.green.shade50,
                prefixIcon: Icon(Icons.filter_1, color: Colors.green.shade700),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka 2',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.green.shade50,
                prefixIcon: Icon(Icons.filter_2, color: Colors.green.shade700),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text(
                    'Tambah',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _calculate(false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text(
                    'Kurang',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.green.shade50,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  _result != null
                      ? 'Hasil: $_result'
                      : 'Hasil akan muncul di sini',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
