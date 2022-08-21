// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/widget/color_button.dart';
import 'package:akm/app/widget/drawer.dart';
import '../controllers/pro_pengajuan_approve_controller.dart';

class ProPengajuanApproveView extends GetView<ProPengajuanApproveController> {
  const ProPengajuanApproveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: const Text('Approve'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: FormBuilder(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GifView.asset(
                  'assets/images/approve/approve_header.gif',
                  frameRate: 30,
                  fit: BoxFit.cover,
                  loop: false,
                  height: 400,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Divider(
                    thickness: 1,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Form Approval Pengajuan',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                FormBuilderSearchableDropdown<String>(
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  name: 'searchable_dropdown_online',
                  onChanged: _onChanged,
                  asyncItems: (filter) async {
                    await Future.delayed(const Duration(seconds: 1));
                    return allDebiturs
                        .where((element) => element
                            .toLowerCase()
                            .contains(filter.toLowerCase()))
                        .toList();
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nama Debitur',
                    labelText: 'Nama Debitur',
                    prefixIcon: Icon(Icons.wifi_protected_setup_outlined),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FormBuilderSwitch(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Approve',
                    labelText: 'Approval',
                    prefixIcon: Icon(Icons.handshake_rounded),
                  ),
                  name: 'Approved',
                  title: const Text(
                    'Approve ?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                colorButton(
                    context,
                    'Submit',
                    () => {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.SUCCES,
                            dialogBackgroundColor: primaryColor,
                            titleTextStyle: const TextStyle(
                              color: secondaryColor,
                              fontSize: 20,
                            ),
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Berhasil Disetujui',
                            btnOkOnPress: () {},
                            autoHide: const Duration(seconds: 3),
                          )..show(),
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _onChanged(dynamic val) => debugPrint(val.toString());

const allDebiturs = [
  'Novian Andika',
  'Lussy Ika',
  'Meliya Aja',
  'Monkey D Luffy',
];
