import 'package:flutter/material.dart';
import 'package:flutter_101/views/login/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _studentNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _studentNumberFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Öğrenci Bilgi Sistemi Kayıt',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          _buildImage(context),
          const SizedBox(
            height: 20,
          ),
          _buildStudentNumber(),
          const SizedBox(
            height: 20,
          ),
          _buildPassword(),
          const SizedBox(
            height: 20,
          ),
          _buildSaveButton(context),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        'https://picsum.photos/seed/picsum/200/300',
        fit: BoxFit.fill,
        height: size.height * .3,
      ),
    );
  }

  Widget _buildStudentNumber() {
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          focusNode: _studentNumberFocus,
          controller: _studentNumberController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Öğrenci numarası",
          ),
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          focusNode: _passwordFocus,
          obscureText: true,
          controller: _passwordController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Parola",
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _saveButtonOnTap(context),
      child: Container(
        height: 40,
        decoration: BoxDecoration(color: Colors.indigo.shade900, borderRadius: BorderRadius.circular(5)),
        child: const Center(
          child: Text(
            'Kaydet',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _saveButtonOnTap(BuildContext context) {
    if (_studentNumberController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => false,
      );
    } else {
      Fluttertoast.showToast(
          msg: "Boş alan bırakmayınız.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
