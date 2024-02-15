import 'package:ai_generate_image/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var size = ["Small","Medium","Large"];
  var values = ["256x256","512x512","1024x1024"];
  String? dropValue;
  TextEditingController createImage = TextEditingController();
  String image = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("AI Image Generate"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: createImage,
                          decoration: InputDecoration(
                            hintText: "Search Image",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: dropValue,
                            hint: Text("Select Size"),
                            icon: Icon(Icons.arrow_drop_down),
                            items: List.generate(
                              size.length,
                                  (index) => DropdownMenuItem(
                                value: values[index],
                                child: Text(size[index]),
                              ),
                            ),
                            onChanged: (value){
                              dropValue = value;
                              setState(() {

                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Consumer<GenerateImageController>(
                    builder: (context,value,child){
                      return InkWell(
                        onTap: ()async{
                          await value.generateImage();

                          // if(createImage.text.isNotEmpty && dropValue!.isNotEmpty){
                          // }else{
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(
                          //     SnackBar(
                          //       content: Text("Please Pass the query and size"),
                          //     ),
                          //   );
                          // }
                        },
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: value.isLoading ?
                          Center(child: CircularProgressIndicator(color: Colors.white,))
                              :
                          Center(
                            child: Text(
                              "Generate",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
