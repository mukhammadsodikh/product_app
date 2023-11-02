import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
   const AddScreen({super.key});
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _xFile;
  void _saveProductToFirebase() async{

  }
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Product"),
        actions: [
          IconButton(onPressed: _saveProductToFirebase, icon: const Icon(Icons.check_box_sharp))
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _picker.pickImage(source: ImageSource.gallery);
                  setState(() {

                  });
                },
                child: _xFile != null ? CircleAvatar(
                  foregroundImage: FileImage(File(_xFile?.path ?? "")),
                  radius: 70,
                ) : const Icon(Icons.image)

              ),
              const Align(alignment: Alignment.center,child: Text("Product Name"),),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.sports_bar)
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.number,
                controller: _priceController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                    hintText: 'Price',

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
