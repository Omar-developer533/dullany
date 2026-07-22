import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();

Future<String?> getGalleryImage() async {
  File file;
  XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if(image!=null){ file = File(image.path);
  var imageName = basename(image.path);
  var reference = FirebaseStorage.instance.ref('category/$imageName');
  await reference.putFile(file);
   var url=await reference.getDownloadURL();

  return url;}
  return null;
 
}

Future<File?> getCameraImage() async {
  File file;
  XFile? image = await picker.pickImage(source: ImageSource.camera);
  file = File(image!.path);
  return file;
}
