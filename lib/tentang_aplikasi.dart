import 'package:flutter/material.dart';

class ttg_apk extends StatelessWidget {
  const ttg_apk({super.key});

  @override
  Widget build(BuildContext context) {
    final String body =
        '''Aplikasi E-Pasal telah dirancang dengan tujuan utama untuk memberikan akses yang lebih mudah bagi pengguna dalam memahami peraturan perundang-undangan terkait pemilu dan pemilihan yang masih berlaku. Salah satu fitur utamanya adalah kemampuan untuk mengakses berbagai undang-undang terkait dalam format PDF langsung di aplikasi, memungkinkan pengguna untuk merujuk pada informasi yang diperlukan secara cepat dan praktis.

Selain itu, aplikasi ini juga memungkinkan pengguna untuk menyimpan PDF undang-undang favorit mereka di dalam aplikasi, sehingga mereka dapat mengaksesnya kapan pun diperlukan tanpa harus mencarinya lagi. Tidak hanya itu, E-Pasal juga memperkenalkan pengguna kepada berbagai platform media sosial resmi Bawaslu Kota Surabaya, termasuk Instagram, Facebook, Twitter, dan YouTube, sehingga pengguna dapat terhubung dengan konten terbaru serta kegiatan Bawaslu Kota Surabaya melalui tautan yang disediakan di dalam aplikasi. Dengan fitur-fitur ini, aplikasi E-Pasal bertujuan untuk memberikan pengalaman pengguna yang komprehensif dan mempermudah mereka dalam memahami serta mengakses informasi terkait pemilu dan pemilihan.''';
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color(0xFFbc9d61),
        centerTitle: true,
        title: const Text(
          'Tentang Aplikasi',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.53),
        ),
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          iconSize: 25,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          Container(
              margin: EdgeInsets.only(top: 60, right: 10, left: 10),
              child: Text(
                body,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              )),
        ],
      ),
    );
  }
}