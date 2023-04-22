// 🐦 Flutter imports:

import 'package:akm/app/common/provinsi_kabupaten.dart';
import 'package:akm/app/modules/office-selection/controllers/office_selection_controller.dart';
import 'package:akm/app/modules/office-selection/widget/components/office_selection_office_searchable_form/searchabledropdown.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:

// 🌎 Project imports:

class OfficeSearchableBody extends StatelessWidget {
  const OfficeSearchableBody({
    super.key,
    required this.controller,
  });

  final OfficeSelectionController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Ini digunakan untuk tampilan di cetakan dokumen dan akan hilang jika aplikasi di uninstall atau di clear cache",
            style: TextStyle(
              fontSize: 19.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        FleetimeOfficeSelectionDropdown(
          name: 'cabang_utama',
          icon: Icons.apartment,
          hintText: 'Pilih Kantor',
          items: cabangUtama,
          onChanged: (value) {
            controller.cabangUtama = value!;
            debugPrint(controller.cabangUtama);
          },
          onSaved: (value) {
            controller.cabangUtama = value!;
            debugPrint(controller.cabangUtama);
          },
          dropdownSearchDecoration: const InputDecoration(
            hintText: 'Cabang Utama',
            labelText: 'Cabang Utama',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // FormBuilderSearchableDropdown<String>(
        //   name: 'cabang_pembantu',
        //   onChanged: (value) {
        //     controller.cabangPembantu = value!;
        //     debugPrint(controller.cabangPembantu);
        //   },
        //   onSaved: (value) {
        //     controller.cabangPembantu = value!;
        //     debugPrint(controller.cabangPembantu);
        //   },
        //   decoration: InputDecoration(
        //     alignLabelWithHint: true,
        //     prefixIcon: const Icon(
        //       Icons.location_city_outlined,
        //       color: Colors.black,
        //       size: 25,
        //     ),
        //     suffixIcon: IconButton(
        //       icon: const Icon(
        //         Icons.check_circle_outline,
        //         color: GFColors.SUCCESS,
        //         size: 25,
        //       ),
        //       onPressed: () {},
        //     ),
        //     isDense: true,
        //     contentPadding: const EdgeInsets.symmetric(
        //       vertical: 25,
        //     ),
        //     focusColor: Colors.red,
        //     fillColor: Colors.grey.shade400,
        //     hoverColor: Colors.red,
        //     filled: true,
        //     focusedBorder: OutlineInputBorder(
        //       borderSide: const BorderSide(color: Colors.black45),
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     enabledBorder: OutlineInputBorder(
        //       borderSide: const BorderSide(color: Colors.transparent),
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     border: const OutlineInputBorder(
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(10),
        //       ),
        //       borderSide: BorderSide(
        //         color: Colors.transparent,
        //       ),
        //     ),
        //     hintText: 'Pilih Cabang Pembantu',
        //     hintStyle: TextStyle(
        //       color: Colors.black45,
        //       fontSize: 20,
        //       fontWeight: FontWeight.w600,
        //       // add custom google font
        //       fontFamily: GoogleFonts.montserrat().fontFamily,
        //     ),
        //   ),
        //   validator: FormBuilderValidators.required(),
        //   items: officeBranches,
        //   popupProps: const PopupProps.menu(showSearchBox: true),
        //   dropdownSearchDecoration: const InputDecoration(
        //     hintText: 'Cabang Utama',
        //     labelText: 'Cabang Utama',
        //   ),
        //   filterFn: (provinsi, filter) =>
        //       provinsi.toLowerCase().contains(filter.toLowerCase()),
        // ),
        FleetimeOfficeSelectionDropdown(
          name: 'cabang_pembantu',
          icon: Icons.location_city_outlined,
          hintText: 'Pilih Cabang Pembantu',
          items: officeBranches,
          onChanged: (value) {
            controller.cabangPembantu = value!;
            debugPrint(controller.cabangPembantu);
          },
          onSaved: (value) {
            controller.cabangPembantu = value!;
            debugPrint(controller.cabangPembantu);
          },
          dropdownSearchDecoration: const InputDecoration(
            hintText: 'Cabang Pembantu',
            labelText: 'Cabang Pembantu',
          ),
        ),
      ],
    );
  }
}
