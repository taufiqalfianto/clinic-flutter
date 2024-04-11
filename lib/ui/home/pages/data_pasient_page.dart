import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../enums/pasient_status.dart';
import '../models/pasient_model.dart';
import '../widgets/build_app_bar.dart';

class DataPasientPage extends StatefulWidget {
  const DataPasientPage({super.key});

  @override
  State<DataPasientPage> createState() => _DataPasientPageState();
}

class _DataPasientPageState extends State<DataPasientPage> {
  final searchController = TextEditingController();
  final patients = [
    PasientModel(
      nama: 'John Doe',
      keluhan: 'Flu',
      jenisKelamin: 'Laki-laki',
      tanggalLahir: DateTime(1990, 5, 15),
      nik: '1234567890',
      status: PasientStatus.waiting,
    ),
    PasientModel(
      nama: 'Jane Smith',
      keluhan: 'Headache',
      jenisKelamin: 'Perempuan',
      tanggalLahir: DateTime(1985, 8, 21),
      nik: '0987654321',
      status: PasientStatus.processing,
    ),
    PasientModel(
      nama: 'Michael Johnson',
      keluhan: 'Stomachache',
      jenisKelamin: 'Laki-laki',
      tanggalLahir: DateTime(1978, 3, 10),
      nik: '5432167890',
      status: PasientStatus.rejected,
    ),
    PasientModel(
      nama: 'Emily Williams',
      keluhan: 'Fever',
      jenisKelamin: 'Perempuan',
      tanggalLahir: DateTime(1992, 11, 30),
      nik: '0987123456',
      status: PasientStatus.completed,
    ),
    PasientModel(
      nama: 'David Brown',
      keluhan: 'Cough',
      jenisKelamin: 'Laki-laki',
      tanggalLahir: DateTime(1980, 7, 5),
      nik: '6789012345',
      status: PasientStatus.confirmed,
    ),
  ];
  late List<PasientModel> searchResult;

  @override
  void initState() {
    searchResult = patients;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: BuildAppBar(
            title: 'Data Master Pasien',
            withSearchInput: true,
            searchController: searchController,
            searchChanged: (value) {
              searchResult = patients
                  .where((element) => element.nama
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase()))
                  .toList();
              setState(() {});
            },
            searchHint: 'Cari Pasien',
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.stroke),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  dataRowMinHeight: 30.0,
                  dataRowMaxHeight: 60.0,
                  columns: [
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Button.filled(
                          onPressed: () {},
                          label: 'Nama Pasien',
                          width: null,
                          color: AppColors.title,
                          textColor: AppColors.black.withOpacity(0.5),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Button.filled(
                          onPressed: () {},
                          label: 'Jenis Kelamnin',
                          width: null,
                          color: AppColors.title,
                          textColor: AppColors.black.withOpacity(0.5),
                          fontSize: 14.0,
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
                          color: AppColors.title,
                          textColor: AppColors.black.withOpacity(0.5),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Button.filled(
                          onPressed: () {},
                          label: 'NIK',
                          width: null,
                          color: AppColors.title,
                          textColor: AppColors.black.withOpacity(0.5),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                  rows: searchResult.isEmpty
                      ? [
                          const DataRow(
                            cells: [
                              DataCell(Row(
                                children: [
                                  Icon(Icons.highlight_off),
                                  SpaceWidth(4.0),
                                  Text('Data tidak ditemukan..'),
                                ],
                              )),
                              DataCell.empty,
                              DataCell.empty,
                              DataCell.empty,
                            ],
                          ),
                        ]
                      : searchResult
                          .map(
                            (patient) => DataRow(cells: [
                              DataCell(Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    patient.nama,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(patient.kategoriUmur),
                                ],
                              )),
                              DataCell(
                                  Center(child: Text(patient.jenisKelamin))),
                              DataCell(Center(
                                  child: Text(patient.tanggalLahirFormatted))),
                              DataCell(Center(child: Text(patient.nik))),
                            ]),
                          )
                          .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
