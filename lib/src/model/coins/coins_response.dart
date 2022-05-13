/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final coinsResponse = coinsResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

CoinsResponse coinsResponseFromJson(String str) =>
    CoinsResponse.fromJson(json.decode(str));

String coinsResponseToJson(CoinsResponse data) => json.encode(data.toJson());

class CoinsResponse {
  CoinsResponse({
    this.id,
    this.symbol,
    this.name,
    this.assetPlatformId,
    this.blockTimeInMinutes,
    this.hashingAlgorithm,
    this.categories,
    this.publicNotice,
    this.localization,
    this.description,
    this.links,
    this.image,
    this.countryOrigin,
    this.genesisDate,
    this.sentimentVotesUpPercentage,
    this.sentimentVotesDownPercentage,
    this.marketCapRank,
    this.coingeckoRank,
    this.coingeckoScore,
    this.developerScore,
    this.communityScore,
    this.liquidityScore,
    this.publicInterestScore,
    this.marketData,
    this.communityData,
    this.developerData,
    this.publicInterestStats,
    this.statusUpdates,
    this.lastUpdated,
    this.tickers,
  });

  factory CoinsResponse.fromJson(Map<String, dynamic> json) => CoinsResponse(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
        assetPlatformId: json['asset_platform_id'],
        blockTimeInMinutes: json['block_time_in_minutes'],
        hashingAlgorithm: json['hashing_algorithm'],
        categories: List<String>.from(json['categories'].map((dynamic x) => x)),
        publicNotice: json['public_notice'],
        localization: CoinsTion.fromJson(json['localization']),
        description: CoinsTion.fromJson(json['description']),
        links: CoinsLinks.fromJson(json['links']),
        image: CoinsImage.fromJson(json['image']),
        countryOrigin: json['country_origin'],
        genesisDate: json['genesis_date'],
        sentimentVotesUpPercentage:
            json['sentiment_votes_up_percentage']?.toDouble(),
        sentimentVotesDownPercentage:
            json['sentiment_votes_down_percentage']?.toDouble(),
        marketCapRank: json['market_cap_rank'],
        coingeckoRank: json['coingecko_rank'],
        coingeckoScore: json['coingecko_score']?.toDouble(),
        developerScore: json['developer_score']?.toDouble(),
        communityScore: json['community_score']?.toDouble(),
        liquidityScore: json['liquidity_score']?.toDouble(),
        publicInterestScore: json['public_interest_score']?.toDouble(),
        marketData: CoinsMarketData.fromJson(json['market_data']),
        communityData: CoinsCommunityData.fromJson(json['community_data']),
        developerData: CoinsDeveloperData.fromJson(json['developer_data']),
        publicInterestStats:
            CoinsPublicInterestStats.fromJson(json['public_interest_stats']),
        statusUpdates:
            List<dynamic>.from(json['status_updates'].map((dynamic x) => x)),
        lastUpdated: DateTime.parse(json['last_updated']),
        tickers: List<CoinsTicker>.from(
            json['tickers'].map((dynamic x) => CoinsTicker.fromJson(x))),
      );

  String? id;
  String? symbol;
  String? name;
  dynamic assetPlatformId;
  int? blockTimeInMinutes;
  dynamic hashingAlgorithm;
  List<String>? categories;
  dynamic publicNotice;
  CoinsTion? localization;
  CoinsTion? description;
  CoinsLinks? links;
  CoinsImage? image;
  String? countryOrigin;
  dynamic genesisDate;
  double? sentimentVotesUpPercentage;
  double? sentimentVotesDownPercentage;
  int? marketCapRank;
  int? coingeckoRank;
  double? coingeckoScore;
  double? developerScore;
  double? communityScore;
  double? liquidityScore;
  double? publicInterestScore;
  CoinsMarketData? marketData;
  CoinsCommunityData? communityData;
  CoinsDeveloperData? developerData;
  CoinsPublicInterestStats? publicInterestStats;
  List<dynamic>? statusUpdates;
  DateTime? lastUpdated;
  List<CoinsTicker>? tickers;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'symbol': symbol,
        'name': name,
        'asset_platform_id': assetPlatformId,
        'block_time_in_minutes': blockTimeInMinutes,
        'hashing_algorithm': hashingAlgorithm,
        'categories': List<dynamic>.from(categories!.map((String x) => x)),
        'public_notice': publicNotice,
        'localization': localization!.toJson(),
        'description': description!.toJson(),
        'links': links!.toJson(),
        'image': image!.toJson(),
        'country_origin': countryOrigin,
        'genesis_date': genesisDate,
        'sentiment_votes_up_percentage': sentimentVotesUpPercentage,
        'sentiment_votes_down_percentage': sentimentVotesDownPercentage,
        'market_cap_rank': marketCapRank,
        'coingecko_rank': coingeckoRank,
        'coingecko_score': coingeckoScore,
        'developer_score': developerScore,
        'community_score': communityScore,
        'liquidity_score': liquidityScore,
        'public_interest_score': publicInterestScore,
        'market_data': marketData!.toJson(),
        'community_data': communityData!.toJson(),
        'developer_data': developerData!.toJson(),
        'public_interest_stats': publicInterestStats!.toJson(),
        'status_updates':
            List<dynamic>.from(statusUpdates!.map((dynamic x) => x)),
        'last_updated': lastUpdated!.toIso8601String(),
        'tickers':
            List<dynamic>.from(tickers!.map((CoinsTicker x) => x.toJson())),
      };
}

class CoinsCommunityData {
  CoinsCommunityData({
    this.facebookLikes,
    this.twitterFollowers,
    this.redditAveragePosts48H,
    this.redditAverageComments48H,
    this.redditSubscribers,
    this.redditAccountsActive48H,
    this.telegramChannelUserCount,
  });

  factory CoinsCommunityData.fromJson(Map<String, dynamic> json) =>
      CoinsCommunityData(
        facebookLikes: json['facebook_likes'],
        twitterFollowers: json['twitter_followers'],
        redditAveragePosts48H: json['reddit_average_posts_48h']?.toDouble(),
        redditAverageComments48H:
            json['reddit_average_comments_48h']?.toDouble(),
        redditSubscribers: json['reddit_subscribers'],
        redditAccountsActive48H: json['reddit_accounts_active_48h'],
        telegramChannelUserCount: json['telegram_channel_user_count'],
      );

  dynamic facebookLikes;
  int? twitterFollowers;
  double? redditAveragePosts48H;
  double? redditAverageComments48H;
  int? redditSubscribers;
  int? redditAccountsActive48H;
  int? telegramChannelUserCount;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'facebook_likes': facebookLikes,
        'twitter_followers': twitterFollowers,
        'reddit_average_posts_48h': redditAveragePosts48H,
        'reddit_average_comments_48h': redditAverageComments48H,
        'reddit_subscribers': redditSubscribers,
        'reddit_accounts_active_48h': redditAccountsActive48H,
        'telegram_channel_user_count': telegramChannelUserCount,
      };
}

class CoinsTion {
  CoinsTion({
    this.en,
    this.de,
    this.es,
    this.fr,
    this.it,
    this.pl,
    this.ro,
    this.hu,
    this.nl,
    this.pt,
    this.sv,
    this.vi,
    this.tr,
    this.ru,
    this.ja,
    this.zh,
    this.zhTw,
    this.ko,
    this.ar,
    this.th,
    this.id,
  });

  factory CoinsTion.fromJson(Map<String, dynamic> json) => CoinsTion(
        en: json['en'],
        de: json['de'],
        es: json['es'],
        fr: json['fr'],
        it: json['it'],
        pl: json['pl'],
        ro: json['ro'],
        hu: json['hu'],
        nl: json['nl'],
        pt: json['pt'],
        sv: json['sv'],
        vi: json['vi'],
        tr: json['tr'],
        ru: json['ru'],
        ja: json['ja'],
        zh: json['zh'],
        zhTw: json['zh-tw'],
        ko: json['ko'],
        ar: json['ar'],
        th: json['th'],
        id: json['id'],
      );

  String? en;
  String? de;
  String? es;
  String? fr;
  String? it;
  String? pl;
  String? ro;
  String? hu;
  String? nl;
  String? pt;
  String? sv;
  String? vi;
  String? tr;
  String? ru;
  String? ja;
  String? zh;
  String? zhTw;
  String? ko;
  String? ar;
  String? th;
  String? id;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'en': en,
        'de': de,
        'es': es,
        'fr': fr,
        'it': it,
        'pl': pl,
        'ro': ro,
        'hu': hu,
        'nl': nl,
        'pt': pt,
        'sv': sv,
        'vi': vi,
        'tr': tr,
        'ru': ru,
        'ja': ja,
        'zh': zh,
        'zh-tw': zhTw,
        'ko': ko,
        'ar': ar,
        'th': th,
        'id': id,
      };
}

class CoinsDeveloperData {
  CoinsDeveloperData({
    this.forks,
    this.stars,
    this.subscribers,
    this.totalIssues,
    this.closedIssues,
    this.pullRequestsMerged,
    this.pullRequestContributors,
    this.codeAdditionsDeletions4Weeks,
    this.commitCount4Weeks,
    this.last4WeeksCommitActivitySeries,
  });

  factory CoinsDeveloperData.fromJson(Map<String, dynamic> json) =>
      CoinsDeveloperData(
        forks: json['forks'],
        stars: json['stars'],
        subscribers: json['subscribers'],
        totalIssues: json['total_issues'],
        closedIssues: json['closed_issues'],
        pullRequestsMerged: json['pull_requests_merged'],
        pullRequestContributors: json['pull_request_contributors'],
        codeAdditionsDeletions4Weeks:
            CoinsCodeAdditionsDeletions4Weeks.fromJson(
                json['code_additions_deletions_4_weeks']),
        commitCount4Weeks: json['commit_count_4_weeks'],
        last4WeeksCommitActivitySeries: List<dynamic>.from(
            json['last_4_weeks_commit_activity_series'].map((dynamic x) => x)),
      );

  int? forks;
  int? stars;
  int? subscribers;
  int? totalIssues;
  int? closedIssues;
  int? pullRequestsMerged;
  int? pullRequestContributors;
  CoinsCodeAdditionsDeletions4Weeks? codeAdditionsDeletions4Weeks;
  int? commitCount4Weeks;
  List<dynamic>? last4WeeksCommitActivitySeries;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'forks': forks,
        'stars': stars,
        'subscribers': subscribers,
        'total_issues': totalIssues,
        'closed_issues': closedIssues,
        'pull_requests_merged': pullRequestsMerged,
        'pull_request_contributors': pullRequestContributors,
        'code_additions_deletions_4_weeks':
            codeAdditionsDeletions4Weeks!.toJson(),
        'commit_count_4_weeks': commitCount4Weeks,
        'last_4_weeks_commit_activity_series': List<dynamic>.from(
            last4WeeksCommitActivitySeries!.map((dynamic x) => x)),
      };
}

class CoinsCodeAdditionsDeletions4Weeks {
  CoinsCodeAdditionsDeletions4Weeks({
    this.additions,
    this.deletions,
  });

  factory CoinsCodeAdditionsDeletions4Weeks.fromJson(
          Map<String, dynamic> json) =>
      CoinsCodeAdditionsDeletions4Weeks(
        additions: json['additions'],
        deletions: json['deletions'],
      );

  int? additions;
  int? deletions;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'additions': additions,
        'deletions': deletions,
      };
}

class CoinsImage {
  CoinsImage({
    this.thumb,
    this.small,
    this.large,
  });

  factory CoinsImage.fromJson(Map<String, dynamic> json) => CoinsImage(
        thumb: json['thumb'],
        small: json['small'],
        large: json['large'],
      );

  String? thumb;
  String? small;
  String? large;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'thumb': thumb,
        'small': small,
        'large': large,
      };
}

class CoinsLinks {
  CoinsLinks({
    this.homepage,
    this.blockchainSite,
    this.officialForumUrl,
    this.chatUrl,
    this.announcementUrl,
    this.twitterScreenName,
    this.facebookUsername,
    this.bitcointalkThreadIdentifier,
    this.telegramChannelIdentifier,
    this.subredditUrl,
    this.reposUrl,
  });

  factory CoinsLinks.fromJson(Map<String, dynamic> json) => CoinsLinks(
        homepage: List<String>.from(json['homepage'].map((dynamic x) => x)),
        blockchainSite:
            List<String>.from(json['blockchain_site'].map((dynamic x) => x)),
        officialForumUrl:
            List<String>.from(json['official_forum_url'].map((dynamic x) => x)),
        chatUrl: List<String>.from(json['chat_url'].map((dynamic x) => x)),
        announcementUrl:
            List<String>.from(json['announcement_url'].map((dynamic x) => x)),
        twitterScreenName: json['twitter_screen_name'],
        facebookUsername: json['facebook_username'],
        bitcointalkThreadIdentifier: json['bitcointalk_thread_identifier'],
        telegramChannelIdentifier: json['telegram_channel_identifier'],
        subredditUrl: json['subreddit_url'],
        reposUrl: CoinsLinksReposUrl.fromJson(json['repos_url']),
      );

  List<String>? homepage;
  List<String>? blockchainSite;
  List<String>? officialForumUrl;
  List<String>? chatUrl;
  List<String>? announcementUrl;
  String? twitterScreenName;
  String? facebookUsername;
  int? bitcointalkThreadIdentifier;
  String? telegramChannelIdentifier;
  String? subredditUrl;
  CoinsLinksReposUrl? reposUrl;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'homepage': List<dynamic>.from(homepage!.map((String x) => x)),
        'blockchain_site':
            List<dynamic>.from(blockchainSite!.map((String x) => x)),
        'official_forum_url':
            List<dynamic>.from(officialForumUrl!.map((String x) => x)),
        'chat_url': List<dynamic>.from(chatUrl!.map((String x) => x)),
        'announcement_url':
            List<dynamic>.from(announcementUrl!.map((String x) => x)),
        'twitter_screen_name': twitterScreenName,
        'facebook_username': facebookUsername,
        'bitcointalk_thread_identifier': bitcointalkThreadIdentifier,
        'telegram_channel_identifier': telegramChannelIdentifier,
        'subreddit_url': subredditUrl,
        'repos_url': reposUrl!.toJson(),
      };
}

class CoinsLinksReposUrl {
  CoinsLinksReposUrl({
    this.github,
    this.bitbucket,
  });

  factory CoinsLinksReposUrl.fromJson(Map<String, dynamic> json) =>
      CoinsLinksReposUrl(
        github: List<String>.from(json['github'].map((dynamic x) => x)),
        bitbucket: List<dynamic>.from(json['bitbucket'].map((dynamic x) => x)),
      );

  List<String>? github;
  List<dynamic>? bitbucket;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'github': List<dynamic>.from(github!.map((String x) => x)),
        'bitbucket': List<dynamic>.from(bitbucket!.map((dynamic x) => x)),
      };
}

class CoinsMarketData {
  CoinsMarketData({
    this.currentPrice,
    this.roi,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.priceChangePercentage7D,
    this.priceChangePercentage14D,
    this.priceChangePercentage30D,
    this.priceChangePercentage60D,
    this.priceChangePercentage200D,
    this.priceChangePercentage1Y,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.priceChange24HInCurrency,
    this.priceChangePercentage1HInCurrency,
    this.priceChangePercentage24HInCurrency,
    this.priceChangePercentage7DInCurrency,
    this.priceChangePercentage14DInCurrency,
    this.priceChangePercentage30DInCurrency,
    this.priceChangePercentage60DInCurrency,
    this.priceChangePercentage200DInCurrency,
    this.priceChangePercentage1YInCurrency,
    this.marketCapChange24HInCurrency,
    this.marketCapChangePercentage24HInCurrency,
    this.totalSupply,
    this.maxSupply,
    this.circulatingSupply,
    this.lastUpdated,
  });

  factory CoinsMarketData.fromJson(Map<String, dynamic> json) =>
      CoinsMarketData(
        currentPrice: Map<dynamic, dynamic>.from(json['current_price']).map(
            (dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        roi: json['roi'],
        ath: Map<dynamic, dynamic>.from(json['ath']).map(
            (dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        athChangePercentage:
            Map<dynamic, dynamic>.from(json['ath_change_percentage']).map(
                (dynamic k, dynamic v) =>
                    MapEntry<String, double>(k, v.toDouble())),
        athDate: Map<dynamic, dynamic>.from(json['ath_date']).map(
            (dynamic k, dynamic v) =>
                MapEntry<String, DateTime>(k, DateTime.parse(v))),
        atl: Map<dynamic, dynamic>.from(json['atl']).map(
            (dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        atlChangePercentage:
            Map<dynamic, dynamic>.from(json['atl_change_percentage']).map(
                (dynamic k, dynamic v) =>
                    MapEntry<String, double>(k, v.toDouble())),
        atlDate: Map<dynamic, dynamic>.from(json['atl_date']).map(
            (dynamic k, dynamic v) =>
                MapEntry<String, DateTime>(k, DateTime.parse(v))),
        marketCap: Map<dynamic, dynamic>.from(json['market_cap']).map(
            (dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        marketCapRank: json['market_cap_rank'],
        fullyDilutedValuation: CoinsMarketFullyDilutedValuation.fromJson(),
        totalVolume: Map<dynamic, dynamic>.from(json['total_volume']).map(
            (dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        high24H: Map<dynamic, dynamic>.from(json['high_24h']).map(
            (dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        low24H: Map<dynamic, dynamic>.from(json['low_24h']).map(
            (dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        priceChange24H: json['price_change_24h']?.toDouble(),
        priceChangePercentage24H:
            json['price_change_percentage_24h']?.toDouble(),
        priceChangePercentage7D: json['price_change_percentage_7d']?.toDouble(),
        priceChangePercentage14D:
            json['price_change_percentage_14d']?.toDouble(),
        priceChangePercentage30D:
            json['price_change_percentage_30d']?.toDouble(),
        priceChangePercentage60D:
            json['price_change_percentage_60d']?.toDouble(),
        priceChangePercentage200D:
            json['price_change_percentage_200d']?.toDouble(),
        priceChangePercentage1Y: json['price_change_percentage_1y']?.toDouble(),
        marketCapChange24H: json['market_cap_change_24h']?.toDouble(),
        marketCapChangePercentage24H:
            json['market_cap_change_percentage_24h']?.toDouble(),
        priceChange24HInCurrency:
            Map<dynamic, dynamic>.from(json['price_change_24h_in_currency'])
                .map((dynamic k, dynamic v) =>
                    MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage1HInCurrency: Map<dynamic, dynamic>.from(
                json['price_change_percentage_1h_in_currency'])
            .map((dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage24HInCurrency: Map<dynamic, dynamic>.from(
                json['price_change_percentage_24h_in_currency'])
            .map((dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage7DInCurrency: Map<dynamic, dynamic>.from(
                json['price_change_percentage_7d_in_currency'])
            .map((dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage14DInCurrency: Map<dynamic, dynamic>.from(
                json['price_change_percentage_14d_in_currency'])
            .map((dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage30DInCurrency: Map<dynamic, dynamic>.from(
                json['price_change_percentage_30d_in_currency'])
            .map((dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage60DInCurrency: Map<dynamic, dynamic>.from(
                json['price_change_percentage_60d_in_currency'])
            .map((dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage200DInCurrency: Map<dynamic, dynamic>.from(
                json['price_change_percentage_200d_in_currency'])
            .map((dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage1YInCurrency:
            CoinsMarketFullyDilutedValuation.fromJson(),
        marketCapChange24HInCurrency: Map<dynamic, dynamic>.from(
                json['market_cap_change_24h_in_currency'])
            .map((dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        marketCapChangePercentage24HInCurrency: Map<dynamic, dynamic>.from(
                json['market_cap_change_percentage_24h_in_currency'])
            .map((dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        totalSupply: json['total_supply'],
        maxSupply: json['max_supply'],
        circulatingSupply: json['circulating_supply']?.toDouble(),
        lastUpdated: DateTime.parse(json['last_updated']),
      );

  Map<String, double>? currentPrice;
  dynamic roi;
  Map<String, double>? ath;
  Map<String, double>? athChangePercentage;
  Map<String, DateTime>? athDate;
  Map<String, double>? atl;
  Map<String, double>? atlChangePercentage;
  Map<String, DateTime>? atlDate;
  Map<String, double>? marketCap;
  int? marketCapRank;
  CoinsMarketFullyDilutedValuation? fullyDilutedValuation;
  Map<String, double>? totalVolume;
  Map<String, double>? high24H;
  Map<String, double>? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;
  double? priceChangePercentage7D;
  double? priceChangePercentage14D;
  double? priceChangePercentage30D;
  double? priceChangePercentage60D;
  double? priceChangePercentage200D;
  double? priceChangePercentage1Y;
  double? marketCapChange24H;
  double? marketCapChangePercentage24H;
  Map<String, double>? priceChange24HInCurrency;
  Map<String, double>? priceChangePercentage1HInCurrency;
  Map<String, double>? priceChangePercentage24HInCurrency;
  Map<String, double>? priceChangePercentage7DInCurrency;
  Map<String, double>? priceChangePercentage14DInCurrency;
  Map<String, double>? priceChangePercentage30DInCurrency;
  Map<String, double>? priceChangePercentage60DInCurrency;
  Map<String, double>? priceChangePercentage200DInCurrency;
  CoinsMarketFullyDilutedValuation? priceChangePercentage1YInCurrency;
  Map<String, double>? marketCapChange24HInCurrency;
  Map<String, double>? marketCapChangePercentage24HInCurrency;
  dynamic totalSupply;
  dynamic maxSupply;
  double? circulatingSupply;
  DateTime? lastUpdated;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'current_price': Map<dynamic, dynamic>.from(currentPrice!)
            .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'roi': roi,
        'ath': Map<dynamic, dynamic>.from(ath!)
            .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'ath_change_percentage':
            Map<dynamic, dynamic>.from(athChangePercentage!)
                .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'ath_date': Map<dynamic, dynamic>.from(athDate!).map(
            (dynamic k, dynamic v) =>
                MapEntry<String, dynamic>(k, v.toIso8601String())),
        'atl': Map<dynamic, dynamic>.from(atl!)
            .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'atl_change_percentage':
            Map<dynamic, dynamic>.from(atlChangePercentage!)
                .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'atl_date': Map<dynamic, dynamic>.from(atlDate!).map(
            (dynamic k, dynamic v) =>
                MapEntry<String, dynamic>(k, v.toIso8601String())),
        'market_cap': Map<dynamic, dynamic>.from(marketCap!)
            .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'market_cap_rank': marketCapRank,
        'fully_diluted_valuation': fullyDilutedValuation!.toJson(),
        'total_volume': Map<dynamic, dynamic>.from(totalVolume!)
            .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'high_24h': Map<dynamic, dynamic>.from(high24H!)
            .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'low_24h': Map<dynamic, dynamic>.from(low24H!)
            .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'price_change_24h': priceChange24H,
        'price_change_percentage_24h': priceChangePercentage24H,
        'price_change_percentage_7d': priceChangePercentage7D,
        'price_change_percentage_14d': priceChangePercentage14D,
        'price_change_percentage_30d': priceChangePercentage30D,
        'price_change_percentage_60d': priceChangePercentage60D,
        'price_change_percentage_200d': priceChangePercentage200D,
        'price_change_percentage_1y': priceChangePercentage1Y,
        'market_cap_change_24h': marketCapChange24H,
        'market_cap_change_percentage_24h': marketCapChangePercentage24H,
        'price_change_24h_in_currency':
            Map<dynamic, dynamic>.from(priceChange24HInCurrency!)
                .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_1h_in_currency':
            Map<dynamic, dynamic>.from(priceChangePercentage1HInCurrency!)
                .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_24h_in_currency':
            Map<dynamic, dynamic>.from(priceChangePercentage24HInCurrency!)
                .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_7d_in_currency':
            Map<dynamic, dynamic>.from(priceChangePercentage7DInCurrency!)
                .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_14d_in_currency':
            Map<dynamic, dynamic>.from(priceChangePercentage14DInCurrency!)
                .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_30d_in_currency':
            Map<dynamic, dynamic>.from(priceChangePercentage30DInCurrency!)
                .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_60d_in_currency':
            Map<dynamic, dynamic>.from(priceChangePercentage60DInCurrency!)
                .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_200d_in_currency':
            Map<dynamic, dynamic>.from(priceChangePercentage200DInCurrency!)
                .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_1y_in_currency':
            priceChangePercentage1YInCurrency!.toJson(),
        'market_cap_change_24h_in_currency':
            Map<dynamic, dynamic>.from(marketCapChange24HInCurrency!)
                .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'market_cap_change_percentage_24h_in_currency':
            Map<dynamic, dynamic>.from(marketCapChangePercentage24HInCurrency!)
                .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'total_supply': totalSupply,
        'max_supply': maxSupply,
        'circulating_supply': circulatingSupply,
        'last_updated': lastUpdated!.toIso8601String(),
      };
}

class CoinsMarketFullyDilutedValuation {
  CoinsMarketFullyDilutedValuation();

  factory CoinsMarketFullyDilutedValuation.fromJson() =>
      CoinsMarketFullyDilutedValuation();

  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CoinsPublicInterestStats {
  CoinsPublicInterestStats({
    this.alexaRank,
    this.bingMatches,
  });

  factory CoinsPublicInterestStats.fromJson(Map<String, dynamic> json) =>
      CoinsPublicInterestStats(
        alexaRank: json['alexa_rank'],
        bingMatches: json['bing_matches'],
      );

  int? alexaRank;
  dynamic bingMatches;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'alexa_rank': alexaRank,
        'bing_matches': bingMatches,
      };
}

class CoinsTicker {
  CoinsTicker({
    this.base,
    this.target,
    this.market,
    this.last,
    this.volume,
    this.convertedLast,
    this.convertedVolume,
    this.trustScore,
    this.bidAskSpreadPercentage,
    this.timestamp,
    this.lastTradedAt,
    this.lastFetchAt,
    this.isAnomaly,
    this.isStale,
    this.tradeUrl,
    this.coinId,
    this.targetCoinId,
  });

  factory CoinsTicker.fromJson(Map<String, dynamic> json) => CoinsTicker(
        base: json['base'],
        target: json['target'],
        market: CoinsTickerMarket.fromJson(json['market']),
        last: json['last']?.toDouble(),
        volume: json['volume']?.toDouble(),
        convertedLast: Map<dynamic, dynamic>.from(json['converted_last']).map(
            (dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        convertedVolume: Map<dynamic, dynamic>.from(json['converted_volume'])
            .map((dynamic k, dynamic v) =>
                MapEntry<String, double>(k, v.toDouble())),
        trustScore: json['trust_score'],
        bidAskSpreadPercentage: json['bid_ask_spread_percentage']?.toDouble(),
        timestamp: DateTime.parse(json['timestamp']),
        lastTradedAt: DateTime.parse(json['last_traded_at']),
        lastFetchAt: DateTime.parse(json['last_fetch_at']),
        isAnomaly: json['is_anomaly'],
        isStale: json['is_stale'],
        tradeUrl: json['trade_url'],
        coinId: json['coin_id'],
        targetCoinId: json['target_coin_id'],
      );

  String? base;
  String? target;
  CoinsTickerMarket? market;
  double? last;
  double? volume;
  Map<String, double>? convertedLast;
  Map<String, double>? convertedVolume;
  String? trustScore;
  double? bidAskSpreadPercentage;
  DateTime? timestamp;
  DateTime? lastTradedAt;
  DateTime? lastFetchAt;
  bool? isAnomaly;
  bool? isStale;
  String? tradeUrl;
  String? coinId;
  String? targetCoinId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'base': base,
        'target': target,
        'market': market!.toJson(),
        'last': last,
        'volume': volume,
        'converted_last': Map<dynamic, dynamic>.from(convertedLast!)
            .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'converted_volume': Map<dynamic, dynamic>.from(convertedVolume!)
            .map((dynamic k, dynamic v) => MapEntry<String, dynamic>(k, v)),
        'trust_score': trustScore,
        'bid_ask_spread_percentage': bidAskSpreadPercentage,
        'timestamp': timestamp!.toIso8601String(),
        'last_traded_at': lastTradedAt!.toIso8601String(),
        'last_fetch_at': lastFetchAt!.toIso8601String(),
        'is_anomaly': isAnomaly,
        'is_stale': isStale,
        'trade_url': tradeUrl,
        'coin_id': coinId,
        'target_coin_id': targetCoinId,
      };
}

class CoinsTickerMarket {
  CoinsTickerMarket({
    this.name,
    this.identifier,
    this.hasTradingIncentive,
  });

  factory CoinsTickerMarket.fromJson(Map<String, dynamic> json) =>
      CoinsTickerMarket(
        name: json['name'],
        identifier: json['identifier'],
        hasTradingIncentive: json['has_trading_incentive'],
      );

  String? name;
  String? identifier;
  bool? hasTradingIncentive;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'identifier': identifier,
        'has_trading_incentive': hasTradingIncentive,
      };
}
