import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../models/doctor_model.dart';
import '../widgets/build_app_bar.dart';

class DataDoctorPageBK extends StatelessWidget {
  const DataDoctorPageBK({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final doctors = [
      DoctorModel(
        imageUrl: '',
        name: 'Dr. John Doe',
        spesialis: 'Cardiologist',
        noReg: '12345',
        jadwalPraktikBuka: DateTime(2024, 2, 24, 9, 0),
        jadwalPraktikTutup: DateTime(2024, 2, 24, 17, 0),
        ruangan: 'Room 101',
      ),
      DoctorModel(
        imageUrl: '',
        name: 'Dr. Jane Smith',
        spesialis: 'Dermatologist',
        noReg: '54321',
        jadwalPraktikBuka: DateTime(2024, 2, 25, 10, 0),
        jadwalPraktikTutup: DateTime(2024, 2, 25, 18, 0),
        ruangan: 'Room 202',
      ),
      DoctorModel(
        imageUrl: '',
        name: 'Dr. Michael Johnson',
        spesialis: 'Pediatrician',
        noReg: '67890',
        jadwalPraktikBuka: DateTime(2024, 2, 26, 8, 0),
        jadwalPraktikTutup: DateTime(2024, 2, 26, 16, 0),
        ruangan: 'Room 303',
      ),
      DoctorModel(
        imageUrl: '',
        name: 'Dr. Emily Williams',
        spesialis: 'Neurologist',
        noReg: '13579',
        jadwalPraktikBuka: DateTime(2024, 2, 27, 11, 0),
        jadwalPraktikTutup: DateTime(2024, 2, 27, 19, 0),
        ruangan: 'Room 404',
      ),
      DoctorModel(
        imageUrl: '',
        name: 'Dr. David Brown',
        spesialis: 'Oncologist',
        noReg: '24680',
        jadwalPraktikBuka: DateTime(2024, 2, 28, 7, 30),
        jadwalPraktikTutup: DateTime(2024, 2, 28, 15, 30),
        ruangan: 'Room 505',
      ),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Data Master',
          withSearchInput: true,
          searchController: searchController,
          // searchTap: () {},
          searchHint: 'Cari Dokter',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button.outlined(
                onPressed: () {},
                label: '',
                width: null,
                textColor: AppColors.grey,
                icon: Assets.icons.filter.svg(),
              ),
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
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Button.filled(
                        onPressed: () {},
                        label: 'Nama Dokter',
                        width: null,
                        suffixIcon: const Icon(
                          Icons.expand_more,
                          color: AppColors.black,
                        ),
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
                        label: 'Spesialis',
                        width: null,
                        suffixIcon: const Icon(
                          Icons.expand_more,
                          color: AppColors.black,
                        ),
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
                        label: 'No REG',
                        width: null,
                        suffixIcon: const Icon(
                          Icons.expand_more,
                          color: AppColors.black,
                        ),
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
                        label: 'Jadwal Praktik',
                        width: null,
                        suffixIcon: const Icon(
                          Icons.expand_more,
                          color: AppColors.black,
                        ),
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
                        label: 'Ruangan',
                        width: null,
                        suffixIcon: const Icon(
                          Icons.expand_more,
                          color: AppColors.black,
                        ),
                        color: AppColors.card,
                        textColor: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
                rows: doctors
                    .map(
                      (doctor) => DataRow(cells: [
                        DataCell(Text(doctor.name)),
                        DataCell(Text(doctor.spesialis)),
                        DataCell(Text(doctor.noReg)),
                        DataCell(Text(doctor.jadwalPraktikFormatted)),
                        DataCell(Text(doctor.ruangan)),
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
