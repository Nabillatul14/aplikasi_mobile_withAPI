import 'package:flutter_api_bawaslu/bookmark.dart';
import 'package:flutter_api_bawaslu/models/post.dart';
import 'package:flutter_api_bawaslu/services/remote_services_pemilihan_keputusan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilihanKeputusan.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFViewerFromUrl extends StatelessWidget {
  final String url;
  PDFViewerFromUrl({Key? key, required this.url}) : super(key: key);
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF From URL',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        centerTitle: true,
        backgroundColor: Color(0xFFbc9d61),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("SIMPAN"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("TERAKHIR DIBACA"),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFbc9d61),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("BOOKMARK"),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFbc9d61),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          // Icon atau widget lainnya untuk ditambahkan di sebelah kanan
        ],
      ),
      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}

class PdfViewPemilihanKeputusan extends StatefulWidget {
  const PdfViewPemilihanKeputusan({Key? key}) : super(key: key);

  @override
  _PdfViewState createState() => _PdfViewState();
}

class PDFView extends StatelessWidget {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.network(
        "http://172.20.10.6:8000/storage/public/data-file/0hImf7dbam7QIS2QcE6pmny04pfaFy55wLFZngT5.pdf",
        controller: _pdfViewerController,
        key: _pdfViewerStateKey,
      ),
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
      ),
    );
  }
}

class _PdfViewState extends State<PdfViewPemilihanKeputusan> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteServicePemilihanKeputusan().getPosts();
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
        title: const Text('Posts PDF',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
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
                  ElevatedButton(
                    onPressed: () {
                      //   var url =
                      //       'http://10.210.77.170:8000/storage/data-file/c58wW0QirNGs5WVPns9ZLqqfpPgzMZ8c8kyyQaZM.pdf';
                      //  FlutterWebviewPlugin().launch(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PDFViewerFromUrl(
                                url:
                                    'http://172.20.10.6:8000/storage/${posts![index].data_file}')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Color(0xFFbc9d61), // Ubah warna latar belakang tombol
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.picture_as_pdf, // Tambahkan ikon PDF
                        //   color: Colors.white,
                        // ),
                        SizedBox(
                            width: 8), // Tambahkan jarak antara ikon dan teks
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
