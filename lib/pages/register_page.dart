import 'package:edproject/dataSource/user_datasource.dart';
import 'package:edproject/model/register_model.dart';
import 'package:edproject/pages/home_page.dart';
import 'package:flutter/material.dart';

const classSchool = ["SD", "SMP", "SMA"];

class RegisterPage extends StatefulWidget {
  final String email;

  const RegisterPage({super.key, required this.email});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String genderField = '';
  String classField = '';

  TextEditingController nameField = TextEditingController();
  TextEditingController schoolField = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final userDataSource = UserDataSource();
  RegisterResponse? registerResponse;

  void handleGender(String gender) {
    genderField = gender;
    setState(() {});
  }

  void handleSubmit(BuildContext context) async {
    Map<String, dynamic> data = {};
    data["nama_lengkap"] = nameField.text;
    data["email"] = widget.email;
    data["nama_sekolah"] = schoolField.text;
    data["kelas"] = 1;
    data["gender"] = genderField;
    data["foto"] = 'url';
    data["jenjang"] = classField;
    registerResponse = await userDataSource.postRegister(data);
    if (registerResponse?.message == 'ok') {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F7F8),
      appBar: AppBar(
        title: const Text(
          'Yuk isi data diri',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        toolbarHeight: 130,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextFormField(
                          readOnly: true,
                          initialValue: widget.email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffD6D6D6),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffD6D6D6),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nama Lengkap',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: nameField,
                          decoration: InputDecoration(
                            hintText: 'Contoh: Jaja Suraja',
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffD6D6D6),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffD6D6D6),
                              ),
                            ),
                          ),
                          onSaved: (newValue) {},
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jenis kelamin',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  handleGender('Laki-Laki');
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: genderField == 'Laki-Laki'
                                          ? const Color(0xFF3EDE46)
                                          : const Color(0xffD6D6D6),
                                      width: 1,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Laki-laki',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  handleGender('Perempuan');
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: genderField == 'Perempuan'
                                          ? const Color(0xFF3EDE46)
                                          : const Color(0xffD6D6D6),
                                      width: 1,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Perempuan',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Kelas',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: DropdownMenu(
                            onSelected: (value) {
                              classField = value!;
                              setState(() {});
                            },
                            width: 200,
                            initialSelection: classSchool.first,
                            hintText: "Pilih Kelas",
                            dropdownMenuEntries: classSchool
                                .map<DropdownMenuEntry<String>>((value) =>
                                    DropdownMenuEntry(
                                        value: value, label: value))
                                .toList(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nama Sekolah',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: schoolField,
                          decoration: InputDecoration(
                            hintText: 'Nama Sekolah',
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffD6D6D6),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffD6D6D6),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 90),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        handleSubmit(context);

                        return;
                      } else {}
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(21),
                        backgroundColor: const Color(0xff3A7FD5)),
                    child: const Text(
                      'DAFTAR',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
