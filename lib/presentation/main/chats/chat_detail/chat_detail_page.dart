
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramm_clone/constants/app_color.dart';

class DetailChatPage extends StatefulWidget {
  const DetailChatPage({super.key, required this.name});

  final String name;

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title:  Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundImage: AssetImage('assets/png_images/user2.jpg'),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(widget.name),
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
              PopupMenuButton(
                itemBuilder: (context) {
                  return List.empty();
                },
              ),
            ],
          ),
        ],
        backgroundColor: AppColors.blue,
        toolbarHeight: 82.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                20.r,
              ),
              bottomRight: Radius.circular(20.r)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                Container(color: Colors.black, height: 80),
                Container(color: Colors.yellow, height: 83),
                Container(color: Colors.red, height: 93),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message',
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.attach_file),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.camera_alt_outlined),
                          ),
                        ],
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.emoji_emotions_outlined),
                      ),
                    ),
                  ),
                ),
                 SizedBox(width: 8.w),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}