// import 'package:flutter_api_bawaslu/bookmark.dart';
// import 'package:flutter_api_bawaslu/last_read.dart';
// import 'package:flutter_api_bawaslu/models/post.dart';
// import 'package:flutter_api_bawaslu/services/remote_services_pemilihan_keputusan.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihanKeputusan.dart';
// import 'package:get/get.dart';
// import 'package:sqflite_common/sqlite_api.dart';
// // import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:url_launcher/url_launcher.dart';
// // import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

// import 'dart:async';
// import 'dart:io' show Platform;

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_api_bawaslu/splashscreen.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart';

// class Viewer extends StatefulWidget {
//   @override
//   final String url;

//   Viewer({required this.url});
//   _ViewerState createState() => _ViewerState();
// }

// class _ViewerState extends State<Viewer> {
//   String _version = 'Unknown';
//   String _document = '';
//   // String _document =
//   //     // "https://firebasestorage.googleapis.com/v0/b/tugas-akhir-64d2e.appspot.com/o/BA_Progress_Nabillatul%20Wafiroh_1462000104.pdf?alt=media&token=192f7c1d-216e-4e8d-ba0f-b737269211b7";
//   //                                       'http://192.168.1.29:8000/storage/public/data-file/0hImf7dbam7QIS2QcE6pmny04pfaFy55wLFZngT5.pdf',

//   // "http://192.168.1.29:8000/storage/public/data-file/0hImf7dbam7QIS2QcE6pmny04pfaFy55wLFZngT5.pdf";
//   bool _showViewer = true;

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//     // String _document = widget.url;
//     _document = widget.url;

//     showViewer();

//     // If you are using local files:
//     // * Remove the above line `showViewer();`.
//     // * Change the _document field to your local filepath.
//     // * Uncomment the section below, including launchWithPermission().
//     // if (Platform.isIOS) {
//     // showViewer(); // Permission not required for iOS.
//     // } else {
//     // launchWithPermission(); // Permission required for Android.
//     // }
//   }

//   // Uncomment this if you are using local files:
//   // Future<void> launchWithPermission() async {
//   //  PermissionStatus permission = await Permission.storage.request();
//   //  if (permission.isGranted) {
//   //    showViewer();
//   //  }
//   // }

//   // Platform messages are asynchronous, so initialize in an async method.
//   Future<void> initPlatformState() async {
//     String version;
//     // Platform messages may fail, so use a try/catch PlatformException.
//     try {
//       // Initializes the Apryse SDK, it must be called before you can use
//       // any functionality.
//       PdftronFlutter.initialize("your_pdftron_license_key");

//       version = await PdftronFlutter.version;
//     } on PlatformException {
//       version = 'Failed to get platform version.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _version = version;
//     });
//   }

//   void showViewer() async {
//     // Opening without a config file will have all functionality enabled.
//     // await PdftronFlutter.openDocument(_document);

//     var config = Config();
//     // How to disable functionality:
//     //      config.disabledElements = [Buttons.shareButton, Buttons.searchButton];
//     //      config.disabledTools = [Tools.annotationCreateLine, Tools.annotationCreateRectangle];
//     // Other viewer configurations:
//     //      config.multiTabEnabled = true;
//     //      config.customHeaders = {'headerName': 'headerValue'};

//     // An event listener for document loading.
//     var documentLoadedCancel = startDocumentLoadedListener((filePath) {
//       print("document loaded: $filePath");
//     });

//     await PdftronFlutter.openDocument(_document, config: config);

//     try {
//       // The imported command is in XFDF format and tells whether to add,
//       // modify or delete annotations in the current document.
//       PdftronFlutter.importAnnotationCommand(
//           "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
//               "    <xfdf xmlns=\"http://ns.adobe.com/xfdf/\" xml:space=\"preserve\">\n" +
//               "      <add>\n" +
//               "        <square style=\"solid\" width=\"5\" color=\"#E44234\" opacity=\"1\" creationdate=\"D:20200619203211Z\" flags=\"print\" date=\"D:20200619203211Z\" name=\"c684da06-12d2-4ccd-9361-0a1bf2e089e3\" page=\"1\" rect=\"113.312,277.056,235.43,350.173\" title=\"\" />\n" +
//               "      </add>\n" +
//               "      <modify />\n" +
//               "      <delete />\n" +
//               "      <pdf-info import-version=\"3\" version=\"2\" xmlns=\"http://www.pdftron.com/pdfinfo\" />\n" +
//               "    </xfdf>");
//     } on PlatformException catch (e) {
//       print("Failed to importAnnotationCommand '${e.message}'.");
//     }

//     try {
//       PdftronFlutter.importBookmarkJson('{"0":"Page 1"}');
//     } on PlatformException catch (e) {
//       print("Failed to importBookmarkJson '${e.message}'.");
//     }

//     // An event listener for when local annotation changes are committed to the document.
//     // xfdfCommand is the XFDF Command of the annotation that was last changed.
//     var annotCancel = startExportAnnotationCommandListener((xfdfCommand) {
//       String command = xfdfCommand;
//       print("flutter xfdfCommand:\n");
//       // Dart limits how many characters are printed onto the console.
//       // The code below ensures that all of the XFDF command is printed.
//       if (command.length > 1024) {
//         int start = 0;
//         int end = 1023;
//         while (end < command.length) {
//           print(command.substring(start, end) + "\n");
//           start += 1024;
//           end += 1024;
//         }
//         print(command.substring(start));
//       } else {
//         print("flutter xfdfCommand:\n $command");
//       }
//     });

//     // An event listener for when local bookmark changes are committed to
//     // the document. bookmarkJson is the JSON string containing all the
//     // bookmarks that exist when the change was made.
//     var bookmarkCancel = startExportBookmarkListener((bookmarkJson) {
//       print("flutter bookmark: $bookmarkJson");
//     });

//     var path = await PdftronFlutter.saveDocument();
//     print("flutter save: $path");

//     // To cancel event:
//     // annotCancel();
//     // bookmarkCancel();
//     // documentLoadedCancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child:
//             // Uncomment this to use Widget version of the viewer:
//             // _showViewer
//             // ? DocumentView(
//             //     onCreated: _onDocumentViewCreated,
//             //   ):
//             Container(),
//       ),
//     );
//   }

//   // This function is used to control the DocumentView widget after it
//   // has been created. The widget will not work without a void
//   // Function(DocumentViewController controller) being passed to it.
//   void _onDocumentViewCreated(DocumentViewController controller) async {
//     Config config = new Config();

//     var leadingNavCancel = startLeadingNavButtonPressedListener(() {
//       // Uncomment this to quit viewer when leading navigation button is pressed:
//       // this.setState(() {
//       //   _showViewer = !_showViewer;
//       // });

//       // Show a dialog when leading navigation button is pressed.
//       _showMyDialog();
//     });

//     controller.openDocument(_document, config: config);
//   }

//   Future<void> _showMyDialog() async {
//     print('hello');
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // User must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('AlertDialog'),
//           content: SingleChildScrollView(
//             child: Text('Leading navigation button has been pressed.'),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// new modified by nabilla & indra
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart';

// class Viewer extends StatefulWidget {
//   final String url;
//   final String searchTerm;

//   Viewer({required this.url, required this.searchTerm});

//   _ViewerState createState() => _ViewerState();
// }

// class _ViewerState extends State<Viewer> {
//   String _version = 'Unknown';
//   String _document = '';
//   bool _showViewer = true;

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//     _document = widget.url;

//     showViewer();
//   }

//   Future<void> initPlatformState() async {
//     String version;
//     try {
//       PdftronFlutter.initialize("your_pdftron_license_key");
//       version = await PdftronFlutter.version;
//     } on PlatformException {
//       version = 'Failed to get platform version.';
//     }

//     if (!mounted) return;

//     setState(() {
//       _version = version;
//     });
//   }

//   void showViewer() async {
//     var config = Config();

//     var documentLoadedCancel = startDocumentLoadedListener((filePath) {
//       print("document loaded: $filePath");
//       // print('woi');
//       print(widget.searchTerm);
//       highlightSearchTerm(widget.searchTerm);
//     });

//     await PdftronFlutter.openDocument(_document, config: config);
//     PdftronFlutter.openSearch();
//     PdftronFlutter.startSearchMode(widget.searchTerm, false, false);
//   }

//   void highlightSearchTerm(String searchTerm) async {
//     try {
//       // Example of using `importAnnotationCommand` for highlighting text
//       String command = '''
//     <?xml version="1.0" encoding="UTF-8"?>
//     <xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">
//       <add>
//         <highlight page="1" rects="100,100,200,200" />
//       </add>
//       <search term="$searchTerm" />
//     </xfdf>
//     ''';

//       await PdftronFlutter.importAnnotationCommand(command);
//       print("Search and highlight term: $searchTerm");
//     } on PlatformException catch (e) {
//       print("Failed to search and highlight text: '${e.message}'.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Container(),
//       ),
//     );
//   }
// }

// modified by bens
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart';

// class Viewer extends StatefulWidget {
//   final String url;
//   final String searchTerm;

//   Viewer({required this.url, required this.searchTerm});

//   _ViewerState createState() => _ViewerState();
// }

// class _ViewerState extends State<Viewer> {
//   String _version = 'Unknown';
//   String _document = '';
//   bool _showViewer = true;

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//     _document = widget.url;

//     showViewer();
//   }

//   Future<void> initPlatformState() async {
//     String version;
//     try {
//       PdftronFlutter.initialize("your_pdftron_license_key");
//       version = await PdftronFlutter.version;
//     } on PlatformException {
//       version = 'Failed to get platform version.';
//     }

//     if (!mounted) return;

//     setState(() {
//       _version = version;
//     });
//   }

//   void showViewer() async {
//     var config = Config();

//     var documentLoadedCancel = startDocumentLoadedListener((filePath) {
//       print("document loaded: $filePath");
//       print(widget.searchTerm);
//       highlightSearchTerm(widget.searchTerm);
//     });

//     await PdftronFlutter.openDocument(_document, config: config);
//     PdftronFlutter.openSearch();
//     PdftronFlutter.startSearchMode(widget.searchTerm, false, false);
//   }

//   void highlightSearchTerm(String searchTerm) async {
//     try {
//       // Contoh penggunaan `importAnnotationCommand` untuk menyorot teks
//       String command = '''
//       <?xml version="1.0" encoding="UTF-8"?>
//       <xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">
//         <add>
//           <highlight page="1" rects="100,100,200,200" />
//         </add>
//         <search term="$searchTerm" />
//       </xfdf>
//     ''';

//       await PdftronFlutter.importAnnotationCommand(command);
//       print("Search and highlight term: $searchTerm");
//     } on PlatformException catch (e) {
//       print("Failed to search and highlight text: '${e.message}'.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Container(),
//       ),
//     );
//   }
// }

// baru banget dari gua bens
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart';

// class Viewer extends StatefulWidget {
//   final String url;
//   final String searchTerm;

//   Viewer({required this.url, required this.searchTerm});

//   _ViewerState createState() => _ViewerState();
// }

// class _ViewerState extends State<Viewer> {
//   String _version = 'Unknown';
//   String _document = '';
//   bool _showViewer = true;

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//     _document = widget.url;

//     showViewer();
//   }

//   Future<void> initPlatformState() async {
//     String version;
//     try {
//       PdftronFlutter.initialize("your_pdftron_license_key");
//       version = await PdftronFlutter.version;
//     } on PlatformException {
//       version = 'Failed to get platform version.';
//     }

//     if (!mounted) return;

//     setState(() {
//       _version = version;
//     });
//   }

//   void showViewer() async {
//     var config = Config();

//     startDocumentLoadedListener((filePath) {
//       print("document loaded: $filePath");
//       searchAndNavigateToTerm(widget.searchTerm);
//     });

//     await PdftronFlutter.openDocument(_document, config: config);
//   }

//   void searchAndNavigateToTerm(String searchTerm) async {
//     try {
//       // Masukkan logika untuk mencari dan menyoroti kata
//       await PdftronFlutter.openSearch();
//       await PdftronFlutter.startSearchMode(searchTerm, false, false);
//       print("Search and highlight term: $searchTerm");
//     } on PlatformException catch (e) {
//       print("Failed to search and highlight text: '${e.message}'.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Container(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

class Viewer extends StatefulWidget {
  final String url;
  final String searchTerm;
  final int page;

  Viewer({required this.url, required this.searchTerm, required this.page});

  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  String _version = 'Unknown';
  String _document = '';
  bool _showViewer = true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _document = widget.url;

    showViewer();
  }

  Future<void> initPlatformState() async {
    String version;
    try {
      PdftronFlutter.initialize("your_pdftron_license_key");
      version = await PdftronFlutter.version;
    } on PlatformException {
      version = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _version = version;
    });
  }

  void showViewer() async {
    var config = Config();

    startDocumentLoadedListener((filePath) {
      print("document loaded: $filePath");
      searchAndNavigateToTerm(widget.searchTerm);
    });

    await PdftronFlutter.openDocument(_document, config: config);
  }

  void searchAndNavigateToTerm(String searchTerm) async {
    try {
      // Menggunakan fitur PDFTron untuk mencari dan menyoroti teks
      await PdftronFlutter.openSearch();
      await PdftronFlutter.startSearchMode(searchTerm, false, false);
      print("Search and highlight term: $searchTerm");

      // Mengarahkan langsung ke halaman yang relevan
      PdftronFlutter.setCurrentPage(widget.page);
      print("Navigated to page: ${widget.page}");
    } on PlatformException catch (e) {
      print("Failed to search and highlight text: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(),
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart';

// class Viewer extends StatefulWidget {
//   final String url;
//   final String searchTerm;

//   Viewer({required this.url, required this.searchTerm});

//   _ViewerState createState() => _ViewerState();
// }

// class _ViewerState extends State<Viewer> {
//   String _version = 'Unknown';
//   String _document = '';
//   bool _showViewer = true;

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//     _document = widget.url;

//     showViewer();
//   }

//   Future<void> initPlatformState() async {
//     String version;
//     try {
//       PdftronFlutter.initialize("your_pdftron_license_key");
//       version = await PdftronFlutter.version;
//     } on PlatformException {
//       version = 'Failed to get platform version.';
//     }

//     if (!mounted) return;

//     setState(() {
//       _version = version;
//     });
//   }

//   void showViewer() async {
//     var config = Config();

//     var documentLoadedCancel = startDocumentLoadedListener((filePath) {
//       print("document loaded: $filePath");
//       print(widget.searchTerm);
//       highlightSearchTerm(widget.searchTerm);
//     });

//     await PdftronFlutter.openDocument(_document, config: config);
//     PdftronFlutter.openSearch();
//     PdftronFlutter.startSearchMode(widget.searchTerm, false, false);
//   }

//   void highlightSearchTerm(String searchTerm) async {
//     try {
//       // Contoh penggunaan `importAnnotationCommand` untuk menyorot teks
//       String command = '''
//       <?xml version="1.0" encoding="UTF-8"?>
//       <xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">
//         <add>
//           <highlight page="1" rects="100,100,200,200" />
//         </add>
//         <search term="$searchTerm" />
//       </xfdf>
//     ''';

//       await PdftronFlutter.importAnnotationCommand(command);
//       print("Search and highlight term: $searchTerm");
//     } on PlatformException catch (e) {
//       print("Failed to search and highlight text: '${e.message}'.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Container(),
//       ),
//     );
//   }
// }






























// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart';

// class Viewer extends StatefulWidget {
//   final String url;
//   final String searchTerm;

//   Viewer({required this.url, required this.searchTerm});

//   _ViewerState createState() => _ViewerState();
// }

// class _ViewerState extends State<Viewer> {
//   String _version = 'Unknown';
//   String _document = '';
//   bool _showViewer = true;

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//     _document = widget.url;
//     showViewer();
//   }

//   Future<void> initPlatformState() async {
//     String version;
//     try {
//       PdftronFlutter.initialize("your_pdftron_license_key");
//       version = await PdftronFlutter.version;
//     } on PlatformException {
//       version = 'Failed to get platform version.';
//     }

//     if (!mounted) return;

//     setState(() {
//       _version = version;
//     });
//   }

//   void showViewer() async {
//     var config = Config();
//     var documentLoadedCancel = startDocumentLoadedListener((filePath) {
//       print("document loaded: $filePath");
//       highlightSearchTerm(widget.searchTerm);
//     });

//     await PdftronFlutter.openDocument(_document, config: config);
//   }

//   void highlightSearchTerm(String searchTerm) async {
//     try {
//       String command = '''
//     <?xml version="1.0" encoding="UTF-8"?>
//     <xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">
//       <add>
//         <highlight page="1" rects="100,100,200,200" />
//       </add>
//       <search term="$searchTerm" />
//     </xfdf>
//     ''';

//       await PdftronFlutter.importAnnotationCommand(command);
//       print("Search and highlight term: $searchTerm");
//     } on PlatformException catch (e) {
//       print("Failed to search and highlight text: '${e.message}'.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Container(),
//       ),
//     );
//   }
// }
