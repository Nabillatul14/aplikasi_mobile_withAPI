// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher_windows/url_launcher_windows.dart';


class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final String body =
        '''Saya Nabillatul Wafiroh. Saya sekarang sedang menempuh pendidikan S1 Program Studi Teknik Informatika di Universitas 17 Agustus 1945 Surabaya.Di Program Studi Teknik Informatika sendiri saya telah beberapa kali mengerjakan project IT, baik itu project internal (kampus) maupun project eksternal seperti aplikasi BAWASLU ini. 
        ''';
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color(0xFFbc9d61),
        centerTitle: true,
        title: const Text(
          'Tentang Saya',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.53),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          iconSize: 25,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 20, bottom: 10),
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/2.jpeg'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nabillatul Wafiroh',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.50),
                            ),
                            Container(
                              color: Colors.white,
                              height: 3,
                              width: 200,
                            ),
                            Text(
                              'Universitas 17 Agustus 1945 Surabaya',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  letterSpacing: 0.53),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(110)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
          // SizedBox(
          //   height: 10,
          // ),

          Column(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: [

            //instagram
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
                        backgroundImage: AssetImage('images/instagram.png'),
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.center,
                    child: Text(
                        ''' @nabilla.tw''',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10, fontFamily: 'Poppins',color: Color.fromARGB(255, 0, 0, 0)),
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
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    alignment: Alignment.center,
                    child: Text(
                        ''' nabillaatw@gmail.com''',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10, fontFamily: 'Poppins',color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),  
                  ],
                ),
              ),

          ],
          )
        ],
      ),
    );
  }
}
