import 'dart:convert';

import 'package:get/get.dart';
import 'package:project/Models/booksmodel/booksmodel.dart';
import 'package:http/http.dart' as http;
class ApiController extends GetxController{
  var bookModel=<BookModel>[].obs;

  Future fetchData()async{
    final response=await http.get(Uri.parse("https://www.googleapis.com/books/v1/volumes?q=flutter"));

    if(response.statusCode==200){
      final Map<String,dynamic> responseData =await json.decode(response.body);
      return BookModel.fromJson(responseData);
    }
    else{
      throw Exception("Load to filed");
    }
  }

  @override
  void onInit()async{
    // TODO: implement onInit
    super.onInit();
   // await fetchData();
  }
}