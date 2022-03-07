import 'package:flutter/material.dart';
import 'package:flutter_101/views/home/home_page.dart';
import 'package:flutter_101/views/register/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

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
            'Öğrenci Bilgi Sistemi',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildLogo(context),
          _buildStudentNumber(),
          const SizedBox(
            height: 20,
          ),
          _buildPassword(),
          const SizedBox(
            height: 20,
          ),
          _buildLoginButton(context),
          const SizedBox(
            height: 5,
          ),
          _buildRegisterRow(context),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Image.asset(
        'assets/logo.png',
        height: size.height * .3,
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: () => _loginOnTap(context),
        child: const Text('Giriş yap'),
        style: ElevatedButton.styleFrom(
          primary: Colors.indigo.shade900,
        ),
      ),
    );
  }

  Widget _buildRegisterRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Henüz üye değil misin?'),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () => _registerOnTap(context),
          child: const Text(
            'Hemen kayıt ol!',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStudentNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Material(
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
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Material(
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
      ),
    );
  }

  void _loginOnTap(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
      (route) => false,
    );
  }

  void _registerOnTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }
}
