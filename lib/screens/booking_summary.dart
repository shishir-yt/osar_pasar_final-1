import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/controller/item_controller.dart';
import 'package:osar_pasar/controller/service_provider_controller.dart';
import 'package:osar_pasar/screens/request.dart';
import 'package:osar_pasar/widgets/custom_text_field.dart';

import '../utils/colors.dart';

class BookingSummary extends StatelessWidget {
  BookingSummary({super.key, required this.from, required this.to});
  String from;
  String to;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  final itemController = Get.find<ItemController>();
  final serviceController = Get.find<ServiceProviderController>();

  @override
  Widget build(BuildContext context) {
    fromController.text = from;
    toController.text = to;
    var textTheme = Theme.of(Get.context!).textTheme;
    var theme = Theme.of(Get.context!);
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Booking Summary",
          style: textTheme.titleLarge!
              .copyWith(fontSize: 16, color: AppColors.textColor),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(" ${serviceController.selectedServiceProvider.value.name}"),
              // const Text("serviceprovider@gmail.com"),
              const SizedBox(
                height: 27,
              ),
              CustomTextField(
                readOnly: true,
                // initial: "Street No-7, Lakeside, Pokhara",
                controller: fromController,
              ),
              const SizedBox(
                height: 9,
              ),
              const Center(child: Text("To")),
              const SizedBox(
                height: 9,
              ),
              CustomTextField(
                readOnly: true,
                // initial: "Street No-7, Lakeside, Pokhara",
                controller: toController,
              ),
              const SizedBox(
                height: 27,
              ),
              const Text("Item Summary"),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: itemController.selectedItems.value.map((e) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(e.name ?? ""),
                        ),
                        Text(e.itemCount.toString()),
                      ],
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 46, right: 35, left: 35),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: const Color(0xff00183F),
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {
            Get.snackbar(
              'Request Sent Successfully',
              'We will get back to you soon!',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );

            Get.to(
              () => RequestScreen(),
            );
          },
          child: const Text("Send Request"),
        ),
      ),
    );
  }
}
