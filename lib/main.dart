import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/core.dart';
import 'data/datasources/auth_local_datasource.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/datasources/master_remote_datasource.dart';
import 'data/datasources/satusehat_master_wilayah_remote_datasource.dart';
import 'data/datasources/schedule_patient_remote_datasource.dart';
import 'data/midtrans_remote_datasource.dart';
import 'presentation/auth/bloc/login/login_bloc.dart';
import 'presentation/auth/bloc/logout/logout_bloc.dart';
import 'presentation/auth/pages/login_page.dart';
import 'presentation/dashboard/page/dashboard_page.dart';
import 'presentation/dummy/bloc/qris/qris_bloc.dart';
import 'presentation/master/bloc/add_patients/add_patients_bloc.dart';
import 'presentation/master/bloc/add_reservation/add_reservation_bloc.dart';
import 'presentation/master/bloc/cities/cities_bloc.dart';
import 'presentation/master/bloc/data_doctors/data_doctor_bloc.dart';
import 'presentation/master/bloc/data_patients/data_patients_bloc.dart';
import 'presentation/master/bloc/districts/districts_bloc.dart';
import 'presentation/master/bloc/doctor_schedule/doctor_schedules_bloc.dart';
import 'presentation/master/bloc/province/province_bloc.dart';
import 'presentation/master/bloc/service_medicine/service_medicine_bloc.dart';
import 'presentation/master/bloc/subdistricts/subdistricts_bloc.dart';
import 'presentation/patient_schedule/bloc/patient_schedule/patient_schedule_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasourse()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasourse()),
        ),
        BlocProvider(
          create: (context) => QrisBloc(MidtransRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DataDoctorBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DataPatientsBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DoctorSchedulesBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ServiceMedicineBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              ProvinceBloc(SatuSehatMasterWilayahRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              CitiesBloc(SatuSehatMasterWilayahRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              DistrictsBloc(SatuSehatMasterWilayahRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              SubdistrictsBloc(SatuSehatMasterWilayahRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddPatientsBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              AddReservationBloc(SchedulePatientRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              PatientScheduleBloc(SchedulePatientRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Intensive Club batch 15',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.primary,
            ),
          ),
        ),
        home: FutureBuilder(
          future: AuthLocalDataSource().isuserlogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return new Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (snapshot.hasData && snapshot.data == true) {
              return const DashboardPage();
            }
            return const LoginPage();
          },
        ),
      ),
    );
  }
}
