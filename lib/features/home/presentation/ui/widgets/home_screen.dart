import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:student_management/features/addpage/presentation/ui/widgets/add_screen1.dart';
import 'package:student_management/features/detail/presentation/ui/widgets/detail_screen.dart';
import 'package:student_management/features/home/presentation/state/provider_add_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, homepageprovider, child) => Scaffold(
        // extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey.shade900,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddScreen1(),
            ));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          forceMaterialTransparency: true,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.transparent,
          title: const Text('Student details'),
          bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 60),
              child: Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 8, left: 8, bottom: 5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: TextField(
                    controller: homepageprovider.searchcontroller,
                    onChanged: (value) {
                      homepageprovider.onsearch(value);
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(40)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              homepageprovider.searchbarclosebutton();
                            },
                            icon: const Icon(Icons.close)),
                        hintText: 'Search here'),
                  ),
                ),
              )),
        ),
        body: homepageprovider.filterlist.isEmpty
            ? Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Lottie.asset('assets/lotties/empty.json'),
                  const Text('Nothing found')
                ],
              )
            : ListView.builder(
                itemCount: homepageprovider.filterlist.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          sd: homepageprovider.filterlist[index],
                        ),
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey.shade200),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              radius: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child:
                                    homepageprovider.filterlist[index].image !=
                                            null
                                        ? Image.file(
                                            fit: BoxFit.cover,
                                            width: 80,
                                            File(homepageprovider
                                                .filterlist[index].image!))
                                        : Image.asset(
                                            width: 80,
                                            height: 80,
                                            'assets/images/no_image_found.png'),
                              )),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  homepageprovider.filterlist[index].name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
