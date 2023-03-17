import 'package:flutter/material.dart';

class LLImageDetailPage extends StatelessWidget {
  final String _imageURL;

  LLImageDetailPage(this._imageURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Hero(tag: _imageURL,child: Image.network(_imageURL)),
        ),
      ),
    );
  }
}