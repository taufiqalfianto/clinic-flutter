import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../enums/pasient_status.dart';
import '../models/pasient_model.dart';
import '../widgets/build_app_bar.dart';
import '../pages/confirm_payment_page.dart';

class DataPasientPageBK extends StatelessWidget {
  const DataPasientPageBK({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final scaffoldkey = GlobalKey<ScaffoldState>();
    final patients = [
      PasientModel(
        nama: 'Jaelani',
        keluhan: 'Flu',
        jenisKelamin: 'Laki-laki',
        tanggalLahir: DateTime(1990, 5, 15),
        nik: '1234567890',
        status: PasientStatus.processing,
      ),
      PasientModel(
        nama: 'Sarah',
        keluhan: 'Headache',
        jenisKelamin: 'Perempuan',
        tanggalLahir: DateTime(1985, 8, 21),
        nik: '0987654321',
        status: PasientStatus.processing,
      ),
      PasientModel(
        nama: 'Romadhon',
        keluhan: 'Stomachache',
        jenisKelamin: 'Laki-laki',
        tanggalLahir: DateTime(1978, 3, 10),
        nik: '5432167890',
        status: PasientStatus.processing,
      ),
      PasientModel(
        nama: 'Zaskia',
        keluhan: 'Fever',
        jenisKelamin: 'Perempuan',
        tanggalLahir: DateTime(1991, 11, 30),
        nik: '0987123456',
        status: PasientStatus.processing,
      ),
      PasientModel(
        nama: 'Budi',
        keluhan: 'Cough',
        jenisKelamin: 'Laki-laki',
        tanggalLahir: DateTime(1990, 7, 5),
        nik: '6789012345',
        status: PasientStatus.waiting,
      ),
    ];

    return Scaffold(
      key: scaffoldkey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Data Pasien',
          withSearchInput: true,
          searchController: searchController,
          // searchTap: () {},
          searchHint: 'Cari Pasien',
        ),
      ),
      endDrawer: Drawer(
        width: context.deviceWidth / 1.25,
        child: const ConfirmPaymentPage(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Row(
            children: [
              Badge(
                backgroundColor: PasientStatus.waiting.color,
                smallSize: 18.0,
              ),
              const SpaceWidth(4.0),
              Text(PasientStatus.waiting.value),
              const SpaceWidth(40.0),
              Badge(
                backgroundColor: PasientStatus.processing.color,
                smallSize: 18.0,
              ),
              const SpaceWidth(4.0),
              Text(PasientStatus.processing.value),
              // const SpaceWidth(40.0),
              // Badge(
              //   backgroundColor: PasientStatus.onHold.color,
              //   smallSize: 18.0,
              // ),
              const SpaceWidth(4.0),
              Text(PasientStatus.onHold.value),
              const SpaceWidth(40.0),
              Badge(
                backgroundColor: PasientStatus.completed.color,
                smallSize: 18.0,
              ),
              const SpaceWidth(4.0),
              Text(PasientStatus.completed.value),
              const Spacer(),
              // Button.outlined(
              //   onPressed: () {},
              //   label: '',
              //   width: null,
              //   textColor: AppColors.grey,
              //   icon: Assets.icons.filter.svg(),
              // ),
              const SpaceWidth(20.0),
              Button.outlined(
                onPressed: () {},
                label: 'Sort: Nama Dokter',
                width: null,
                textColor: AppColors.grey,
                icon: Assets.icons.sort.svg(),
              ),
              const SpaceWidth(20.0),
              Button.outlined(
                onPressed: () {},
                label: 'Februari, 2024',
                width: null,
                textColor: AppColors.grey,
                icon: const Icon(
                  Icons.chevron_left,
                  color: AppColors.grey,
                ),
                suffixIcon: const Icon(
                  Icons.chevron_right,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          const SpaceHeight(40.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.stroke),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Button.filled(
                        onPressed: () {},
                        label: 'Nama Pasien',
                        width: null,
                        // suffixIcon: const Icon(
                        //   Icons.expand_more,
                        //   color: AppColors.black,
                        // ),
                        color: AppColors.card,
                        textColor: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  // DataColumn(
                  //   label: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Button.filled(
                  //       onPressed: () {},
                  //       label: 'Keluhan',
                  //       width: null,
                  //       suffixIcon: const Icon(
                  //         Icons.expand_more,
                  //         color: AppColors.black,
                  //       ),
                  //       color: AppColors.card,
                  //       textColor: AppColors.black.withOpacity(0.5),
                  //     ),
                  //   ),
                  // ),
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Button.filled(
                        onPressed: () {},
                        label: 'Gender',
                        width: null,
                        // suffixIcon: const Icon(
                        //   Icons.expand_more,
                        //   color: AppColors.black,
                        // ),
                        color: AppColors.card,
                        textColor: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Button.filled(
                        onPressed: () {},
                        label: 'Tanggal Lahir',
                        width: null,
                        // suffixIcon: const Icon(
                        //   Icons.expand_more,
                        //   color: AppColors.black,
                        // ),
                        color: AppColors.card,
                        textColor: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  // DataColumn(
                  //   label: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Button.filled(
                  //       onPressed: () {},
                  //       label: 'NIK',
                  //       width: null,
                  //       suffixIcon: const Icon(
                  //         Icons.expand_more,
                  //         color: AppColors.black,
                  //       ),
                  //       color: AppColors.card,
                  //       textColor: AppColors.black.withOpacity(0.5),
                  //     ),
                  //   ),
                  // ),
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Button.filled(
                        onPressed: () {},
                        label: 'Status',
                        width: null,
                        // suffixIcon: const Icon(
                        //   Icons.expand_more,
                        //   color: AppColors.black,
                        // ),
                        color: AppColors.card,
                        textColor: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Button.filled(
                        onPressed: () {},
                        label: 'Action',
                        width: null,
                        // suffixIcon: const Icon(
                        //   Icons.expand_more,
                        //   color: AppColors.black,
                        // ),
                        color: AppColors.card,
                        textColor: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
                rows: patients
                    .map(
                      (doctor) => DataRow(cells: [
                        DataCell(Text(doctor.nama)),
                        // DataCell(Text(doctor.keluhan)),
                        DataCell(Text(doctor.jenisKelamin)),
                        DataCell(Text(doctor.tanggalLahirFormatted)),
                        // DataCell(Text(doctor.nik)),
                        DataCell(ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: ColoredBox(
                            color: doctor.status.backgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                              child: Text(
                                doctor.status.value,
                                style: TextStyle(
                                  color: doctor.status.color,
                                ),
                              ),
                            ),
                          ),
                        )),
                        DataCell(
                          PopupMenuButton<PasientStatus>(
                            offset: const Offset(0, 50),
                            icon: const Icon(Icons.more_horiz),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<PasientStatus>>[
                              const PopupMenuItem<PasientStatus>(
                                value: PasientStatus.processing,
                                child: _PopupMenuItemValue(
                                    PasientStatus.processing),
                              ),
                              const PopupMenuItem<PasientStatus>(
                                value: PasientStatus.onHold,
                                child:
                                    _PopupMenuItemValue(PasientStatus.onHold),
                              ),
                              const PopupMenuItem<PasientStatus>(
                                value: PasientStatus.waiting,
                                child:
                                    _PopupMenuItemValue(PasientStatus.waiting),
                              ),
                              const PopupMenuItem<PasientStatus>(
                                value: PasientStatus.completed,
                                child: _PopupMenuItemValue(
                                    PasientStatus.completed),
                              ),
                              const PopupMenuItem<PasientStatus>(
                                value: PasientStatus.rejected,
                                child:
                                    _PopupMenuItemValue(PasientStatus.rejected),
                              ),
                            ],
                            onSelected: (PasientStatus value) {
                              // context.push(const ConfirmPaymentPage());
                              scaffoldkey.currentState!.openEndDrawer();
                            },
                          ),
                        )
                      ]),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PopupMenuItemValue extends StatelessWidget {
  final PasientStatus item;
  const _PopupMenuItemValue(this.item);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 18.0,
          height: 18.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: item.color,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
        ),
        const SpaceWidth(4.0),
        Text(item.value),
      ],
    );
  }
}
