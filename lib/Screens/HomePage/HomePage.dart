import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Models/booksmodel/booksmodel.dart';
import 'package:project/Screens/HomePage/widgets/Book_card_widget.dart';
import 'package:project/controller/ApiController.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Books"),
      ),
      body: FutureBuilder(
          future: controller.fetchData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final model = snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                  itemCount:8,
                  //model.items!.length,
                  itemBuilder: (BuildContext context, int index) {
                  print(model.items![index].volumeInfo!.categories!.toString());
                    return BookCardWidget(
                      data: model.items![index],
                      title: model.items![index].volumeInfo!.title!,
                      category: model.items![index].volumeInfo!.categories![0],
                      author: model.items![index].volumeInfo!.authors![0],
                      imageUrl: model.items![index].volumeInfo!.imageLinks!.smallThumbnail!,
                      publisher: model.items![index].volumeInfo!.publisher!,
                    );
                  });
            }
          }),
    );
  }
}
