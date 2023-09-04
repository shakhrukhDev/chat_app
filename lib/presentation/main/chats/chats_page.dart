import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegramm_clone/constants/app_color.dart';
import 'package:telegramm_clone/constants/app_icon.dart';
import 'package:telegramm_clone/constants/app_images.dart';
import 'package:telegramm_clone/constants/routes/app_routes.dart';
import 'package:telegramm_clone/constants/routes/routes_name.dart';
import 'package:telegramm_clone/constants/widgets/text_styles.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final TextEditingController _textEditingController = TextEditingController();

  final nameController = TextEditingController();

  final emailController = TextEditingController();
  List<QueryDocumentSnapshot> users = [];




  @override
  Widget build(BuildContext context) {
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.blue,
          toolbarHeight: 135.h,
          automaticallyImplyLeading: false,
          title: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: const BorderSide(color: AppColors.white)),
                hintText: 'Search by name, number...',
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search_rounded))),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r)),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20.h),
            child: Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: TabBar(
                tabs: [
                  Text(
                    "Chats",
                    style: AppStyle.inter18xW500White,
                  ),
                  Text(
                    "Calls",
                    style: AppStyle.inter18xW500White,
                  )
                ],
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('client')
                      .snapshots(),
                  builder: (context, snapshot) {
                    List<ListTile> clientWidgets = [];
                    if (snapshot.hasData) {
                      users = snapshot.data!.docs.reversed.toList();
                    }else{
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Expanded(
                      child: ListView(
                        children: List.generate(
                          users.length,
                              (index) => ListTile(
                            onTap: (){
                              Navigator.pushNamed(context, RoutesName.chatDetail,arguments: users[index]['name']);
                            },
                            leading: const CircleAvatar(),
                            title: Text(users[index]['name']),
                            subtitle: Text(users[index]['email']),
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.blue,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isDismissible: true,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 350.h,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 12.h),

                            SizedBox(height: 12.h,),
                            TextFormField(

                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your name';
                                }
                              },
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "Name",
                                hintText: "Enter your name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r)),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your name';
                                }
                              },
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "Enter your email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r)),
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 48),
                                  backgroundColor: AppColors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  )),
                              onPressed: () {
                                CollectionReference collRef = FirebaseFirestore.instance.collection('client');
                                collRef.add({
                                  'name' : nameController.text,
                                  'email' : emailController.text});
                                nameController.clear();
                                emailController.clear();
                              },
                              autofocus: true, child: Text("Add users", style: AppStyle.inter16xW400White,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: SvgPicture.asset(
            AppIcons.addIcon,
          ),
        ),
      ),
    );
  }
}
