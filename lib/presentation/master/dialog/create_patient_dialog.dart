import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../components/components.dart';
import '../../../components/custom_date_picker.dart';
import '../../../components/custom_dropdown.dart';
import '../../../core/core.dart';
import '../../../data/models/request/add_patients_request_model.dart';
import '../../../data/models/response/satu sehat/cities_response_model.dart';
import '../../../data/models/response/satu sehat/province_response_model.dart';
import '../../../data/models/response/satu sehat/wilayah_response_model.dart';
import '../../dashboard/page/dashboard_page.dart';
import '../bloc/add_patients/add_patients_bloc.dart';
import '../bloc/cities/cities_bloc.dart';
import '../bloc/districts/districts_bloc.dart';
import '../bloc/province/province_bloc.dart';
import '../bloc/subdistricts/subdistricts_bloc.dart';

class CreatePatientDialog extends StatefulWidget {
  const CreatePatientDialog({
    super.key,
  });

  @override
  State<CreatePatientDialog> createState() => _CreatePatientDialogState();
}

class _CreatePatientDialogState extends State<CreatePatientDialog> {
  final genders = ['Laki-laki', 'Perempuan'];
  final marital_status = ['Menikah', 'Lajang', 'Cerai'];

  String? selectedGender;
  City? selectCity;
  Province? selectProvince;
  Wilayah? selectDistricts;
  Wilayah? selectSubDistricts;
  String? selectMaritalStatus;
  int? isDeceased = 0;
  DateTime? birthDate;

  late TextEditingController patientNameController;
  late TextEditingController nikController;
  late TextEditingController kkController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController birthPlaceController;
  late TextEditingController addressController;
  late TextEditingController cityCodeController;
  late TextEditingController provinceCodeController;
  late TextEditingController districtCodeController;
  late TextEditingController villageCodeController;
  late TextEditingController rtController;
  late TextEditingController rwController;
  late TextEditingController postalCodeController;
  late TextEditingController relationshipNameController;
  late TextEditingController relationshipPhoneController;

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    final String formattedDate = formatter.format(date);

    return formattedDate;
  }

  @override
  void initState() {
    context.read<ProvinceBloc>().add(const ProvinceEvent.getProvince());
    super.initState();
    selectedGender = null;
    patientNameController = TextEditingController();
    nikController = TextEditingController();
    kkController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    birthPlaceController = TextEditingController();
    addressController = TextEditingController();
    cityCodeController = TextEditingController();
    provinceCodeController = TextEditingController();
    districtCodeController = TextEditingController();
    villageCodeController = TextEditingController();
    rtController = TextEditingController();
    rwController = TextEditingController();
    postalCodeController = TextEditingController();
    relationshipNameController = TextEditingController();
    relationshipPhoneController = TextEditingController();
  }

  @override
  void dispose() {
    patientNameController.dispose();
    nikController.dispose();
    kkController.dispose();
    phoneController.dispose();
    emailController.dispose();
    birthPlaceController.dispose();
    addressController.dispose();
    cityCodeController.dispose();
    provinceCodeController.dispose();
    districtCodeController.dispose();
    villageCodeController.dispose();
    rtController.dispose();
    rwController.dispose();
    postalCodeController.dispose();
    relationshipNameController.dispose();
    relationshipPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: context.deviceWidth / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detail Pasien',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: AppColors.darkGrey,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: nikController,
                  label: 'NIK',
                  labeltext: 'NIK',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: kkController,
                  label: 'KK',
                  labeltext: 'KK',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: patientNameController,
                  label: 'Nama Pasien',
                  labeltext: 'Nama Pasien',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: phoneController,
                  label: 'Nomor Handphone',
                  labeltext: 'Nomor Handphone',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: emailController,
                  label: 'Email',
                  labeltext: 'Email',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomDropdown(
                  value: selectedGender,
                  items: genders,
                  label: 'Jenis Kelamin',
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: birthPlaceController,
                  label: 'Tempat Lahir',
                  labeltext: 'Tempat Lahir',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomDatePicker(
                  initialDate: birthDate,
                  label: 'Tanggal Lahir',
                  showLabel: false,
                  onDateSelected: (selectedDate) {
                    setState(() {
                      birthDate = selectedDate;
                    });
                  },
                ),
                const SpaceHeight(24.0),
                Row(
                  children: [
                    const Text('Status Kematian'),
                    const Spacer(),
                    Switch(
                      value: isDeceased == 1,
                      onChanged: (value) {
                        setState(() {
                          isDeceased = value ? 1 : 0;
                        });
                      },
                    ),
                  ],
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: addressController,
                  label: 'Alamat Lengkap',
                  labeltext: 'Alamat Lengkap',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                BlocBuilder<ProvinceBloc, ProvinceState>(
                  builder: (context, state) => state.maybeWhen(
                    orElse: () {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    succes: (data) {
                      return CustomDropdown(
                        value: selectProvince,
                        items: data,
                        label: 'Provinsi',
                        onChanged: (value) {
                          context.read<CitiesBloc>().add(
                                CitiesEvent.getCities(
                                  int.parse(value!.code ?? '0'),
                                ),
                              );
                          setState(() {
                            selectProvince = value;
                          });
                        },
                        showLabel: false,
                      );
                    },
                  ),
                ),
                const SpaceHeight(24.0),
                BlocBuilder<CitiesBloc, CitiesState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return CustomDropdown(
                          value: selectCity,
                          items: const [],
                          label: 'Kota/Kabupaten',
                          onChanged: (value) {},
                          showLabel: false,
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      succes: (data) {
                        return CustomDropdown(
                          value: selectCity,
                          items: data,
                          label: 'Kota/Kabupaten',
                          onChanged: (value) {
                            context.read<DistrictsBloc>().add(
                                  DistrictsEvent.getDistricts(
                                      int.parse(value!.code ?? '0')),
                                );
                            setState(() {
                              selectCity = value;
                            });
                          },
                          showLabel: false,
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(24.0),
                BlocBuilder<DistrictsBloc, DistrictsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return CustomDropdown(
                          value: selectDistricts,
                          items: const [],
                          label: 'Kecamatan',
                          onChanged: (value) {},
                          showLabel: false,
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      succes: (data) {
                        return CustomDropdown(
                          value: selectDistricts,
                          items: data,
                          label: 'Kecamatan',
                          onChanged: (value) {
                            context.read<SubdistrictsBloc>().add(
                                  SubdistrictsEvent.getSubDistricts(
                                    int.parse(value!.code.toString()),
                                  ),
                                );
                            setState(() {
                              selectDistricts = value;
                            });
                          },
                          showLabel: false,
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(24.0),
                BlocBuilder<SubdistrictsBloc, SubdistrictsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return CustomDropdown(
                          value: selectSubDistricts,
                          items: const [],
                          label: 'Desa/Kelurahan',
                          onChanged: (value) {},
                          showLabel: false,
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      succes: (data) {
                        return CustomDropdown(
                          value: selectSubDistricts,
                          items: data,
                          label: 'Desa/Kelurahan',
                          onChanged: (value) {
                            setState(() {
                              selectSubDistricts = value;
                            });
                          },
                          showLabel: false,
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: rtController,
                  label: 'RT',
                  labeltext: 'RT',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: rwController,
                  label: 'RW',
                  labeltext: 'RW',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: postalCodeController,
                  label: 'Kode Pos',
                  labeltext: 'Kode Pos',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomDropdown(
                  value: selectMaritalStatus,
                  items: marital_status,
                  label: 'Status Pernikahan',
                  onChanged: (value) {
                    selectMaritalStatus = value;
                  },
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: relationshipNameController,
                  label: 'Nama Pasangan',
                  labeltext: 'Nama Pasangan',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: relationshipPhoneController,
                  label: 'Nomor Handphone Pasangan',
                  labeltext: 'Nomor Handphone Pasangan',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                Row(
                  children: [
                    Flexible(
                      child: Button.outlined(
                        onPressed: () => context.pop(),
                        label: 'Cancel',
                      ),
                    ),
                    const SpaceWidth(10.0),
                    Flexible(
                      child: BlocListener<AddPatientsBloc, AddPatientsState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {},
                            succes: () {
                              //snackbar success
                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.success(
                                  message: "Data Pasien Berhasil Ditambahkan",
                                ),
                              );
                              context.pushReplacement(
                                const DashboardPage(),
                              );
                            },
                          );
                        },
                        child: BlocBuilder<AddPatientsBloc, AddPatientsState>(
                          builder: (context, state) {
                            return state.maybeWhen(orElse: () {
                              return Button.filled(
                                onPressed: () {
                                  final addPatientRequetData =
                                      AddPatientRequestModel(
                                    nik: nikController.text,
                                    kk: kkController.text,
                                    name: patientNameController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    gender: selectedGender,
                                    birthPlace: birthPlaceController.text,
                                    birthDate: formatDate(birthDate!),
                                    addressLine: addressController.text,
                                    city: selectCity?.name,
                                    cityCode: selectCity?.code,
                                    province: selectProvince?.name,
                                    provinceCode: selectProvince?.code,
                                    district: selectDistricts?.name,
                                    districtCode: selectDistricts?.code,
                                    village: selectSubDistricts?.name,
                                    villageCode: selectSubDistricts?.code,
                                    rt: rtController.text,
                                    rw: rwController.text,
                                    postalCode: postalCodeController.text,
                                    maritalStatus: selectMaritalStatus,
                                    relationshipName:
                                        relationshipNameController.text,
                                    relationshipPhone:
                                        relationshipPhoneController.text,
                                    isDeceased: isDeceased,
                                  );
                                  context.read<AddPatientsBloc>().add(
                                        AddPatientsEvent.addPatient(
                                            addPatientRequetData),
                                      );
                                },
                                label: 'Create Patient',
                              );
                            }, loading: () {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
