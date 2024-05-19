import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/buttons.dart';
import '../../../components/spaces.dart';
import '../../../core/core.dart';
import '../../dashboard/widget/build_app_bar.dart';
import '../../dummy/enums/pasient_status.dart';
import '../bloc/bloc/patient_schedule_bloc.dart';

class PatientSchedulePage extends StatefulWidget {
  // final void Function(int index) onTap;

  PatientSchedulePage({
    super.key,
    // required this.onTap,
  });

  @override
  State<PatientSchedulePage> createState() => _PatientSchedulePageState();
}

class _PatientSchedulePageState extends State<PatientSchedulePage> {
  final searchController = TextEditingController();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    context.read<PatientScheduleBloc>().add(
          const PatientScheduleEvent.getPatientSchedule(),
        );
    super.initState();
  }

  // void createRmPatientTap(int patientScheduleId, DateTime scheduleTime,
  //     String complaint, int doctorId, Patient patient) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => CreateMedicalRecordDialog(
  //       doctorId: doctorId,
  //       patient: patient,
  //       patientScheduleId: patientScheduleId,
  //       scheduleTime: scheduleTime,
  //       complaint: complaint,
  //     ),
  //   );
  // }

  void createPayment(
    // PatientSchedule schedulePatient,
    //int patientScheduleId,
    int totalPrice,
    //int patientId,
  ) {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => ConfirmPaymentPage(
    //     //patientId: patientId,
    //     //schedulePatientId: patientScheduleId,
    //     schedulePatient: schedulePatient,
    //     totalPrice: totalPrice,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: BuildAppBar(
            title: 'Jadwal Pasien',
            withSearchInput: true,
            searchController: searchController,
            // searchChanged: (value) {
            //   searchResult = patients
            //       .where((element) => element.nama
            //           .toLowerCase()
            //           .contains(searchController.text.toLowerCase()))
            //       .toList();
            //   setState(() {});
            // },
            searchHint: 'Cari Pasien',
          ),
        ),
        endDrawer: Drawer(
          width: context.deviceWidth / 1.25,
          child: const SizedBox(),
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
                const SpaceWidth(40.0),
                Badge(
                  backgroundColor: PasientStatus.onHold.color,
                  smallSize: 18.0,
                ),
                const SpaceWidth(4.0),
                Text(PasientStatus.onHold.value),
                const SpaceWidth(40.0),
                Badge(
                  backgroundColor: PasientStatus.completed.color,
                  smallSize: 18.0,
                ),
                const SpaceWidth(4.0),
                Text(PasientStatus.completed.value),
              ],
            ),
            const SpaceHeight(40.0),
            BlocBuilder<PatientScheduleBloc, PatientScheduleState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  succes: (patients) {
                    return Container(
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
                                  label: 'Keluhan',
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
                                  label: 'Jenis Kelamin',
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
                            DataColumn(
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Button.filled(
                                  onPressed: () {},
                                  label: 'Status',
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
                                  label: 'Action',
                                  width: null,
                                  color: AppColors.title,
                                  textColor: AppColors.black.withOpacity(0.5),
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                          rows: patients
                              .map(
                                (patient) => DataRow(cells: [
                                  DataCell(Text(patient.patient!.name ?? '')),
                                  DataCell(Text(
                                      '${patient.complaint!.length > 10 ? patient.complaint!.substring(0, 10) : patient.complaint}')),
                                  DataCell(Text(patient.patient!.gender ?? '')),
                                  DataCell(Text(patient.patient!.birthDate!
                                      .toFormattedDate())),
                                  DataCell(Text(patient.patient!.nik ?? '')),
                                  DataCell(ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: ColoredBox(
                                      color: Colors.grey.withOpacity(0.2),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 8.0),
                                        child: Text(
                                          patient.status ?? '',
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                                  DataCell(
                                    PopupMenuButton<PasientStatus>(
                                      offset: const Offset(0, 50),
                                      icon: Center(
                                        child: const Icon(Icons.more_horiz),
                                      ),
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<PasientStatus>>[
                                        const PopupMenuItem<PasientStatus>(
                                          value: PasientStatus.processing,
                                          child: _PopupMenuItemValue(
                                              PasientStatus.processing),
                                        ),
                                        const PopupMenuItem<PasientStatus>(
                                          value: PasientStatus.onHold,
                                          child: _PopupMenuItemValue(
                                              PasientStatus.onHold),
                                        ),
                                        const PopupMenuItem<PasientStatus>(
                                          value: PasientStatus.waiting,
                                          child: _PopupMenuItemValue(
                                              PasientStatus.waiting),
                                        ),
                                        const PopupMenuItem<PasientStatus>(
                                          value: PasientStatus.completed,
                                          child: _PopupMenuItemValue(
                                              PasientStatus.completed),
                                        ),
                                        const PopupMenuItem<PasientStatus>(
                                          value: PasientStatus.rejected,
                                          child: _PopupMenuItemValue(
                                              PasientStatus.rejected),
                                        ),
                                      ],
                                      // onSelected: (PasientStatus value) {
                                      //   if (value == PasientStatus.processing) {
                                      //     createRmPatientTap(
                                      //         patient.id!,
                                      //         patient.scheduleTime!,
                                      //         patient.complaint!,
                                      //         patient.doctorId!,
                                      //         patient.patient!);
                                      //   } else if (value ==
                                      //       PasientStatus.completed) {
                                      //     createPayment(
                                      //       patient,
                                      //       patient.totalPrice ?? 0,
                                      //     );
                                      //   } else {
                                      //     scaffoldkey.currentState!
                                      //         .openEndDrawer();
                                      //   }
                                      // },
                                    ),
                                  )
                                ]),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  },
                  orElse: () => const SizedBox(),
                );
              },
            ),
          ],
        ),
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
