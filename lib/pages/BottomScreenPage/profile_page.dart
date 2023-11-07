import 'package:edproject/bloc/auth/bloc/auth_bloc.dart';
import 'package:edproject/pages/auth_page.dart';
import 'package:edproject/pages/edit_profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Akun Saya',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: const Color(0xff3A7FD5),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfilePage(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Edit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is GetUserAuthSuccess) {
            return Column(
              children: [
                Container(
                  height: 110,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                  decoration: const BoxDecoration(
                      color: Color(0xff3A7FD5),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.userResponse?.data?.userName ?? '',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400)),
                              Text(
                                  state.userResponse?.data?.userAsalSekolah ??
                                      '',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                          Image.asset(
                            'assets/icons/selfie2.png',
                            scale: 0.7,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 0), // changes position of shadow
                          )
                        ]),
                        child: Card(
                            color: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Identitas Diri',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Nama Lengkap',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 6),
                                      Text(
                                          state.userResponse?.data?.userName ??
                                              '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 16)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Email',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 6),
                                      Text(
                                          state.userResponse?.data?.userEmail ??
                                              '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 16)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Jenis Kelamin',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 6),
                                      Text(
                                          state.userResponse?.data
                                                  ?.userGender ??
                                              '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 16)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Kelas',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 6),
                                      Text(
                                          state.userResponse?.data?.kelas ?? '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 16)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Sekolah',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 6),
                                      Text(
                                          state.userResponse?.data
                                                  ?.userAsalSekolah ??
                                              '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 16)
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () async {
                          await GoogleSignIn().signOut();
                          await FirebaseAuth.instance.signOut();
                          if (mounted) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const AuthPage();
                                },
                              ),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          width: double.infinity,
                          height: 49,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                )
                              ]),
                          child: Center(
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/icons/log-in.svg'),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Text('Keluar',
                                    style: TextStyle(
                                        color: Color(0xffEB5757),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
