import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrResult = 'Scanned data will appear here';

  Future<void> scanQr()async{
try{

  final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'cancel', true, ScanMode.QR);
  if(!mounted)return;
  setState(() {
    this.qrResult = qrCode.toString();
  });

}on PlatformException{
  qrResult = "failed ro read Qr";
}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qr Code Scanner"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  qrResult,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Text('$qrResult',style: const TextStyle(color: Colors.black),),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              scanQr();
            }, child: const Text("Scan Code"))
          ],
        ),
      ),
    );
  }
}
