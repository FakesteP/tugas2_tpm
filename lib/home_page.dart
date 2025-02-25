import 'package:flutter/material.dart';
import 'group_page.dart';
import 'math_page.dart';
import 'odd_even_page.dart';
import 'sum_total_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Utama',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green.shade700,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade200, Colors.green.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/logo.png',
              width: 150,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  _buildMenuItem(
                      context, 'Data Kelompok', Icons.group, GroupPage()),
                  _buildMenuItem(context, 'Penjumlahan & Pengurangan',
                      Icons.calculate, MathPage()),
                  _buildMenuItem(context, 'Cek Ganjil/Genap',
                      Icons.format_list_numbered, OddEvenPage()),
                  _buildMenuItem(context, 'Jumlah Total Angka', Icons.functions,
                      SumTotalPage()),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade700,
        child: Icon(Icons.help, color: Colors.white),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Informasi'),
              content: Text(
                  'Aplikasi ini membantu Anda dalam perhitungan matematika sederhana.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Tutup'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, IconData icon, Widget page) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        shadowColor: Colors.black45,
        color: Colors.white,
        child: ListTile(
          leading: Icon(icon, color: Colors.green.shade700, size: 30),
          title: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.green.shade900),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.green.shade800),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => page)),
        ),
      ),
    );
  }
}
