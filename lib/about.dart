import 'package:flutter_api_bawaslu/profil.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/home.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher_windows/url_launcher_windows.dart';


class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    final String body =
        '''Aplikasi E-Pasal ini dibuat untuk memudahkan para pengguna melihat pasal pemilu dan pemilihan. Aplikasi ini berisi pdf UU pemilu dan perbawaslu yang masih berlaku.
        ''';
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Tentang Aplikasi',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
              height: 3,
              letterSpacing: 0.58
            ),
          ),
          Container(
            color: Color.fromARGB(255, 0, 0, 0),
            height: 2,
            width: 150,
          ),
          Container(
              margin: EdgeInsets.only(top: 50, right: 5, left: 5),
              child: Text(
                body,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
              'Tentang Perusahaan',
              style: TextStyle(
                 fontFamily: 'Poppins',
                 fontSize: 15,
                 fontWeight: FontWeight.bold,
                 color: Color.fromARGB(255, 0, 0, 0),
                 height: 3,
                 letterSpacing: 0.5
                ),
              ),
            Container(
              padding: EdgeInsets.all(3),
              color: Color.fromARGB(255, 0, 0, 0),
              height: 2,
              width: 150,
            ),
    
              //alamat kantor
              Container(
                margin: const EdgeInsets.only(top: 13.0),
                height: 60,
                width: 800,
                child: Column(
                  children: <Widget> [
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage:AssetImage('images/maps.png'),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                      
                    ),
                    Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.center,
                    child:  Text(
                        ''' Alamat Kantor : Jl. Raya Tenggilis Mejoyo, Kali Rungkut, Kec. Rungkut, Kota Surabaya''',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10, fontFamily: 'Poppins', color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ],
                ),
              ),

              //no telp
              Container(
                height:60,
                width: 800,
                child: Column(
                  children: <Widget> [
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage('images/phone.png'),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.center,
                    child: Text(
                        ''' No. Telp : (031) 99857450''',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10, fontFamily: 'Poppins', color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ],
                ),
              ),

              //jam kerja
              Container(
                height: 60,
                width: 700,
                child: Column(
                  children: <Widget> [
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage('images/clock.png'),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.center,
                    child: Text(
                        ''' Jam Kerja : Senin – Kamis pukul 08.00 – 16.00 WIB 
                      Jum’at pukul 08.00 – 17.00 WIB''',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10, fontFamily: 'Poppins', color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ],
                ),
              ),

              //email
              Container(
                height: 60,
                width: 800,
                child: Column(
                  children: <Widget> [
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage('images/gmail.png'),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.center,
                    child: Text(
                        ''' Email : set.surabaya@bawaslu.go.id''',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10, fontFamily: 'Poppins',color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),  
                  ],
                ),
              ),

              Row(
                mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                children: [
                  //webside
                  ElevatedButton.icon(
                    onPressed: () async{
                      String url = 'https://surabaya.bawaslu.go.id';
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: true, forceWebView: true, enableJavaScript: true);
                      }else{
                        print('The action is not supported');
                      }
                    },
                    icon: Image.asset(
                      'images/world-wide-web.png',
                      height: 30,
                      width: 30,),
                    label: Text(''),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 255, 255),
                      visualDensity: VisualDensity.compact
                    ),
                  ),

                  //instagram
                  ElevatedButton.icon(
                    onPressed: () async{
                      String url = 'https://www.instagram.com/bawaslukotasurabaya/';
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: true, forceWebView: true, enableJavaScript: true);
                      }else{
                        print('The action is not supported');
                      }
                    },
                    icon: Image.asset(
                      'images/instagram.png',
                      height: 30,
                      width: 30,),
                    label: Text(''),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 255, 255),
                      visualDensity: VisualDensity.compact
                    ),
                  ),

                  //Facebook
                  ElevatedButton.icon(
                    onPressed: () async{
                      String url = 'https://www.facebook.com/bawaslukotasurabaya';
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: true, forceWebView: true, enableJavaScript: true);
                      }else{
                        print('The action is not supported');
                      }
                    },
                    icon: Image.asset(
                      'images/facebook.png',
                      height: 30,
                      width: 30,),
                    label: Text(''),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 255, 255),
                      visualDensity: VisualDensity.compact
                    ),
                  ),

                  //twitter
                  ElevatedButton.icon(
                    onPressed: () async{
                      String url = 'https://twitter.com/BawasluSurabaya';
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: true, forceWebView: true, enableJavaScript: true);
                      }else{
                        print('The action is not supported');
                      }
                    },
                    icon: Image.asset(
                      'images/twitter.png',
                      height: 30,
                      width: 30,),
                    label: Text(''),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 255, 255),
                      visualDensity: VisualDensity.compact
                    ),
                  ),

                  //youtube
                  ElevatedButton.icon(
                    onPressed: () async{
                      String url = 'https://youtube.com/@bawaslukotasurabaya1203';
                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: true, forceWebView: true, enableJavaScript: true);
                      }else{
                        print('The action is not supported');
                      }
                    },
                    icon: Image.asset(
                      'images/youtube.png',
                      height: 30,
                      width: 30,),
                    label: Text(''),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 255, 255),
                      visualDensity: VisualDensity.compact
                    ),
                  ),

                ],
              ),

            ],
          )
        ],
      ),
           
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: const 
        Text(
          'Tentang Kami',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
              letterSpacing: 0.53),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),

        iconTheme: IconThemeData(
          color: Colors.black,),// Ubah warna ikon menu menjadi hitam
        
        bottom: PreferredSize(
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 20, bottom: 5),
              //image logo bawaslu
              child: Center(
              child: Image.asset('images/LOGOBAWASLU.png'),
              ),
              height: 90,
              width: 300,
            ),
            preferredSize: const Size.fromHeight(110)),
       
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        child: ListView(
        children: [
          
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255), // Warna latar belakang DrawerHeader
            ),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white, // Ubah warna latar belakang menjadi putih
              ),
              accountName: SizedBox.shrink(), // Menghapus accountName
              accountEmail: SizedBox.shrink(), // Menghapus accountEmail
              currentAccountPicture: Stack(
                alignment: Alignment.bottomLeft, // Atur letak gambar di sini
                children: [
                  CircleAvatar(
                        radius: 300,
                        backgroundImage: AssetImage('images/robot.jpg'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 800),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ],
              ),
            ),
          ),

            ListTile(
              leading:
              Icon(Icons.person, color: Color.fromARGB(255, 0, 0, 0),), 
              title: Text(
                "Tentang Saya",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0)
                ),), 
              onTap: () {
               Navigator.push(context, 
               MaterialPageRoute(builder: (context) => MyProfile(),
               )
               ); 
              },
            ),
            ListTile(
              leading:
              Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0),), 
              title: 
              Text(
                "Beranda",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0)
                ),), 
              onTap: () {
               Navigator.push(context, 
               MaterialPageRoute(builder: (context) => home(),
               )
               ); 
              },
            ),
          
          
        ],
      )
      ),
      
    );
  }
}
