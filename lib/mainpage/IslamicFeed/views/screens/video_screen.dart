import 'package:flutter/material.dart';
import 'package:islamicapp/mainpage/IslamicFeed/views/screens/add_video_screen.dart';
import 'package:islamicapp/mainpage/IslamicFeed/views/screens/profile_screen.dart';
import '../../constants.dart';
import '../../controllers/video_controller.dart';
import '../../views/screens/comment_screen.dart';
import '../../views/widgets/circle_animation.dart';
import '../../views/widgets/video_player_iten.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final VideoController videoController = Get.put(VideoController());

  buildProfile(String profilePhoto, String uid, BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        Positioned(
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileScreen(uid: uid),
              )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  buildMusicAlbum(String profilePhoto, BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(11),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddVideoScreen(),
                )),
              ),
            ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(25),
            //   child: Image(
            //     image: NetworkImage(profilePhoto),
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController _searchController = TextEditingController();
    String search;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(22, 22, 22, .2)),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        title: Expanded(
          child: Row(
            children: const [
              Text(
                'Following',
                style: TextStyle(fontSize: 18, color: Color(0xff9D9D9D)),
              ),
              VerticalDivider(
                color: Colors.white,
              ),
              Text('WorldWide',
                  style: TextStyle(color: Colors.white, fontSize: 18))
            ],
          ),
        ),
        // actions: [
        //   Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //     height: 48,
        //     width: 48,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       color: Color.fromRGBO(22, 22, 22, .2)
        //     ),
        //     child: Icon(Icons.menu,color: Colors.white,),
        //   ),
        // ),
        // ],
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.black,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(120),
                            ),
                            fillColor: Colors.grey,
                            filled: true,
                            // suffixIcon: Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Container(
                            //     width: 44,
                            //     height: 44,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(40),
                            //         color: Color(0xff3F48CC)),
                            //     child: IconButton(
                            //       icon: Icon(Icons.search),
                            //       onPressed: () => {},
                            //       color: Colors.white,
                            //     ),
                            //   ),
                            // ),
                            contentPadding:
                                const EdgeInsets.only(top: 20, left: 20),
                            hintText: 'Please Search',
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Gilroy',
                            ),
                          ),
                          onChanged: (text) {
                            setState(() {
                              search = text;
                            });
                          },
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),

                        // child: Container(
                        //   width: 44,
                        //   height: 44,
                        //   decoration: BoxDecoration(
                        //       color: Colors.grey,
                        //       borderRadius: BorderRadius.circular(110)),
                        //   child: IconButton(
                        //       onPressed: () {},
                        //       icon: Icon(
                        //         Icons.close,
                        //         color: Colors.white,
                        //       )),
                        // ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: ListTile(
                      leading: Image.asset(
                        'assets/home.png',
                        height: 25,
                        width: 25,
                      ),
                      title: const Text(
                        "Home",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ListTile(
                      leading: Image.asset('assets/p.png'),
                      title: const Text(
                        "Posts",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const ListTile(
                      leading: Icon(Icons.email, color: Colors.white),
                      title: Text(
                        "Inbox",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ListTile(
                      leading: Image.asset('assets/pp.png'),
                      title: const Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ListTile(
                      leading: Image.asset(
                        'assets/radioss.png',
                        height: 25,
                        width: 25,
                      ),
                      title: const Text(
                        "Following",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ListTile(
                      leading: Image.asset(
                        'assets/world.png',
                        height: 25,
                        width: 25,
                      ),
                      title: const Text(
                        "Worldwide",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Obx(() {
        return PageView.builder(
          // itemCount: 10,
          itemCount: videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            return Stack(
              children: [
                VideoPlayerItem(
                  videoUrl: data.videoUrl,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      buildProfile(
                                          data.profilePhoto, data.uid, context),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        data.username,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    data.caption,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.music_note,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        data.songName,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(top: size.height / 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // buildProfile(
                                //     data.profilePhoto, data.uid, context),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          videoController.likeVideo(data.id),
                                      child: Icon(
                                        Icons.favorite_outline,
                                        size: 40,
                                        color: data.likes.contains(
                                                firebaseAuth.currentUser!.uid)
                                            // authController.user.uid)
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      data.likes.length.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () => Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CommentScreen(
                                                  id: data.id,
                                                ),
                                              ),
                                            ),
                                        child: Image.asset('assets/mess.png')),
                                    const SizedBox(height: 7),
                                    Text(
                                      data.commentCount.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {},
                                        child: Image.asset('assets/ss.png')),
                                    const SizedBox(height: 7),
                                    Text(
                                      data.shareCount.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                buildMusicAlbum(data.profilePhoto, context),
                                // CircleAnimation(
                                //   child: buildMusicAlbum(
                                //       data.profilePhoto, context),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
