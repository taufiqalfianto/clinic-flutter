import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/buttons.dart';
import '../../../components/search_input.dart';
import '../../../components/spaces.dart';
import '../../../core/core.dart';
import '../../dummy/widgets/build_app_bar.dart';
import '../bloc/service_medicine/service_medicine_bloc.dart';

class ServiceMedicinePage extends StatefulWidget {
  const ServiceMedicinePage({super.key});

  @override
  State<ServiceMedicinePage> createState() => _ServiceMedicinePageState();
}

class _ServiceMedicinePageState extends State<ServiceMedicinePage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<ServiceMedicineBloc>().add(
          const ServiceMedicineEvent.getservicemedicine(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Data Master Layanan & Obat',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Padding(
            padding: EdgeInsets.only(right: context.deviceWidth / 2),
            child: SearchInput(
              controller: searchController,
              // onChanged: (value) {
              //   if (searchController.text.length > 1 &&
              //       searchController.text.isNotEmpty) {
              //     context.read<ServiceMedicineBloc>().add(
              //         ServiceMedicineEvent.getservicemedicinebyname(
              //             searchController.text));
              //   } else {}
              // },
              hintText: 'Cari Data Item',
            ),
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
              child: BlocBuilder<ServiceMedicineBloc, ServiceMedicineState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    loading: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    succes: (service) {
                      return Center(
                        child: DataTable(
                          dataRowMinHeight: 30.0,
                          columnSpacing: 200,
                          dataRowMaxHeight: 60.0,
                          columns: [
                            DataColumn(
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Button.filled(
                                  onPressed: () {},
                                  label: 'Nama Item',
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
                                  label: 'Kategori',
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
                                  label: 'Harga',
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
                                  label: 'Qty',
                                  width: null,
                                  color: AppColors.title,
                                  textColor: AppColors.black.withOpacity(0.5),
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                          rows: service.isEmpty
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
                              : service
                                  .map(
                                    (product) => DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                            product.name ?? '',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(product.category ?? ''),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(
                                                double.parse(product.price!)
                                                    .toInt()
                                                    .currencyFormatRp),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(product.category ?? ''),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                        ),
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
