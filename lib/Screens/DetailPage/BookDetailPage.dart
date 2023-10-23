import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Screens/DetailPage/widgets/detail_card.dart';

class BookDetailPage extends StatelessWidget {
  final dynamic data;
  const BookDetailPage({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Details"),
        ),
        body: DetailCardWidget(
          title:data.volumeInfo.title,
          imageUrl: data.volumeInfo.imageLinks.thumbnail,
          description:data.volumeInfo.description,
        ));
  }
}
