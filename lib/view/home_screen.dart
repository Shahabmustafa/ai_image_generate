import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var size = ["Small","Medium","Large"];
  String? dropValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("AI Image Generate"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Image",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: dropValue,
                  hint: Text("Select Size"),
                  items: List.generate(
                      size.length,
                        (index) => DropdownMenuItem(
                          child: Text(size[index]),
                        ),
                  ),
                  onChanged: (value){},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
