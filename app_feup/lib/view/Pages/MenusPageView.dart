import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_pdf_viewer/simple_pdf_viewer.dart';
import '../Pages/GeneralPageView.dart';

class MenusPageView extends GeneralPageView {

  Future<String> prepareTestPdf(BuildContext context, String path) async {
    final ByteData bytes =
        await DefaultAssetBundle.of(context).load(path);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$path';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

  @override
  Widget getBody(BuildContext context) {
    return Container(
      child: SimplePdfViewerWidget(
        initialUrl: 'https://sigarra.up.pt/sasup/pt/web_gessi_docs.download_file?p_name=F1570765615/Ementas_CantDireito_Atualiz13.09.19.pdf',
      ),
    );
  }
}