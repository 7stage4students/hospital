import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seven_health/components/app_bar.dart';
import 'package:seven_health/components/qr_scanner_overlay_shape.dart';
import 'package:seven_health/style/style.dart';

class ScanCodeScreen extends StatefulWidget {
  @override
  _ScanCodeScreenState createState() => _ScanCodeScreenState();
}

class _ScanCodeScreenState extends State<ScanCodeScreen> {
  bool cameraOn = true;

  QrScannerOverlayShape qrScannerOverlayShape = QrScannerOverlayShape();

  @override
  void initState() {
    super.initState();
    setState(() {
      cameraOn = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    cameraOn = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Scan code'),
      backgroundColor: greyBackground,
      body: cameraOn
          ? Center(
              child: QRBarScannerCamera(
              onError: (context, error) => Center(
                child: Container(
                  width: screenWidth(context) / 1.2,
                  child: Text(
                    error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              qrCodeCallback: (code) {
                //manage Information from QR code
                manageQRCode(code);
              },
              notStartedBuilder: (context) {
                return Scaffold(
                                  body: Center(
                    child: Text(
                      "Loading Scanner Camera...",
                      style: textSyle(),
                    ),
                  ),
                );
              },
              offscreenBuilder: (context) {
                return Scaffold(
                                  body: Center(
                    child: Text(
                      'Scanner Camera Paused.',
                      style: textSyle(),
                    ),
                  ),
                );
              },
              child: Container(
                decoration: ShapeDecoration(
                  shape: QrScannerOverlayShape(
                    borderColor: tertiary,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SpinKitRipple(
                        color: tertiary,
                        size: 50.0,
                      ),
                      Text("Scanning", style: scanStyle()),
                    ],
                  ),
                ),
              ),
            ),
            )
          : Center(),
    );
  }

  QRBarScannerCamera buildQrBarScannerCamera() {
    return QRBarScannerCamera(
              onError: (context, error) => Center(
                child: Container(
                  width: screenWidth(context) / 1.2,
                  child: Text(
                    error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              qrCodeCallback: (code) {
                //manage Information from QR code
                manageQRCode(code);
              },
              notStartedBuilder: (context) {
                return Center(
                  child: Text(
                    "Loading Scanner Camera...",
                    style: textSyle(),
                  ),
                );
              },
              offscreenBuilder: (context) {
                return Center(
                  child: Text(
                    'Scanner Camera Paused.',
                    style: textSyle(),
                  ),
                );
              },
              child: Container(
                decoration: ShapeDecoration(
                  shape: QrScannerOverlayShape(
                    borderColor: tertiary,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SpinKitRipple(
                        color: tertiary,
                        size: 50.0,
                      ),
                      Text("Scanning", style: scanStyle()),
                    ],
                  ),
                ),
              ),
            );
  }

  manageQRCode(String code) {
    setState(() {
      cameraOn = false;
    });
    print(code);
    

    // String studentCode;

    /// go to check code
    Navigator.of(context)
        .pushNamed("/checkCode", arguments: code)
        .then((value) => setState(() {
              cameraOn = true;
            }));
  }
}
