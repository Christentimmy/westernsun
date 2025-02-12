import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Privacy & Policy",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(words),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final String words =
      """ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium elit et neque aliquam, sit amet venenatis metus accumsan. Donec suscipit, orci id sagittis rutrum, risus ante lobortis tellus, egestas dictum est ex ac nulla. Etiam congue nunc non posuere tempor. Quisque condimentum dapibus nisl id tempus. Curabitur dapibus ante orci, nec lacinia sapien sollicitudin nec. Fusce faucibus maximus sem. Ut vehicula, ligula sed iaculis dapibus, lorem lacus ullamcorper metus, et ullamcorper neque elit vel tellus. Proin quis consectetur libero. Phasellus consequat lorem ipsum, eget consequat nibh fringilla sit amet. Curabitur feugiat mattis volutpat. Vestibulum risus ipsum, pellentesque a interdum quis, iaculis id justo.
Donec non mattis sapien. Mauris congue neque et convallis semper. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed non libero justo. Sed mattis luctus mauris, ut semper felis accumsan consectetur. Phasellus commodo laoreet erat. Suspendisse iaculis imperdiet felis, porttitor sodales eros ullamcorper vitae. Curabitur ex urna, ullamcorper id quam eget, malesuada sodales nibh. Cras nibh lectus, iaculis sit amet accumsan quis, egestas vitae massa. Aenean ac magna maximus, tempus dolor nec, convallis odio. Praesent sollicitudin nibh id sodales cursus. Praesent quam sapien, consectetur vitae egestas eget, pretium sed eros. Duis mollis feugiat urna, sed placerat augue blandit at. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam bibendum quis sem at blandit.
Praesent lacinia est dolor, sollicitudin dapibus augue venenatis id. Sed nec magna et orci laoreet maximus at at sem. Aliquam pretium dolor erat, eget iaculis tellus venenatis non. Sed consectetur dui nibh, nec consectetur ante faucibus at. Nam sit amet maximus ligula. Donec ultrices lacus arcu, facilisis efficitur tortor ultricies sit amet. Mauris rhoncus urna dapibus justo dapibus accumsan. Aliquam ut pellentesque elit.
Donec non varius odio. Donec tempus condimentum urna vel faucibus. Donec varius eleifend massa vel suscipit. Curabitur iaculis pulvinar purus nec malesuada. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer blandit a tortor nec facilisis. Curabitur lacus nunc, auctor vitae odio ac, cursus laoreet dui. Curabitur ultrices nulla et erat ultrices, quis consequat quam lacinia. Mauris et vulputate nulla, suscipit iaculis nisl. Vivamus ut aliquet eros, ultricies tincidunt ex. Phasellus pellentesque mauris ac sagittis varius. Curabitur massa nibh, porta ac pretium a, vestibulum sed orci. Morbi ac laoreet quam, eget tempus urna. Vivamus dictum commodo ligula in mattis. Ut fermentum non dolor eget iaculis. Sed faucibus lorem et odio lacinia suscipit.
Duis tincidunt pellentesque velit, id tempor dolor porttitor ut. Proin dictum nisl odio, sit amet rutrum nisl bibendum sed. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In rutrum nisl velit, suscipit consequat ante gravida eget. Etiam mattis tincidunt velit id elementum. Aenean tincidunt euismod volutpat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi et ante imperdiet, ultrices lorem a, tristique mi. Vestibulum tincidunt rutrum nulla quis aliquet. Vivamus efficitur velit nec justo lacinia ultricies sed non risus. """;
}
