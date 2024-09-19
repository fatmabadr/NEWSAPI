import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Article.dart';

class details extends StatelessWidget {
  Article artical;

   details({super.key,required this.artical});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(artical.title!),),

        body: SafeArea(child:Column(
          children: [
            SizedBox(height: 50,),
            Text(artical.title!),
            SizedBox(height: 50,),
            if(artical.urlToImage!=null)
            Image.network(artical.urlToImage!),
           Text("read the original article" ),
            InkWell(
              onTap: _launchURL,
              child: Text(artical.url!,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

          ],
        ),
    ));


  }
  _launchURL() async {
    Uri _url = Uri.parse(artical.url!);
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }
}
