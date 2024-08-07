
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';

import '../model/user_model.dart';

part 'register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();

 bool isLoadingRegister = false;
  UserModel? userModel;
  Uint8List? imgPath;
  String? imgName;
  final picker = ImagePicker();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> register(BuildContext context, {required UserModel userModel, required String password}) async {
    isLoadingRegister = true;
    emit(RegisterLoading());

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userModel.email!, password: password);
      String userId = userCredential.user?.uid ?? '';
      if (userId.isEmpty) throw Exception('User ID is null');

      String? imageUrl;
      if (imgPath != null) {
        imageUrl = await uploadImageToFirebase(imgPath!, userId);
      }

      userModel.image = imageUrl ?? '';

      await FirebaseFirestore.instance.collection('users').doc(userId).set(userModel.toMap(id: userId));

      emailController.clear();
      passwordController.clear();
      nameController.clear();
      titleController.clear();
      isLoadingRegister = false;
      emit(RegisterSuccess());
      Navigator.pop(context);
    } catch (error) {
      isLoadingRegister = false;
      Fluttertoast.showToast(msg: error.toString());
      emit(RegisterError(error: error.toString()));
    }
  }

  Future<String> uploadImageToFirebase(Uint8List imgData, String userId) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child('ProfileImage/$userId.jpg');
      UploadTask uploadTask = ref.putData(imgData);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Image upload error: $e");
      throw e;
    }
  }

  Future<void> pickImageFromGallery() async {
    final XFile? pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
    try {
      if (pickedImg != null) {
        imgPath = await pickedImg.readAsBytes();
        imgName = basename(pickedImg.path);
        emit(RegisterImagePicked(imgPath!));
      } else {
        print("No image selected");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  bool isShowSignUpPassword = true;



  void changeSignUpPasswordVisibility() {
    isShowSignUpPassword = !isShowSignUpPassword;
    emit(ShowPasswordInSignUp());
  }
}
