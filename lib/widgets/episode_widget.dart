import 'package:flutter/material.dart';
import 'package:nomadcoders_toonflix/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Episode extends StatelessWidget {
  const Episode({
    Key? key,
    required this.episode,
    required this.webtoonId,
  }) : super(key: key);

  final String webtoonId;
  final WebtoonEpisodeModel episode;

  onButtonTab() async {
    final url = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
    await launchUrl(url);
    // await launchUrlString("https://google.com"); // or
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTab,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green.shade400,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
