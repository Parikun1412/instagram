import 'package:image_picker/image_picker.dart';

imagePicker(ImageSource imageSource) async{
  ImagePicker imagePicker = ImagePicker();
  final XFile? image = await imagePicker.pickImage(source: imageSource);
  if(image!=null){
    return image.readAsBytes();
  }
  print('No image select');
}