import 'dart:convert';
import 'package:ai_generate_image/api/api_key.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GenerateImageController extends ChangeNotifier{

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool value){
    _isLoading = value;
  }


  generateImage()async{
    setLoading(true);
    try{
      var response = await http.post(
        Uri.parse(ApiKey.openAiLinks),
        headers: ApiKey.headers,
        body: jsonEncode({
          "prompt" : "car parking",
          "n" : 1,
          "size" : "512x512",
        }),
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        setLoading(false);
        return data["data"][0]["url"].toString();
      }else if(response.statusCode == 505){
        print("Bad gateway");
      }else{
        print("Failed to fetch Image");
        print(response.statusCode);
        print(response.request);
        print(response.body);
        setLoading(false);
      }
      setLoading(false);
    }catch(e){
      print(e);
      setLoading(false);
    }
  }
}