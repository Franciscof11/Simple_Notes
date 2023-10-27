import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

final storageRef = FirebaseStorage.instance.ref();

ImagePicker imagePicker = ImagePicker();

Future<XFile?> pegarImagemGaleria() async {
  XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    return image;
  }
  return null;
}

Future<XFile?> pegarImagemCamera() async {
  XFile? image = await imagePicker.pickImage(source: ImageSource.camera);

  if (image != null) {
    return image;
  }
  return null;
}

//Fazer oque quiser com a imagem-> Image.file(imagemSelecionada.path);

