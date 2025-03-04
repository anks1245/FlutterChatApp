
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_application/models/compliment_model.dart';
import 'package:flutter_chat_application/models/story_model.dart';
import 'package:flutter_chat_application/services/ApiService.dart';
import 'package:flutter_chat_application/widgets/compliment_widget.dart';
import 'package:flutter_chat_application/widgets/shimmer_loader.dart';
import 'package:flutter_chat_application/widgets/shimmer_stories_loader.dart';

class ComplimentsScreen extends StatefulWidget {
  @override
  _ComplimentScreen createState() => _ComplimentScreen();
}

class _ComplimentScreen extends State<ComplimentsScreen> {

  final ApiService _apiService = ApiService();
  List<StoryModel>? stories;
  List<ComplimentModel>? compliments;
  int selectedIndex = 0;
  bool isStoryLoading = true;
  bool isComplimentLoading = true;

  Future<void> _fetchData() async {
    try {
      List<StoryModel> data = await _apiService.fetchStories();
      setState(() {
        stories = data;
        _fetchCompliments(data[0].id);
        isStoryLoading = false;
      });
    }catch(e){
      setState(() {
        isStoryLoading = false;
        print("Error $e");
      });
    }
  }

  Future<void> _fetchCompliments(String storyId) async {
    try {
      List<ComplimentModel> data = await _apiService.fetchCompliments(storyId);
      setState(() {
        compliments = data;
        isComplimentLoading = false;
      });
    }catch(e){
      setState(() {
        isComplimentLoading = false;
        print("Error $e");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //stories
            SizedBox(
              height: 180,
              child:  isStoryLoading? ShimmerStoriesLoader() : stories == null || stories!.isEmpty  ? Center(
                child: Text("No stories available"),
              ) : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories!.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isComplimentLoading = true;
                        selectedIndex = index;
                        _fetchCompliments(stories![index].id);
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: isSelected ? Colors.black : Colors.transparent, width: 3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              stories![index].imageUrl,
                              width: 120,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        if (stories![index].viewCount > 0)
                          Positioned(
                            height: 30,
                            width: 30,
                            bottom: 10,
                            right: 15,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "${stories![index].viewCount}",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15,),
            Expanded(
                child: isComplimentLoading?
                ShimmerLoadingWidget() : compliments == null || compliments!.isEmpty ? Center(
                  child: Text("No Compliments found"),
                ) :
                ListView.separated(
                    itemCount: compliments!.length,
                    separatorBuilder: (context, index)=>Divider(
                      color: theme.colorScheme.outlineVariant,
                      thickness: 1,
                    ),
                    itemBuilder: (context, index) {
                      return ComplimentWidget(compliment: compliments![index]);
                    }
                )
            )

          ],
        ),
      )
    );
  }

}