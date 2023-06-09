import 'package:flutter_api_bawaslu/models/post.dart';
import 'package:flutter_api_bawaslu/services/remote_services_pemilu_uud.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF From Url'),
        centerTitle: true,
        backgroundColor: Color(0xFFbc9d61), // warna AppBar
      ),
      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}


class PdfViewPemiluUUD extends StatefulWidget {
  const PdfViewPemiluUUD({Key? key}) : super(key: key);

  @override
  _PdfViewState createState() => _PdfViewState();
}

class PDFView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   // child: SfPdfViewer.network(
    //   //     "http://10.210.77.170:8000/storage/data-file/c58wW0QirNGs5WVPns9ZLqqfpPgzMZ8c8kyyQaZM.pdf"),
    //       child: SfPdfViewer.network(
    //       "https://repository.bsi.ac.id/index.php/unduh/item/242521/cover-dan-isi-lengkap-web-pro.pdf"),
    //   // child: Text("awjeokawoeaweko")
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              // _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body:SfPdfViewer.network("http://172.20.10.6:8000/storage/public/data-file/0hImf7dbam7QIS2QcE6pmny04pfaFy55wLFZngT5.pdf")
    );

  }
}

class _PdfViewState extends State<PdfViewPemiluUUD> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteServicePemiluUUD().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts PDF'),
        centerTitle: true,
        backgroundColor: Color(0xFFbc9d61), // warna AppBar
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                    child: Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts![index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //   //   var url =
                  //   //       'http://10.210.77.170:8000/storage/data-file/c58wW0QirNGs5WVPns9ZLqqfpPgzMZ8c8kyyQaZM.pdf';
                  //   //  FlutterWebviewPlugin().launch(url);
                  //     Navigator.push(context, 
                  //       MaterialPageRoute(builder: (context) => const PDFViewerFromUrl(
                  //     url: 'http://192.168.1.8:8000/storage/data-file/c58wW0QirNGs5WVPns9ZLqqfpPgzMZ8c8kyyQaZM.pdf'
                  //   )),
                  //     );
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //       primary: Color(0xFFbc9d61), // Ubah warna latar belakang tombol
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Icon(
                  //           Icons.picture_as_pdf, // Tambahkan ikon PDF
                  //           color: Colors.white,
                  //         ),
                  //         SizedBox(width: 8), // Tambahkan jarak antara ikon dan teks
                  //         Text(
                  //           'Buka PDF',
                  //           style: TextStyle(color: Colors.white),
                  //         ),
                  //       ],
                  //     ),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                        //   var url =
                        //       'http://10.210.77.170:8000/storage/data-file/c58wW0QirNGs5WVPns9ZLqqfpPgzMZ8c8kyyQaZM.pdf';
                        //  FlutterWebviewPlugin().launch(url);
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => PDFViewerFromUrl(
                      url: 'http://172.20.10.6:8000/storage/${posts![index].data_file}'
                    )),
                      );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFbc9d61), // Ubah warna latar belakang tombol
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   Icons.picture_as_pdf, // Tambahkan ikon PDF
                          //   color: Colors.white,
                          // ),
                          SizedBox(width: 6), // Tambahkan jarak antara ikon dan teks
                          Text(
                            'Buka PDF',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
