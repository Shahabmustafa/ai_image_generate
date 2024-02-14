import 'dart:convert';
import 'package:ai_generate_image/api/api_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GenerateImageController extends ChangeNotifier{

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool value){
    _isLoading = value;
  }

  generateImage(String text,String size)async{
    setLoading(true);
    try{
      var response = await http.post(
        Uri.parse(ApiKey.openAiLinks),
        headers: ApiKey.headers,
        body: jsonEncode({
          "prompt" : text,
          "n" : 1,
          "size" : size,
        }),
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data);
      }else{
        print("Failed to fetch Image");
      }
      setLoading(false);
    }catch(e){
      setLoading(false);
    }
  }
}