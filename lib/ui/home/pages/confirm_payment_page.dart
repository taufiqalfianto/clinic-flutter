import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../../data/datasources/midtrans_remote_datasource.dart';
import '../bloc/qris/qris_bloc.dart';
import '../dialogs/success_payment_dialog.dart';
import '../models/product_model.dart';
import '../widgets/order_menu.dart';

enum PaymentType { qris, cash }

class ConfirmPaymentPage extends StatefulWidget {
  const ConfirmPaymentPage({super.key});

  @override
  State<ConfirmPaymentPage> createState() => _ConfirmPaymentPageState();
}

class _ConfirmPaymentPageState extends State<ConfirmPaymentPage> {
  final noteController = TextEditingController();
  final totalPriceController = TextEditingController();
  PaymentType paymentType = PaymentType.qris;
  final products = [
    ProductModel(
        image: Assets.images.products.paracetamol.path,
        name: 'Tindakan Perawatan',
        price: 25000,
        stock: 10),
    ProductModel(
        image: Assets.images.products.sarungTanganMedis.path,
        name: 'Konsultasi Doktor',
        price: 20000,
        stock: 10),
  ];

  String orderId = '';
  Timer? timer;

  final MidtransRemoteDatasource midtransRemoteDatasource =
      MidtransRemoteDatasource();

  @override
  void initState() {
    orderId = DateTime.now().millisecondsSinceEpoch.toString();
    context.read<QrisBloc>().add(QrisEvent.generateQRCode(
          orderId,
          45000,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Konfirmasi',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Orders #1',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SpaceHeight(8.0),
                      const Divider(),
                      const SpaceHeight(24.0),
                      const Row(
                        children: [
                          Text(
                            'Item',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 80.0,
                            child: Text(
                              'Price',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SpaceHeight(8),
                      const Divider(),
                      const SpaceHeight(8),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            OrderMenu(data: products[index]),
                        separatorBuilder: (context, index) =>
                            const SpaceHeight(16.0),
                        itemCount: products.length,
                      ),
                      const SpaceHeight(8),
                      const Divider(),
                      const SpaceHeight(8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(color: AppColors.subtitle),
                          ),
                          Text(
                            'Rp. 45.000',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SpaceHeight(24),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pembayaran',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            '2 opsi pembayaran tersedia',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SpaceHeight(8.0),
                          const Divider(),
                          const SpaceHeight(8.0),
                          const Text(
                            'Metode Bayar',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SpaceHeight(12.0),
                          Row(
                            children: [
                              paymentType == PaymentType.qris
                                  ? Button.filled(
                                      width: null,
                                      height: 64.0,
                                      onPressed: () => setState(
                                          () => paymentType = PaymentType.qris),
                                      label: 'QRIS',
                                    )
                                  : Button.outlined(
                                      width: null,
                                      height: 64.0,
                                      onPressed: () => setState(
                                          () => paymentType = PaymentType.qris),
                                      label: 'QRIS',
                                    ),
                              const SpaceWidth(16.0),
                              paymentType == PaymentType.cash
                                  ? Button.filled(
                                      width: null,
                                      height: 64.0,
                                      onPressed: () => setState(
                                          () => paymentType = PaymentType.cash),
                                      label: 'Cash',
                                      style: paymentType == PaymentType.cash
                                          ? ButtonStyleType.filled
                                          : ButtonStyleType.outlined,
                                    )
                                  : Button.outlined(
                                      width: null,
                                      height: 64.0,
                                      onPressed: () => setState(
                                          () => paymentType = PaymentType.cash),
                                      label: 'Cash',
                                      style: paymentType == PaymentType.cash
                                          ? ButtonStyleType.filled
                                          : ButtonStyleType.outlined,
                                    ),
                            ],
                          ),
                          const SpaceHeight(8.0),
                          const Divider(),
                          const SpaceHeight(8.0),
                          if (paymentType == PaymentType.qris) ...[
                            BlocConsumer<QrisBloc, QrisState>(
                              listener: (context, state) {
                                state.maybeWhen(orElse: () {
                                  return;
                                }, qrisResponse: (data) {
                                  const onSec = Duration(seconds: 5);
                                  timer = Timer.periodic(onSec, (timer) {
                                    context
                                        .read<QrisBloc>()
                                        .add(QrisEvent.checkPaymentStatus(
                                          orderId,
                                        ));
                                  });
                                }, success: (message) {
                                  timer?.cancel();

                                  context.pop();
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) =>
                                        const SuccessPaymentDialog(),
                                  );
                                });
                              },
                              builder: (context, state) {
                                return state.maybeWhen(
                                  orElse: () {
                                    return const SizedBox();
                                  },
                                  qrisResponse: (data) {
                                    return Container(
                                      width: 256.0,
                                      height: 256.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Image.network(
                                          data.actions!.first.url!,
                                        ),
                                      ),
                                    );
                                  },
                                  loading: () {
                                    return Container(
                                      width: 256.0,
                                      height: 256.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.white,
                                      ),
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ] else if (paymentType == PaymentType.cash) ...[
                            const Text(
                              'Total Bayar',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SpaceHeight(12.0),
                            TextFormField(
                              controller: totalPriceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                hintText: 'Total harga',
                              ),
                            ),
                          ],
                          const SpaceHeight(100.0),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ColoredBox(
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 16.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: Button.outlined(
                                  onPressed: () => context.pop(),
                                  label: 'Batalkan',
                                ),
                              ),
                              const SpaceWidth(8.0),
                              Flexible(
                                child: Button.filled(
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) =>
                                          const SuccessPaymentDialog(),
                                    );
                                  },
                                  label: paymentType == PaymentType.qris
                                      ? 'Scan QRIS'
                                      : 'Bayar',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
