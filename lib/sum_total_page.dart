import 'package:flutter/material.dart';

class SumTotalPage extends StatefulWidget {
  @override
  _SumTotalPageState createState() => _SumTotalPageState();
}

class _SumTotalPageState extends State<SumTotalPage> {
  final TextEditingController _numbersController = TextEditingController();
  int? _sum;
  int? _count;
  String _errorMessage = '';

  void _calculateCount() {
    setState(() {
      _errorMessage = '';
      _count = null;
      _sum = null;

      if (_numbersController.text.isEmpty) {
        _errorMessage = 'Harap masukkan angka!';
        return;
      }

      List<int> numbers = _numbersController.text
          .split('')
          .map((e) => int.tryParse(e) ?? -1)
          .where((e) => e >= 0)
          .toList();

      if (numbers.isEmpty) {
        _errorMessage = 'Masukkan hanya angka yang valid!';
        return;
      }

      _count = numbers.length;
    });
  }

  void _calculateSum() {
    setState(() {
      _errorMessage = '';
      _sum = null;
      _count = null;

      if (_numbersController.text.isEmpty) {
        _errorMessage = 'Harap masukkan angka!';
        return;
      }

      List<int> numbers = _numbersController.text
          .split('')
          .map((e) => int.tryParse(e) ?? -1)
          .where((e) => e >= 0)
          .toList();

      if (numbers.isEmpty) {
        _errorMessage = 'Masukkan hanya angka yang valid!';
        return;
      }

      _sum = numbers.fold(0, (previous, current) => previous + current).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jumlah & Total Angka',
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
              controller: _numbersController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan angka',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _calculateCount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text(
                    'Jumlah Angka',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: _calculateSum,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade400,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text(
                    'Total Jumlah',
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
              color: Colors.green.shade100,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  _sum != null
                      ? 'Total: $_sum'
                      : _count != null
                          ? 'Jumlah Angka: $_count'
                          : 'Hasil akan muncul di sini',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
