import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../DetailPage/BookDetailPage.dart';

class BookCardWidget extends StatelessWidget {
  final String imageUrl;
  final String author;
  final String category;
  final String title;
  final String publisher;
  final dynamic data;
  const BookCardWidget({super.key,
  required this.author,
  required this.category,
  required this.imageUrl,
  required this.publisher,
  required this.title,
  required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BookDetailPage(
          data:data
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          elevation: 5,
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: Image.network(imageUrl),
            title: Text(title),
            subtitle:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Author: $author "),
                Text("Category: $category"),
                Text("Publisher: $publisher"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
