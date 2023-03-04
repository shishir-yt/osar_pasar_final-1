import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/category.dart';
import '../repo/category_repo.dart';

class ItemController extends GetxController {
  RxList<CategoryItem> category = RxList();
  List<String> categories = [];
  Items? items;
  RxBool loading = false.obs;
  String name = "";
  @override
  void onInit() {
    getAllCatgegory();
    super.onInit();
  }

  getAllCatgegory() async {
    log("yhea samma aayo ");
    loading.value = true;
    await CategoryRepo.getCategory(onSuccess: (categories) {
      loading.value = false;
      category.addAll(categories);
    }, onError: (message) {
      loading.value = false;
    });
  }

  showCategory() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45.0),
        ),
      ),
      context: Get.context!,
      builder: ((context) => SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 63,
                  ),
                  const Text("Add Item"),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 55,
                    child: DropdownButtonFormField(
                      icon: const Visibility(
                          visible: false, child: Icon(Icons.arrow_downward)),
                      alignment: AlignmentDirectional.bottomCenter,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          border: const OutlineInputBorder(
                            gapPadding: 1,
                            borderSide:
                                BorderSide(color: Color(0xfffD9D9D9), width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          suffix: const Text(""),
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                          filled: true,
                          hintStyle: Get.theme.textTheme.bodyMedium,
                          hintText: "Select Province",
                          fillColor: Colors.white),
                      onChanged: (value) {
                        name = value.toString();
                      },
                      itemHeight: 48,
                      items: category
                          .map(
                            (cityTitle) => DropdownMenuItem(
                              value: cityTitle,
                              child: SizedBox(
                                height: 30,
                                child: Text(
                                  "${cityTitle.name}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 46, right: 35, left: 35),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: const Color(0xff00183F),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        log(name.toString());
                      },
                      child: const Text("Continue"),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

// SizedBox(
//             height: 300,
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: c.category.length,
//                 itemBuilder: (context, index) {
//                   CategoryItem category = c.category[index];
//                   return Text(
//                     category.name ?? "",
//                     style: const TextStyle(color: Colors.black),
//                   );
//                 }),

//           )