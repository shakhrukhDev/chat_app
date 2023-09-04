import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegramm_clone/constants/app_color.dart';
import 'package:telegramm_clone/constants/app_icon.dart';
import 'package:telegramm_clone/constants/widgets/text_styles.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final CollectionReference user =
  FirebaseFirestore.instance.collection('user');

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _phoneController.text = documentSnapshot['phone'].toString();
    }
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20.w,
                left: 20.w,
                right: 20.w,
                bottom: MediaQuery
                    .of(ctx)
                    .viewInsets
                    .bottom + 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone number'),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ElevatedButton(
                  child: Text("Update"),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final int? phone =
                    int.tryParse(_phoneController.text.toString());
                    if (phone != null) {
                      await user
                          .doc(documentSnapshot!.id)
                          .update({"name": name, "phone": phone});
                      _nameController.text = '';
                      _phoneController.text = '';
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> create([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _phoneController.text = documentSnapshot['phone'].toString();
    }
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20.w,
                left: 20.w,
                right: 20.w,
                bottom: MediaQuery
                    .of(ctx)
                    .viewInsets
                    .bottom + 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone number'),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ElevatedButton(
                  child: Text("add user"),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final int? phone =
                    int.tryParse(_phoneController.text.toString());
                    if (phone != null) {
                      await user.add({"name": name, "phone": phone});
                      _nameController.text = '';
                      _phoneController.text = '';
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> delete(String userId) async {
    await user.doc(userId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You have successfully deleted a users")));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => create(),
        ),
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
              padding: EdgeInsets.only(
                bottom: 12.w,
                left: 6.w,
              ),
              child: TabBar(
                tabs: [
                  Text(
                    "Contacts",
                    style: AppStyle.inter18xW500White,
                  ),
                  Spacer(),
                  SvgPicture.asset(AppIcons.item1Icon)
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
        body: StreamBuilder(
            stream: user.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return Card(
                      margin: EdgeInsets.all(10.w),
                      child: ListTile(
                        leading: SvgPicture.asset(AppIcons.userEditIcon),
                        title: Text(documentSnapshot['name']),
                        subtitle: Text(documentSnapshot['phone'].toString()),
                        trailing: SizedBox(
                          width: 100.w,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () => update(documentSnapshot)),

                              IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => delete(documentSnapshot.id)),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
