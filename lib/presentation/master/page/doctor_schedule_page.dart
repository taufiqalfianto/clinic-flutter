import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/buttons.dart';
import '../../../components/spaces.dart';
import '../../../core/constants/colors.dart';
import '../../dashboard/widget/build_app_bar.dart';
import '../bloc/doctor_schedule/doctor_schedules_bloc.dart';

class DoctorSchedulePage extends StatefulWidget {
  const DoctorSchedulePage({super.key});

  @override
  State<DoctorSchedulePage> createState() => _DoctorSchedulePageState();
}

class _DoctorSchedulePageState extends State<DoctorSchedulePage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<DoctorSchedulesBloc>().add(
          const DoctorSchedulesEvent.getdoctorschedule(),
        );
    super.initState();
  }

  int _sortDays(String a, String b) {
    // Mendefinisikan urutan hari yang diinginkan
    Map<String, int> dayOrder = {
      'Monday': 1,
      'Tuesday': 2,
      'Wednesday': 3,
      'Thursday': 4,
      'Friday': 5,
      'Saturday': 6,
      'Sunday': 7,
    };
    // Mendapatkan indeks masing-masing hari dalam daftar yang diinginkan
    int indexA = dayOrder[a]!;
    int indexB = dayOrder[b]!;
    // Mengembalikan perbandingan berdasarkan indeks
    return indexA.compareTo(indexB);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: BuildAppBar(
          withnavigation: true,
          title: 'Data Jadwal Dokter',
          withSearchInput: true,
          searchController: searchController,
          searchHint: 'Cari Dokter',
          searchChanged: (value) {
            if (searchController.text.isNotEmpty &&
                searchController.text.length > 2) {
              context.read<DoctorSchedulesBloc>().add(
                    DoctorSchedulesEvent.getdoctorschedulebyname(
                        searchController.text),
                  );
            } else {
              context.read<DoctorSchedulesBloc>().add(
                    const DoctorSchedulesEvent.getdoctorschedule(),
                  );
            }
          },
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
              child: BlocBuilder<DoctorSchedulesBloc, DoctorSchedulesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    loading: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    succes: (doctorSchedule) {
                      //daftar hari
                      List<String> days =
                          doctorSchedule.map((e) => e.day!).toSet().toList();

                      days.sort(_sortDays);

                      //kelompokan jadwal dokter berdasarkan nama dokter dan hari

                      Map<String, Map<String, String>> groupedSchedules = {};

                      for (var schedule in doctorSchedule) {
                        if (!groupedSchedules
                            .containsKey(schedule.doctor!.doctorName)) {
                          groupedSchedules[schedule.doctor!.doctorName!] = {
                            for (var day in days) day: '-',
                          };
                        }
                        //mengisi jadwal dokter berdasarkan hari
                        groupedSchedules[schedule.doctor!.doctorName!]![
                            schedule.day!] = schedule.time ?? '-';
                      }

                      //membuat datarow dokter berdasarkan hari
                      List<DataRow> dataRows = [];
                      dataRows = groupedSchedules.entries.map(
                        (entry) {
                          List<DataCell> cells = [
                            DataCell(
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    entry.key,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(doctorSchedule
                                          .firstWhere((element) =>
                                              element.doctor!.doctorName ==
                                              entry.key)
                                          .doctor!
                                          .doctorSpecialist ??
                                      ''),
                                ],
                              ),
                            ),
                            for (String day in days)
                              DataCell(Center(
                                child: Text(
                                    groupedSchedules[entry.key]![day] ?? '-'),
                              )),
                          ];
                          return DataRow(cells: cells);
                        },
                      ).toList();

                      return DataTable(
                        dataRowMinHeight: 30.0,
                        dataRowMaxHeight: 60.0,
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
                          for (String day in days)
                            DataColumn(
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Button.filled(
                                  onPressed: () {},
                                  label: day,
                                  width: null,
                                  color: AppColors.title,
                                  textColor: AppColors.black.withOpacity(0.5),
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                        ],
                        rows: dataRows.isEmpty
                            ? [
                                const DataRow(
                                  cells: [
                                    DataCell(
                                      Row(
                                        children: [
                                          Icon(Icons.highlight_off),
                                          SpaceWidth(4.0),
                                          Text('Data tidak ditemukan..'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                            : dataRows,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
