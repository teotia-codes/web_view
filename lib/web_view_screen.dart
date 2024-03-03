

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;
  late var url;
  var intialUrl = "https://www.google.com/";
  double progress =0;
  var urlController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar:AppBar(
      leading: IconButton(onPressed: () async{
            if(await webViewController!.canGoBack()){
              webViewController!.goBack();
            }
      },
       icon: Icon(Icons.keyboard_backspace_rounded,
       size: 26,)),
       
    title: Container(
      height:50,
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: urlController,
       autofocus: true,
       textAlign: TextAlign.center,
        decoration: InputDecoration(
        prefixIcon:Icon(Icons.search),
        label: Text("Search"),
        border: InputBorder.none ),
        
      ),
    ),
    actions: [
      IconButton(onPressed: (){
        webViewController!.reload();
      }, icon:Icon(Icons.refresh) ),
    ],
    ) ,
    body: Column(
      children: [
        Expanded(child: InAppWebView(
          onWebViewCreated: (controller) => webViewController = controller,
          initialUrlRequest: URLRequest(url:WebUri(intialUrl)),
        ))

      ],
    ),
   );
  }
}