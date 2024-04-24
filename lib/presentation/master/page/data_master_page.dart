import 'package:fic15/presentation/master/page/doctor_schedule_page.dart';
import 'package:fic15/presentation/master/page/service_medicine_page.dart';
import 'package:flutter/material.dart';

import '../../../components/button_menu.dart';
import '../../../components/components.dart';
import '../../../core/core.dart';
import 'data_doctor_page.dart';
import 'data_patient_page.dart';

class DataMasterPage extends StatelessWidget {
  final void Function(int index) onTap;

  const DataMasterPage({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Center(
            child: Text(
              'Data Master',
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 80.0, vertical: 110.0),
          child: Wrap(
            children: [
              ButtonMenu(
                label: 'Data Dokter',
                iconPath: Assets.images.menu.data.path,
                onPressed: () {
                  context.push(const DataDoctorPage());
                },
              ),
              const SpaceWidth(45.0),
              ButtonMenu(
                label: 'Data Pasien',
                iconPath: Assets.images.menu.data.path,
                onPressed: () {
                  context.push(const DataPasientPage());
                },
              ),
              const SpaceWidth(45.0),
              ButtonMenu(
                label: 'Jadwal Dokter',
                iconPath: Assets.images.menu.jadwal.path,
                onPressed: () {
                  context.push(const DoctorSchedulePage());
                },
              ),
              const SpaceWidth(45.0),
              ButtonMenu(
                label: 'Layanan',
                iconPath: Assets.images.menu.layanan.path,
                onPressed: () {
                  context.push(const ServiceMedicinePage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
