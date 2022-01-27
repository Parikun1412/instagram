import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/model/user.dart';
import 'package:instagram/provider/provider_user.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/utils.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  Uint8List? _file;
  _selectImage(BuildContext context) async {
    return showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: const Text('Create a post'),
        children: [
          SimpleDialogOption(
            child: const Text('Select the gallery'),
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List file = await imagePicker(ImageSource.gallery);
              setState(() {
                _file = file;
              });
            }
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<ProviderUser>(context).getUser;

    return _file == null? Center(
      child: IconButton(
        icon: const Icon(Icons.upload, color: Colors.white,),
        onPressed: () => _selectImage(context),
      ),
    ):

      Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            setState(() {
              _file = null;
            });
          },
        ),
        title: const Text('Post to'),
        centerTitle: false,
        actions: [
          TextButton(onPressed: () => {},
              child: Text('${user.username}'))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://static.wikia.nocookie.net/inuyasha/images/d/d3/Sesshomaru.png/revision/latest/scale-to-width-down/300?cb=20120617060239&path-prefix=vi',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Write a caption...',
                    border: InputBorder.none
                  ),
                  maxLines: 5,
                ),
              ),
              SizedBox(
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: MemoryImage(_file!),
                      fit: BoxFit.fill,
                      alignment: FractionalOffset.topCenter
                    )
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
