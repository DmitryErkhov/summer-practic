import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _telegramController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  DateTime _selectedDate = DateTime(2006, 1, 1);
  String? _selectedGender;
  bool passwordVisible = true;
  bool confirmPasswordVisible = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 244, 247, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Регистрация', style: TextStyle(color: Color.fromRGBO(16, 24, 40, 1), fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 30)),

                // Блок ОСНОВНАЯ ИНФОРМАЦИЯ
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('ОСНОВНАЯ ИНФОРМАЦИЯ', style: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 14)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.only(top: 8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              TextField(
                                controller: _firstNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Ваше имя*',
                                  hintStyle: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),
                                  fillColor: Colors.yellow,
                                  focusColor: Colors.yellow,
                                  border: InputBorder.none,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                color: const Color.fromRGBO(234, 236, 240, 1),
                                height: 1,
                              ),
                              TextField(
                                controller: _lastNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Ваша фамилия',
                                  hintStyle: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                color: const Color.fromRGBO(234, 236, 240, 1),
                                height: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Дата рождения*', style: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16)),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      showCupertinoModalPopup(
                                        context: context,
                                        builder: (_) => Container(
                                          height: 250,
                                          color: const Color.fromARGB(255, 255, 255, 255),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 200,
                                                child: CupertinoDatePicker(
                                                  initialDateTime: _selectedDate,
                                                  mode: CupertinoDatePickerMode.date,
                                                  onDateTimeChanged: (val) {
                                                    setState(() {
                                                      _selectedDate = val;
                                                    });
                                                  },
                                                ),
                                              ),
                                              CupertinoButton(
                                                child: const Text('OK'),
                                                onPressed: () => Navigator.of(context).pop(),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(242, 244, 247, 1),
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Text(
                                        "${_selectedDate.toLocal()}".split(' ')[0],
                                          style: const TextStyle(color: Color.fromRGBO(16, 24, 40, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                color: const Color.fromRGBO(234, 236, 240, 1),
                                height: 1,
                              ),
                              DropdownButton<String>(
                                icon: const Icon(Icons.unfold_more),
                                underline: Container(),
                                isExpanded: true,
                                items: <String>['Мужской', 'Женский'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style: const TextStyle(color: Color.fromRGBO(16, 24, 40, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                  });
                                },
                                value: _selectedGender,
                                hint: const Text('Выберите пол', style: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16)),
                                // style: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                // Блок КОНТАКТНАЯ ИНФОРМАЦИЯ
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('КОНТАКТНАЯ ИНФОРМАЦИЯ', style: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 14)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.only(top: 8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Baseline(
                                      baseline: 20.0,
                                      baselineType: TextBaseline.alphabetic,
                                      child: Text('+7 ', style: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),)
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _phoneController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(10),
                                        TextInputFormatter.withFunction((oldValue, newValue) {
                                          final newText = newValue.text;
                                          if (newText.length > 10) return oldValue;

                                          final buffer = StringBuffer();
                                          for (int i = 0; i < newText.length; i++) {
                                            if (i == 3 || i == 6 || i == 8) {
                                              buffer.write(' ');
                                            }
                                            buffer.write(newText[i]);
                                          }

                                          final formattedText = buffer.toString();
                                          return TextEditingValue(
                                            text: formattedText,
                                            selection: TextSelection.collapsed(offset: formattedText.length),
                                          );
                                        }),
                                      ],
                                      decoration: const InputDecoration(
                                        hintText: 'ваш номер телефона',
                                        hintStyle: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                color: const Color.fromRGBO(234, 236, 240, 1),
                                height: 1,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Baseline(
                                    baseline: 20.0,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text('@ ', style: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),)
                                  ),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.phone,
                                      controller: _telegramController,
                                      decoration: const InputDecoration(
                                        hintText: 'имя пользователя в Telegram',
                                        hintStyle: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                // Блок О СЕБЕ
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('О СЕБЕ', style: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 14)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.only(top: 8),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minHeight: 120),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                TextField(
                                  controller: _aboutController,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    hintText: 'Расскажите о себе подробнее... \n (например, футболист, 24 года)',
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(102, 112, 133, 1),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),


                // Блок ГДЕ ВЫ НАХОДИТЕСЬ
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('ГДЕ ВЫ НАХОДИТЕСЬ', style: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 14)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.only(top: 8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              TextField(
                                controller: _countryController,
                                decoration: const InputDecoration(
                                  hintText: 'Ваша страна*',
                                  hintStyle: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),
                                  fillColor: Colors.yellow,
                                  focusColor: Colors.yellow,
                                  border: InputBorder.none,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                color: const Color.fromRGBO(234, 236, 240, 1),
                                height: 1,
                              ),
                              TextField(
                                controller: _regionController,
                                decoration: const InputDecoration(
                                  hintText: 'Ваш регион*',
                                  hintStyle: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                color: const Color.fromRGBO(234, 236, 240, 1),
                                height: 1,
                              ),
                              TextField(
                                controller: _cityController,
                                decoration: const InputDecoration(
                                  hintText: 'Ваш населённый пункт*',
                                  hintStyle: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                // Блок ДАННЫЕ ДЛЯ ВХОДА
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('ДАННЫЕ ДЛЯ ВХОДА', style: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 14)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.only(top: 8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: 'Ваша электронная почта*',
                                  hintStyle: TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),
                                  fillColor: Colors.yellow,
                                  focusColor: Colors.yellow,
                                  border: InputBorder.none,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                color: const Color.fromRGBO(234, 236, 240, 1),
                                height: 1,
                              ),
                              TextField(
                                obscureText: passwordVisible,
                                controller: _passwordController,
                                decoration:  InputDecoration(
                                  hintText: 'Придумайте пароль*',
                                  hintStyle: const TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    color: const Color.fromRGBO(102, 112, 133, 1),
                                    icon: Icon( passwordVisible ? Icons.visibility
                                        : Icons.visibility_off, size: 18,),
                                    onPressed: () {
                                      setState(
                                            () {
                                          passwordVisible = !passwordVisible;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                color: const Color.fromRGBO(234, 236, 240, 1),
                                height: 1,
                              ),
                              TextField(
                                obscureText: confirmPasswordVisible,
                                controller: _confirmPasswordController,
                                decoration:  InputDecoration(
                                  hintText: 'Повторите пароль*',
                                  hintStyle: const TextStyle(color: Color.fromRGBO(102, 112, 133, 1), fontFamily: 'Inter', fontWeight: FontWeight.w400, fontSize: 16),
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    color: const Color.fromRGBO(102, 112, 133, 1),
                                    icon: Icon( confirmPasswordVisible ? Icons.visibility
                                        : Icons.visibility_off, size: 18,),
                                    onPressed: () {
                                      setState(
                                            () {
                                              confirmPasswordVisible = !confirmPasswordVisible;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                // Блок ЗАРЕГИСТРИРОВАТЬСЯ
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: _firstNameController.text.isNotEmpty
                          && _lastNameController.text.isNotEmpty
                          && _countryController.text.isNotEmpty
                          && _regionController.text.isNotEmpty
                          && _cityController.text.isNotEmpty
                          && _emailController.text.isNotEmpty
                          && _passwordController.text.isNotEmpty
                          && _confirmPasswordController.text.isNotEmpty
                          && (_confirmPasswordController.text == _passwordController.text)
                          ? Color.fromRGBO(236, 74, 10, 1)
                          : Color.fromRGBO(250, 212, 196, 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        _firstNameController.text.isNotEmpty
                            && _lastNameController.text.isNotEmpty
                            && _countryController.text.isNotEmpty
                            && _regionController.text.isNotEmpty
                            && _cityController.text.isNotEmpty
                            && _emailController.text.isNotEmpty
                            && _passwordController.text.isNotEmpty
                            && _confirmPasswordController.text.isNotEmpty
                            && (_confirmPasswordController.text == _passwordController.text)
                            ? {debugPrint('Debug))')}
                            : null;
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text('Зарегистрироваться', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 16),),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}