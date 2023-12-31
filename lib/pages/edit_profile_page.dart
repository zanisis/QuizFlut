import 'package:edproject/bloc/auth/bloc/auth_bloc.dart';
import 'package:edproject/constants/variable.dart';
import 'package:edproject/dataSource/user_datasource.dart';
import 'package:edproject/model/register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String? genderValue;
  bool isLoading = false;

  final userDataSource = UserDataSource();
  RegisterResponse? userUpdateResponse;

  TextEditingController nameFieldControl = TextEditingController();
  TextEditingController classFieldControl = TextEditingController();
  TextEditingController schoolFieldControl = TextEditingController();

  @override
  void initState() {
    handleValue();
    super.initState();
  }

  void handleValue() {
    var state = context.read<AuthBloc>().state;
    if (state is GetUserAuthSuccess) {
      nameFieldControl.text = state.userResponse?.data?.userName ?? '';
      classFieldControl.text = state.userResponse?.data?.kelas ?? '';
      schoolFieldControl.text = state.userResponse?.data?.userAsalSekolah ?? '';
      genderValue = state.userResponse?.data?.userGender ?? '';
    }
  }

  void updateProfile() async {
    setState(() {
      isLoading = true;
    });
    final state = context.read<AuthBloc>().state;
    Map<String, dynamic> data = {};
    data["nama_lengkap"] = nameFieldControl.text;
    data["nama_sekolah"] = schoolFieldControl.text;
    data["kelas"] = classFieldControl.text;
    data["gender"] = genderValue;
    data["foto"] = 'url';
    if (state is GetUserAuthSuccess) {
      data["email"] = state.email;
    }

    userUpdateResponse = await userDataSource.updateUser(data);

    if (userUpdateResponse?.message == 'update sukses') {
      if (context.mounted) {
        context.read<AuthBloc>().add(
              GetUserAuth(email: userUpdateResponse?.data?.userEmail ?? ''),
            );
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Edit Akun',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff3A7FD5),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is GetUserAuthSuccess) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 26,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Data Diri',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nama Lengkap',
                          style: TextStyle(
                            color: Color(0xff99A1AC),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextFormField(
                          controller: nameFieldControl,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff1A1F26),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff1A1F26),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(
                            color: Color(0xff99A1AC),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextFormField(
                          initialValue: state.email,
                          enabled: false,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff1A1F26),
                              ),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff1A1F26),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Jenis Kelamin',
                          style: TextStyle(
                            color: Color(0xff99A1AC),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        DropdownButton<String>(
                          isExpanded: true,
                          hint: const Text(
                            'Pilih Jenis Kelamin',
                            style: TextStyle(
                              color: Color(0xff99A1AC),
                            ),
                          ),
                          value: genderValue,
                          elevation: 16,
                          underline: Container(
                            height: 1,
                            color: const Color(0xff99A1AC),
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              genderValue = value!;
                            });
                          },
                          items: VariableName.genderList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Kelas',
                          style: TextStyle(
                            color: Color(0xff99A1AC),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextFormField(
                          controller: classFieldControl,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff1A1F26),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff1A1F26),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sekolah',
                          style: TextStyle(
                            color: Color(0xff99A1AC),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextFormField(
                          controller: schoolFieldControl,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff1A1F26),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff1A1F26),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          isLoading ? null : updateProfile();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff3A7FD5),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          side: const BorderSide(
                            color: Color(0xff3A7FD5),
                            width: 1,
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Perbarui Data',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
