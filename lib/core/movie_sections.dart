

import 'package:cinema/core/constant.dart';

enum MovieSections{
  upComing(section: "UpComing", endpoint: Constant.upComing),
  popular(section : "Popular", endpoint: Constant.popular),
  nowPlaying(section: "Now Playing", endpoint: Constant.nowPlaying);

  const MovieSections({required this.section, required this.endpoint});
  final String section;
  final String endpoint;

}