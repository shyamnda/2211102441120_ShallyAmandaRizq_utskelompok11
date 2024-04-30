import 'package:flutter/material.dart';
import 'activity_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Menampilkan gambar dari URL di atas teks "Selamat Datang di WonderLearn Junior!"
              Expanded(
                child: Image.network(
                  'lib/screens/gambar.jpeg', // URL gambar
                  fit: BoxFit.cover, // Atur bagaimana gambar diisi dalam widget
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Selamat Datang di WonderLearn Junior!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto', // Menggunakan font Roboto
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Menggunakan warna biru untuk menonjolkan teks selamat datang
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Umur'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Alamat'),
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Nomor HP'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  int age = int.tryParse(ageController.text) ?? 0;
                  String address = addressController.text;
                  String phone = phoneController.text;

                  if (name.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActivityScreen(
                          name: name,
                          age: age,
                          address: address,
                          phone: phone,
                        ),
                      ),
                    ).then((_) {
                      // Setelah kembali dari ActivityScreen, kosongkan semua biodata
                      nameController.clear();
                      ageController.clear();
                      addressController.clear();
                      phoneController.clear();
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Silakan isi nama'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Masuk'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
