// ignore: prefer_relative_imports
import 'package:fic15/presentation/master/bloc/data_patients/data_patients_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../dashboard/widget/build_app_bar.dart';
import '../dialog/create_patient_dialog.dart';

class DataPasientPage extends StatefulWidget {
  const DataPasientPage({super.key});

  @override
  State<DataPasientPage> createState() => _DataPasientPageState();
}

class _DataPasientPageState extends State<DataPasientPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<DataPatientsBloc>().add(const DataPatientsEvent.getpatients());
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
              if (searchController.text.isNotEmpty) {
                context.read<DataPatientsBloc>().add(
                      DataPatientsEvent.getpatientsbynik(searchController.text),
                    );
              }
              if (searchController.text.isEmpty) {
                context
                    .read<DataPatientsBloc>()
                    .add(const DataPatientsEvent.getpatients());
              }
            },
            searchHint: 'Cari Pasien',
            trailing: Button.filled(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => CreatePatientDialog(),
                );
              },
              label: 'Pasien Baru',
            ),
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
                child: BlocBuilder<DataPatientsBloc, DataPatientsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      loading: () {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      succes: (patients) {
                        return DataTable(
                          columnSpacing: 200,
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
                          rows: patients.isEmpty
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
                              : patients
                                  .map(
                                    (patient) => DataRow(
                                      cells: [
                                        DataCell(Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              patient.name ?? '',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(patient.phone ?? ''),
                                          ],
                                        )),
                                        DataCell(
                                          Center(
                                            child: Text(patient.gender ?? ''),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(
                                              patient.birthDate!
                                                  .toFormattedDate(),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(patient.nik ?? ''),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
