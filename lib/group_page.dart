import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  final List<Map<String, String>> members = [
    {"name": "Hafizh Akbar Karimy", "id": "123220116"},
    {"name": "Baretta Panuju Luhur", "id": "123220204"},
    {"name": "Firmansyah Ajitya Putra", "id": "123220212"},
    {"name": "Dainoven Marchmaurrel D A S", "id": "123220215"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kelompok',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Anggota Kelompok:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen.shade700),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Colors.lightGreen.shade700, // Warna latar hijau
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(members[index]["name"]!),
                      subtitle: Text(members[index]["id"]!),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
