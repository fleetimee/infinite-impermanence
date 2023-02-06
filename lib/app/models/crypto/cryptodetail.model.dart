// To parse this JSON data, do
//
//     final cryptoDetail = cryptoDetailFromJson(jsonString);

import 'dart:convert';

CryptoDetail cryptoDetailFromJson(String str) =>
    CryptoDetail.fromJson(json.decode(str));

String cryptoDetailToJson(CryptoDetail data) => json.encode(data.toJson());

class CryptoDetail {
  CryptoDetail({
    this.id,
    this.symbol,
    this.name,
    this.assetPlatformId,
    this.platforms,
    this.detailPlatforms,
    this.blockTimeInMinutes,
    this.hashingAlgorithm,
    this.categories,
    this.publicNotice,
    this.additionalNotices,
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
  });

  Id? id;
  String? symbol;
  String? name;
  dynamic assetPlatformId;
  Platforms? platforms;
  DetailPlatforms? detailPlatforms;
  int? blockTimeInMinutes;
  String? hashingAlgorithm;
  List<String>? categories;
  dynamic publicNotice;
  List<dynamic>? additionalNotices;
  Tion? localization;
  Tion? description;
  Links? links;
  Image? image;
  String? countryOrigin;
  DateTime? genesisDate;
  double? sentimentVotesUpPercentage;
  double? sentimentVotesDownPercentage;
  int? marketCapRank;
  int? coingeckoRank;
  double? coingeckoScore;
  double? developerScore;
  double? communityScore;
  double? liquidityScore;
  double? publicInterestScore;
  MarketData? marketData;
  CommunityData? communityData;
  DeveloperData? developerData;
  PublicInterestStats? publicInterestStats;
  List<dynamic>? statusUpdates;
  DateTime? lastUpdated;

  factory CryptoDetail.fromJson(Map<String, dynamic> json) => CryptoDetail(
        symbol: json["symbol"],
        name: json["name"],
        assetPlatformId: json["asset_platform_id"],
        platforms: json["platforms"] == null
            ? null
            : Platforms.fromJson(json["platforms"]),
        detailPlatforms: json["detail_platforms"] == null
            ? null
            : DetailPlatforms.fromJson(json["detail_platforms"]),
        blockTimeInMinutes: json["block_time_in_minutes"],
        hashingAlgorithm: json["hashing_algorithm"],
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        publicNotice: json["public_notice"],
        additionalNotices: json["additional_notices"] == null
            ? []
            : List<dynamic>.from(json["additional_notices"]!.map((x) => x)),
        localization: json["localization"] == null
            ? null
            : Tion.fromJson(json["localization"]),
        description: json["description"] == null
            ? null
            : Tion.fromJson(json["description"]),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        countryOrigin: json["country_origin"],
        genesisDate: json["genesis_date"] == null
            ? null
            : DateTime.parse(json["genesis_date"]),
        sentimentVotesUpPercentage:
            json["sentiment_votes_up_percentage"]?.toDouble(),
        sentimentVotesDownPercentage:
            json["sentiment_votes_down_percentage"]?.toDouble(),
        marketCapRank: json["market_cap_rank"],
        coingeckoRank: json["coingecko_rank"],
        coingeckoScore: json["coingecko_score"]?.toDouble(),
        developerScore: json["developer_score"]?.toDouble(),
        communityScore: json["community_score"]?.toDouble(),
        liquidityScore: json["liquidity_score"]?.toDouble(),
        publicInterestScore: json["public_interest_score"]?.toDouble(),
        marketData: json["market_data"] == null
            ? null
            : MarketData.fromJson(json["market_data"]),
        communityData: json["community_data"] == null
            ? null
            : CommunityData.fromJson(json["community_data"]),
        developerData: json["developer_data"] == null
            ? null
            : DeveloperData.fromJson(json["developer_data"]),
        publicInterestStats: json["public_interest_stats"] == null
            ? null
            : PublicInterestStats.fromJson(json["public_interest_stats"]),
        statusUpdates: json["status_updates"] == null
            ? []
            : List<dynamic>.from(json["status_updates"]!.map((x) => x)),
        lastUpdated: json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "name": name,
        "asset_platform_id": assetPlatformId,
        "platforms": platforms?.toJson(),
        "detail_platforms": detailPlatforms?.toJson(),
        "block_time_in_minutes": blockTimeInMinutes,
        "hashing_algorithm": hashingAlgorithm,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "public_notice": publicNotice,
        "additional_notices": additionalNotices == null
            ? []
            : List<dynamic>.from(additionalNotices!.map((x) => x)),
        "localization": localization?.toJson(),
        "description": description?.toJson(),
        "links": links?.toJson(),
        "image": image?.toJson(),
        "country_origin": countryOrigin,
        "genesis_date":
            "${genesisDate!.year.toString().padLeft(4, '0')}-${genesisDate!.month.toString().padLeft(2, '0')}-${genesisDate!.day.toString().padLeft(2, '0')}",
        "sentiment_votes_up_percentage": sentimentVotesUpPercentage,
        "sentiment_votes_down_percentage": sentimentVotesDownPercentage,
        "market_cap_rank": marketCapRank,
        "coingecko_rank": coingeckoRank,
        "coingecko_score": coingeckoScore,
        "developer_score": developerScore,
        "community_score": communityScore,
        "liquidity_score": liquidityScore,
        "public_interest_score": publicInterestScore,
        "market_data": marketData?.toJson(),
        "community_data": communityData?.toJson(),
        "developer_data": developerData?.toJson(),
        "public_interest_stats": publicInterestStats?.toJson(),
        "status_updates": statusUpdates == null
            ? []
            : List<dynamic>.from(statusUpdates!.map((x) => x)),
        "last_updated": lastUpdated?.toIso8601String(),
      };
}

class CommunityData {
  CommunityData({
    this.facebookLikes,
    this.twitterFollowers,
    this.redditAveragePosts48H,
    this.redditAverageComments48H,
    this.redditSubscribers,
    this.redditAccountsActive48H,
    this.telegramChannelUserCount,
  });

  dynamic facebookLikes;
  int? twitterFollowers;
  double? redditAveragePosts48H;
  double? redditAverageComments48H;
  int? redditSubscribers;
  int? redditAccountsActive48H;
  dynamic telegramChannelUserCount;

  factory CommunityData.fromJson(Map<String, dynamic> json) => CommunityData(
        facebookLikes: json["facebook_likes"],
        twitterFollowers: json["twitter_followers"],
        redditAveragePosts48H: json["reddit_average_posts_48h"],
        redditAverageComments48H:
            json["reddit_average_comments_48h"]?.toDouble(),
        redditSubscribers: json["reddit_subscribers"],
        redditAccountsActive48H: json["reddit_accounts_active_48h"],
        telegramChannelUserCount: json["telegram_channel_user_count"],
      );

  Map<String, dynamic> toJson() => {
        "facebook_likes": facebookLikes,
        "twitter_followers": twitterFollowers,
        "reddit_average_posts_48h": redditAveragePosts48H,
        "reddit_average_comments_48h": redditAverageComments48H,
        "reddit_subscribers": redditSubscribers,
        "reddit_accounts_active_48h": redditAccountsActive48H,
        "telegram_channel_user_count": telegramChannelUserCount,
      };
}

class Tion {
  Tion({
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
    this.cs,
    this.da,
    this.el,
    this.hi,
    this.no,
    this.sk,
    this.uk,
    this.he,
    this.fi,
    this.bg,
    this.hr,
    this.lt,
    this.sl,
  });

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
  String? cs;
  String? da;
  String? el;
  String? hi;
  String? no;
  String? sk;
  String? uk;
  String? he;
  String? fi;
  String? bg;
  String? hr;
  String? lt;
  String? sl;

  factory Tion.fromJson(Map<String, dynamic> json) => Tion(
        en: json["en"],
        de: json["de"],
        es: json["es"],
        fr: json["fr"],
        it: json["it"],
        pl: json["pl"],
        ro: json["ro"],
        hu: json["hu"],
        nl: json["nl"],
        pt: json["pt"],
        sv: json["sv"],
        vi: json["vi"],
        tr: json["tr"],
        ru: json["ru"],
        ja: json["ja"],
        zh: json["zh"],
        zhTw: json["zh-tw"],
        ko: json["ko"],
        ar: json["ar"],
        th: json["th"],
        id: json["id"],
        cs: json["cs"],
        da: json["da"],
        el: json["el"],
        hi: json["hi"],
        no: json["no"],
        sk: json["sk"],
        uk: json["uk"],
        he: json["he"],
        fi: json["fi"],
        bg: json["bg"],
        hr: json["hr"],
        lt: json["lt"],
        sl: json["sl"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "de": de,
        "es": es,
        "fr": fr,
        "it": it,
        "pl": pl,
        "ro": ro,
        "hu": hu,
        "nl": nl,
        "pt": pt,
        "sv": sv,
        "vi": vi,
        "tr": tr,
        "ru": ru,
        "ja": ja,
        "zh": zh,
        "zh-tw": zhTw,
        "ko": ko,
        "ar": ar,
        "th": th,
        "id": id,
        "cs": cs,
        "da": da,
        "el": el,
        "hi": hi,
        "no": no,
        "sk": sk,
        "uk": uk,
        "he": he,
        "fi": fi,
        "bg": bg,
        "hr": hr,
        "lt": lt,
        "sl": sl,
      };
}

class DetailPlatforms {
  DetailPlatforms({
    this.empty,
  });

  Empty? empty;

  factory DetailPlatforms.fromJson(Map<String, dynamic> json) =>
      DetailPlatforms(
        empty: json[""] == null ? null : Empty.fromJson(json[""]),
      );

  Map<String, dynamic> toJson() => {
        "": empty?.toJson(),
      };
}

class Empty {
  Empty({
    this.decimalPlace,
    this.contractAddress,
  });

  dynamic decimalPlace;
  String? contractAddress;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
        decimalPlace: json["decimal_place"],
        contractAddress: json["contract_address"],
      );

  Map<String, dynamic> toJson() => {
        "decimal_place": decimalPlace,
        "contract_address": contractAddress,
      };
}

class DeveloperData {
  DeveloperData({
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

  int? forks;
  int? stars;
  int? subscribers;
  int? totalIssues;
  int? closedIssues;
  int? pullRequestsMerged;
  int? pullRequestContributors;
  CodeAdditionsDeletions4Weeks? codeAdditionsDeletions4Weeks;
  int? commitCount4Weeks;
  List<int>? last4WeeksCommitActivitySeries;

  factory DeveloperData.fromJson(Map<String, dynamic> json) => DeveloperData(
        forks: json["forks"],
        stars: json["stars"],
        subscribers: json["subscribers"],
        totalIssues: json["total_issues"],
        closedIssues: json["closed_issues"],
        pullRequestsMerged: json["pull_requests_merged"],
        pullRequestContributors: json["pull_request_contributors"],
        codeAdditionsDeletions4Weeks:
            json["code_additions_deletions_4_weeks"] == null
                ? null
                : CodeAdditionsDeletions4Weeks.fromJson(
                    json["code_additions_deletions_4_weeks"]),
        commitCount4Weeks: json["commit_count_4_weeks"],
        last4WeeksCommitActivitySeries:
            json["last_4_weeks_commit_activity_series"] == null
                ? []
                : List<int>.from(
                    json["last_4_weeks_commit_activity_series"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "forks": forks,
        "stars": stars,
        "subscribers": subscribers,
        "total_issues": totalIssues,
        "closed_issues": closedIssues,
        "pull_requests_merged": pullRequestsMerged,
        "pull_request_contributors": pullRequestContributors,
        "code_additions_deletions_4_weeks":
            codeAdditionsDeletions4Weeks?.toJson(),
        "commit_count_4_weeks": commitCount4Weeks,
        "last_4_weeks_commit_activity_series": last4WeeksCommitActivitySeries ==
                null
            ? []
            : List<dynamic>.from(last4WeeksCommitActivitySeries!.map((x) => x)),
      };
}

class CodeAdditionsDeletions4Weeks {
  CodeAdditionsDeletions4Weeks({
    this.additions,
    this.deletions,
  });

  int? additions;
  int? deletions;

  factory CodeAdditionsDeletions4Weeks.fromJson(Map<String, dynamic> json) =>
      CodeAdditionsDeletions4Weeks(
        additions: json["additions"],
        deletions: json["deletions"],
      );

  Map<String, dynamic> toJson() => {
        "additions": additions,
        "deletions": deletions,
      };
}

enum Id { TETHER, BINANCE_USD, USD_COIN, BITCOIN }

class Image {
  Image({
    this.thumb,
    this.small,
    this.large,
  });

  String? thumb;
  String? small;
  String? large;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        thumb: json["thumb"],
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "small": small,
        "large": large,
      };
}

class Links {
  Links({
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

  List<String>? homepage;
  List<String>? blockchainSite;
  List<String>? officialForumUrl;
  List<String>? chatUrl;
  List<String>? announcementUrl;
  Id? twitterScreenName;
  String? facebookUsername;
  dynamic bitcointalkThreadIdentifier;
  String? telegramChannelIdentifier;
  String? subredditUrl;
  ReposUrl? reposUrl;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        homepage: json["homepage"] == null
            ? []
            : List<String>.from(json["homepage"]!.map((x) => x)),
        blockchainSite: json["blockchain_site"] == null
            ? []
            : List<String>.from(json["blockchain_site"]!.map((x) => x)),
        officialForumUrl: json["official_forum_url"] == null
            ? []
            : List<String>.from(json["official_forum_url"]!.map((x) => x)),
        chatUrl: json["chat_url"] == null
            ? []
            : List<String>.from(json["chat_url"]!.map((x) => x)),
        announcementUrl: json["announcement_url"] == null
            ? []
            : List<String>.from(json["announcement_url"]!.map((x) => x)),
        facebookUsername: json["facebook_username"],
        bitcointalkThreadIdentifier: json["bitcointalk_thread_identifier"],
        telegramChannelIdentifier: json["telegram_channel_identifier"],
        subredditUrl: json["subreddit_url"],
        reposUrl: json["repos_url"] == null
            ? null
            : ReposUrl.fromJson(json["repos_url"]),
      );

  Map<String, dynamic> toJson() => {
        "homepage":
            homepage == null ? [] : List<dynamic>.from(homepage!.map((x) => x)),
        "blockchain_site": blockchainSite == null
            ? []
            : List<dynamic>.from(blockchainSite!.map((x) => x)),
        "official_forum_url": officialForumUrl == null
            ? []
            : List<dynamic>.from(officialForumUrl!.map((x) => x)),
        "chat_url":
            chatUrl == null ? [] : List<dynamic>.from(chatUrl!.map((x) => x)),
        "announcement_url": announcementUrl == null
            ? []
            : List<dynamic>.from(announcementUrl!.map((x) => x)),
        "facebook_username": facebookUsername,
        "bitcointalk_thread_identifier": bitcointalkThreadIdentifier,
        "telegram_channel_identifier": telegramChannelIdentifier,
        "subreddit_url": subredditUrl,
        "repos_url": reposUrl?.toJson(),
      };
}

class ReposUrl {
  ReposUrl({
    this.github,
    this.bitbucket,
  });

  List<String>? github;
  List<dynamic>? bitbucket;

  factory ReposUrl.fromJson(Map<String, dynamic> json) => ReposUrl(
        github: json["github"] == null
            ? []
            : List<String>.from(json["github"]!.map((x) => x)),
        bitbucket: json["bitbucket"] == null
            ? []
            : List<dynamic>.from(json["bitbucket"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "github":
            github == null ? [] : List<dynamic>.from(github!.map((x) => x)),
        "bitbucket": bitbucket == null
            ? []
            : List<dynamic>.from(bitbucket!.map((x) => x)),
      };
}

class MarketData {
  MarketData({
    this.currentPrice,
    this.totalValueLocked,
    this.mcapToTvlRatio,
    this.fdvToTvlRatio,
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

  Map<String, double>? currentPrice;
  dynamic totalValueLocked;
  dynamic mcapToTvlRatio;
  dynamic fdvToTvlRatio;
  dynamic roi;
  Map<String, double>? ath;
  Map<String, double>? athChangePercentage;
  Map<String, DateTime>? athDate;
  Map<String, double>? atl;
  Map<String, double>? atlChangePercentage;
  Map<String, DateTime>? atlDate;
  Map<String, double>? marketCap;
  int? marketCapRank;
  Map<String, double>? fullyDilutedValuation;
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
  Map<String, double>? priceChangePercentage1YInCurrency;
  Map<String, double>? marketCapChange24HInCurrency;
  Map<String, double>? marketCapChangePercentage24HInCurrency;
  double? totalSupply;
  double? maxSupply;
  double? circulatingSupply;
  DateTime? lastUpdated;

  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
        currentPrice: Map.from(json["current_price"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        totalValueLocked: json["total_value_locked"],
        mcapToTvlRatio: json["mcap_to_tvl_ratio"],
        fdvToTvlRatio: json["fdv_to_tvl_ratio"],
        roi: json["roi"],
        ath: Map.from(json["ath"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        athChangePercentage: Map.from(json["ath_change_percentage"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        athDate: Map.from(json["ath_date"]!)
            .map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        atl: Map.from(json["atl"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        atlChangePercentage: Map.from(json["atl_change_percentage"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        atlDate: Map.from(json["atl_date"]!)
            .map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        marketCap: Map.from(json["market_cap"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: Map.from(json["fully_diluted_valuation"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        totalVolume: Map.from(json["total_volume"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        high24H: Map.from(json["high_24h"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        low24H: Map.from(json["low_24h"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChange24H: json["price_change_24h"]?.toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"]?.toDouble(),
        priceChangePercentage7D: json["price_change_percentage_7d"]?.toDouble(),
        priceChangePercentage14D:
            json["price_change_percentage_14d"]?.toDouble(),
        priceChangePercentage30D:
            json["price_change_percentage_30d"]?.toDouble(),
        priceChangePercentage60D:
            json["price_change_percentage_60d"]?.toDouble(),
        priceChangePercentage200D:
            json["price_change_percentage_200d"]?.toDouble(),
        priceChangePercentage1Y: json["price_change_percentage_1y"]?.toDouble(),
        marketCapChange24H: json["market_cap_change_24h"]?.toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"]?.toDouble(),
        priceChange24HInCurrency:
            Map.from(json["price_change_24h_in_currency"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage1HInCurrency:
            Map.from(json["price_change_percentage_1h_in_currency"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage24HInCurrency:
            Map.from(json["price_change_percentage_24h_in_currency"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage7DInCurrency:
            Map.from(json["price_change_percentage_7d_in_currency"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage14DInCurrency:
            Map.from(json["price_change_percentage_14d_in_currency"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage30DInCurrency:
            Map.from(json["price_change_percentage_30d_in_currency"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage60DInCurrency:
            Map.from(json["price_change_percentage_60d_in_currency"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage200DInCurrency:
            Map.from(json["price_change_percentage_200d_in_currency"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        priceChangePercentage1YInCurrency:
            Map.from(json["price_change_percentage_1y_in_currency"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        marketCapChange24HInCurrency:
            Map.from(json["market_cap_change_24h_in_currency"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        marketCapChangePercentage24HInCurrency:
            Map.from(json["market_cap_change_percentage_24h_in_currency"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        circulatingSupply: json["circulating_supply"],
        lastUpdated: json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "current_price": Map.from(currentPrice!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_value_locked": totalValueLocked,
        "mcap_to_tvl_ratio": mcapToTvlRatio,
        "fdv_to_tvl_ratio": fdvToTvlRatio,
        "roi": roi,
        "ath": Map.from(ath!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ath_change_percentage": Map.from(athChangePercentage!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ath_date": Map.from(athDate!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        "atl": Map.from(atl!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "atl_change_percentage": Map.from(atlChangePercentage!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "atl_date": Map.from(atlDate!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        "market_cap":
            Map.from(marketCap!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_rank": marketCapRank,
        "fully_diluted_valuation": Map.from(fullyDilutedValuation!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_volume": Map.from(totalVolume!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "high_24h":
            Map.from(high24H!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "low_24h":
            Map.from(low24H!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "price_change_percentage_7d": priceChangePercentage7D,
        "price_change_percentage_14d": priceChangePercentage14D,
        "price_change_percentage_30d": priceChangePercentage30D,
        "price_change_percentage_60d": priceChangePercentage60D,
        "price_change_percentage_200d": priceChangePercentage200D,
        "price_change_percentage_1y": priceChangePercentage1Y,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "price_change_24h_in_currency": Map.from(priceChange24HInCurrency!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1h_in_currency":
            Map.from(priceChangePercentage1HInCurrency!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_24h_in_currency":
            Map.from(priceChangePercentage24HInCurrency!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_7d_in_currency":
            Map.from(priceChangePercentage7DInCurrency!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_14d_in_currency":
            Map.from(priceChangePercentage14DInCurrency!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_30d_in_currency":
            Map.from(priceChangePercentage30DInCurrency!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_60d_in_currency":
            Map.from(priceChangePercentage60DInCurrency!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_200d_in_currency":
            Map.from(priceChangePercentage200DInCurrency!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1y_in_currency":
            Map.from(priceChangePercentage1YInCurrency!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_change_24h_in_currency":
            Map.from(marketCapChange24HInCurrency!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_change_percentage_24h_in_currency":
            Map.from(marketCapChangePercentage24HInCurrency!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "circulating_supply": circulatingSupply,
        "last_updated": lastUpdated?.toIso8601String(),
      };
}

class Platforms {
  Platforms({
    this.empty,
  });

  String? empty;

  factory Platforms.fromJson(Map<String, dynamic> json) => Platforms(
        empty: json[""],
      );

  Map<String, dynamic> toJson() => {
        "": empty,
      };
}

class PublicInterestStats {
  PublicInterestStats({
    this.alexaRank,
    this.bingMatches,
  });

  int? alexaRank;
  dynamic bingMatches;

  factory PublicInterestStats.fromJson(Map<String, dynamic> json) =>
      PublicInterestStats(
        alexaRank: json["alexa_rank"],
        bingMatches: json["bing_matches"],
      );

  Map<String, dynamic> toJson() => {
        "alexa_rank": alexaRank,
        "bing_matches": bingMatches,
      };
}
