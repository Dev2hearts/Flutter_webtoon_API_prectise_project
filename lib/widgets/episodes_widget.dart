import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toonapi/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episodes extends StatelessWidget {
  const Episodes({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  final WebtoonEpisodeModel episode;
  final String webtoonId;

  onButtonTap() async {
    var now = DateTime.now();
    String formatDate = DateFormat('E').format(now);
    await launchUrlString(
        "https://m.comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}&week=$formatDate&listSortOrder=DESC&listPage=1");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.green.shade500,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: Image.network(
                  episode.thumb,
                  headers: const {
                    'User-Agent':
                        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                    'Referer': 'https://image-comic.pstatic.net/webtoon/',
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episode.title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate,
                          size: 15,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        Text(
                          episode.rating,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          episode.date,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
