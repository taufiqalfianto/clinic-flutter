import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../dummy/widgets/build_app_bar.dart';
import '../bloc/data_doctors/data_doctor_bloc.dart';

class DataDoctorPage extends StatefulWidget {
  const DataDoctorPage({super.key});

  @override
  State<DataDoctorPage> createState() => _DataDoctorPageState();
}

class _DataDoctorPageState extends State<DataDoctorPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<DataDoctorBloc>().add(const DataDoctorEvent.getdoctor());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: BuildAppBar(
            title: 'Data Master Dokter',
            withSearchInput: true,
            searchController: searchController,
            searchChanged: (value) {
              if (searchController.text.length > 1 &&
                  searchController.text.isNotEmpty) {
                context.read<DataDoctorBloc>().add(
                      DataDoctorEvent.getdoctorbyname(searchController.text),
                    );
              }
              if (searchController.text.isEmpty) {
                context
                    .read<DataDoctorBloc>()
                    .add(const DataDoctorEvent.getdoctor());
              }
            },
            searchHint: 'Cari Dokter',
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
                child: BlocBuilder<DataDoctorBloc, DataDoctorState>(
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
                      succes: (doctors) {
                        return DataTable(
                          columnSpacing: 200,
                          columns: [
                            DataColumn(
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Button.filled(
                                  onPressed: () {},
                                  label: 'Nama Dokter',
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
                                  label: 'Spesialis',
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
                                  label: 'No REG',
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
                                  label: 'Phone',
                                  width: null,
                                  color: AppColors.title,
                                  textColor: AppColors.black.withOpacity(0.5),
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                          rows: doctors.isEmpty
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
                                    ],
                                  ),
                                ]
                              : doctors
                                  .map(
                                    (doctor) => DataRow(cells: [
                                      DataCell(
                                        Text(
                                          doctor.doctorName ?? '',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataCell(
                                          Text(doctor.doctorSpecialis ?? '')),
                                      DataCell(Text(doctor.doctorSip ?? '')),
                                      DataCell(Text(doctor.doctorPhone ?? '')),
                                    ]),
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
