import 'package:flutter/material.dart';

class DetailCardWidget extends StatelessWidget {
  String imageUrl;
  String title;
  String description;

   DetailCardWidget({super.key,
  required this.title,
  required this.imageUrl,
  required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ListView(children: [
        Stack(children:[
          Image.network(imageUrl),
          Positioned(
            top: 100,
              right: 0,
              child: FloatingActionButton
                (onPressed: () {},
                  child: const Icon(Icons.favorite_border),
              backgroundColor: Colors.black,))]),
        const SizedBox(
          height: 8,
        ),
         Text(
          title,
          style:const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(description),
        // const Text("publisher")
        SizedBox(height: 8,),
      ]),
    );
  }
}
