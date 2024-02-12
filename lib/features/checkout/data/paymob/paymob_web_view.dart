import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PaymobCheckoutView extends StatefulWidget {
  final Function onSuccess, onError;
  final Function? onCancel;
  final String url;

  const PaymobCheckoutView({
    Key? key,
    required this.onSuccess,
    required this.onError,
    this.onCancel,
    required this.url,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PaypalCheckoutViewState();
  }
}

class _PaypalCheckoutViewState extends State<PaymobCheckoutView> {
  double progress = 0;

  late InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Paymob Payment"),
      ),
      body: Stack(
        children: <Widget>[
          InAppWebView(
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              return NavigationActionPolicy.ALLOW;
            },
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                useShouldOverrideUrlLoading: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onCloseWindow: (InAppWebViewController controller) {
              if (widget.onCancel != null) {
                widget.onCancel!();
              } else {
                Navigator.of(context).pop();
              }
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
          ),
          progress < 1
              ? SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(value: progress),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
