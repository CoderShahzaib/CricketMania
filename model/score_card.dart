class ScoreCard {
  ScoreCard({
    required this.scoreCard,
    required this.matchHeader,
    required this.isMatchComplete,
    required this.status,
    required this.videos,
    required this.responseLastUpdated,
  });

  final List<ScoreCardElement> scoreCard;
  final MatchHeader? matchHeader;
  final bool? isMatchComplete;
  final String? status;
  final List<dynamic> videos;
  final int? responseLastUpdated;

  factory ScoreCard.fromJson(Map<String, dynamic> json) {
    return ScoreCard(
      scoreCard: json["scoreCard"] == null
          ? []
          : List<ScoreCardElement>.from(
              json["scoreCard"]!.map((x) => ScoreCardElement.fromJson(x))),
      matchHeader: json["matchHeader"] == null
          ? null
          : MatchHeader.fromJson(json["matchHeader"]),
      isMatchComplete: json["isMatchComplete"],
      status: json["status"],
      videos: json["videos"] == null
          ? []
          : List<dynamic>.from(json["videos"]!.map((x) => x)),
      responseLastUpdated: json["responseLastUpdated"],
    );
  }
}

class MatchHeader {
  MatchHeader({
    required this.matchId,
    required this.matchDescription,
    required this.matchFormat,
    required this.matchType,
    required this.complete,
    required this.domestic,
    required this.matchStartTimestamp,
    required this.matchCompleteTimestamp,
    required this.dayNight,
    required this.year,
    required this.dayNumber,
    required this.state,
    required this.status,
    required this.tossResults,
    required this.result,
    required this.revisedTarget,
    required this.playersOfTheMatch,
    required this.playersOfTheSeries,
    required this.matchTeamInfo,
    required this.isMatchNotCovered,
    required this.team1,
    required this.team2,
    required this.seriesDesc,
    required this.seriesId,
    required this.seriesName,
    required this.alertType,
    required this.livestreamEnabled,
  });

  final int? matchId;
  final String? matchDescription;
  final String? matchFormat;
  final String? matchType;
  final bool? complete;
  final bool? domestic;
  final int? matchStartTimestamp;
  final int? matchCompleteTimestamp;
  final bool? dayNight;
  final int? year;
  final int? dayNumber;
  final String? state;
  final String? status;
  final RevisedTarget? tossResults;
  final Result? result;
  final RevisedTarget? revisedTarget;
  final List<PlayersOfThe> playersOfTheMatch;
  final List<PlayersOfThe> playersOfTheSeries;
  final List<MatchTeamInfo> matchTeamInfo;
  final bool? isMatchNotCovered;
  final Team? team1;
  final Team? team2;
  final String? seriesDesc;
  final int? seriesId;
  final String? seriesName;
  final String? alertType;
  final bool? livestreamEnabled;

  factory MatchHeader.fromJson(Map<String, dynamic> json) {
    return MatchHeader(
      matchId: json["matchId"],
      matchDescription: json["matchDescription"],
      matchFormat: json["matchFormat"],
      matchType: json["matchType"],
      complete: json["complete"],
      domestic: json["domestic"],
      matchStartTimestamp: json["matchStartTimestamp"],
      matchCompleteTimestamp: json["matchCompleteTimestamp"],
      dayNight: json["dayNight"],
      year: json["year"],
      dayNumber: json["dayNumber"],
      state: json["state"],
      status: json["status"],
      tossResults: json["tossResults"] == null
          ? null
          : RevisedTarget.fromJson(json["tossResults"]),
      result: json["result"] == null ? null : Result.fromJson(json["result"]),
      revisedTarget: json["revisedTarget"] == null
          ? null
          : RevisedTarget.fromJson(json["revisedTarget"]),
      playersOfTheMatch: json["playersOfTheMatch"] == null
          ? []
          : List<PlayersOfThe>.from(
              json["playersOfTheMatch"]!.map((x) => PlayersOfThe.fromJson(x))),
      playersOfTheSeries: json["playersOfTheSeries"] == null
          ? []
          : List<PlayersOfThe>.from(
              json["playersOfTheSeries"]!.map((x) => PlayersOfThe.fromJson(x))),
      matchTeamInfo: json["matchTeamInfo"] == null
          ? []
          : List<MatchTeamInfo>.from(
              json["matchTeamInfo"]!.map((x) => MatchTeamInfo.fromJson(x))),
      isMatchNotCovered: json["isMatchNotCovered"],
      team1: json["team1"] == null ? null : Team.fromJson(json["team1"]),
      team2: json["team2"] == null ? null : Team.fromJson(json["team2"]),
      seriesDesc: json["seriesDesc"],
      seriesId: json["seriesId"],
      seriesName: json["seriesName"],
      alertType: json["alertType"],
      livestreamEnabled: json["livestreamEnabled"],
    );
  }
}

class MatchTeamInfo {
  MatchTeamInfo({
    required this.battingTeamId,
    required this.battingTeamShortName,
    required this.bowlingTeamId,
    required this.bowlingTeamShortName,
  });

  final int? battingTeamId;
  final String? battingTeamShortName;
  final int? bowlingTeamId;
  final String? bowlingTeamShortName;

  factory MatchTeamInfo.fromJson(Map<String, dynamic> json) {
    return MatchTeamInfo(
      battingTeamId: json["battingTeamId"],
      battingTeamShortName: json["battingTeamShortName"],
      bowlingTeamId: json["bowlingTeamId"],
      bowlingTeamShortName: json["bowlingTeamShortName"],
    );
  }
}

class PlayersOfThe {
  PlayersOfThe({
    required this.id,
    required this.name,
    required this.fullName,
    required this.nickName,
    required this.captain,
    required this.role,
    required this.keeper,
    required this.substitute,
    required this.teamId,
    required this.battingStyle,
    required this.bowlingStyle,
    required this.teamName,
    required this.faceImageId,
  });

  final int? id;
  final String? name;
  final String? fullName;
  final String? nickName;
  final bool? captain;
  final String? role;
  final bool? keeper;
  final bool? substitute;
  final int? teamId;
  final String? battingStyle;
  final String? bowlingStyle;
  final String? teamName;
  final int? faceImageId;

  factory PlayersOfThe.fromJson(Map<String, dynamic> json) {
    return PlayersOfThe(
      id: json["id"],
      name: json["name"],
      fullName: json["fullName"],
      nickName: json["nickName"],
      captain: json["captain"],
      role: json["role"],
      keeper: json["keeper"],
      substitute: json["substitute"],
      teamId: json["teamId"],
      battingStyle: json["battingStyle"],
      bowlingStyle: json["bowlingStyle"],
      teamName: json["teamName"],
      faceImageId: json["faceImageId"],
    );
  }
}

class Result {
  Result({
    required this.resultType,
    required this.winningTeam,
    required this.winningteamId,
    required this.winningMargin,
    required this.winByRuns,
    required this.winByInnings,
  });

  final String? resultType;
  final String? winningTeam;
  final int? winningteamId;
  final int? winningMargin;
  final bool? winByRuns;
  final bool? winByInnings;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      resultType: json["resultType"],
      winningTeam: json["winningTeam"],
      winningteamId: json["winningteamId"],
      winningMargin: json["winningMargin"],
      winByRuns: json["winByRuns"],
      winByInnings: json["winByInnings"],
    );
  }
}

class RevisedTarget {
  RevisedTarget({required this.json});
  final Map<String, dynamic> json;

  factory RevisedTarget.fromJson(Map<String, dynamic> json) {
    return RevisedTarget(json: json);
  }
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.playerDetails,
    required this.shortName,
  });

  final int? id;
  final String? name;
  final List<dynamic> playerDetails;
  final String? shortName;

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"],
      name: json["name"],
      playerDetails: json["playerDetails"] == null
          ? []
          : List<dynamic>.from(json["playerDetails"]!.map((x) => x)),
      shortName: json["shortName"],
    );
  }
}

class ScoreCardElement {
  ScoreCardElement({
    required this.matchId,
    required this.inningsId,
    required this.timeScore,
    required this.batTeamDetails,
    required this.bowlTeamDetails,
    required this.scoreDetails,
    required this.extrasData,
    required this.ppData,
    required this.wicketsData,
    required this.partnershipsData,
  });

  final int? matchId;
  final int? inningsId;
  final int? timeScore;
  final BatTeamDetails? batTeamDetails;
  final BowlTeamDetails? bowlTeamDetails;
  final ScoreDetails? scoreDetails;
  final ExtrasData? extrasData;
  final RevisedTarget? ppData;
  final Map<String, WicketsDatum> wicketsData;
  final Map<String, PartnershipsDatum> partnershipsData;

  factory ScoreCardElement.fromJson(Map<String, dynamic> json) {
    return ScoreCardElement(
      matchId: json["matchId"],
      inningsId: json["inningsId"],
      timeScore: json["timeScore"],
      batTeamDetails: json["batTeamDetails"] == null
          ? null
          : BatTeamDetails.fromJson(json["batTeamDetails"]),
      bowlTeamDetails: json["bowlTeamDetails"] == null
          ? null
          : BowlTeamDetails.fromJson(json["bowlTeamDetails"]),
      scoreDetails: json["scoreDetails"] == null
          ? null
          : ScoreDetails.fromJson(json["scoreDetails"]),
      extrasData: json["extrasData"] == null
          ? null
          : ExtrasData.fromJson(json["extrasData"]),
      ppData: json["ppData"] == null
          ? null
          : RevisedTarget.fromJson(json["ppData"]),
      wicketsData: Map.from(json["wicketsData"]).map((k, v) =>
          MapEntry<String, WicketsDatum>(k, WicketsDatum.fromJson(v))),
      partnershipsData: Map.from(json["partnershipsData"]).map((k, v) =>
          MapEntry<String, PartnershipsDatum>(
              k, PartnershipsDatum.fromJson(v))),
    );
  }
}

class BatTeamDetails {
  BatTeamDetails({
    required this.batTeamId,
    required this.batTeamName,
    required this.batTeamShortName,
    required this.batsmenData,
  });

  final int? batTeamId;
  final String? batTeamName;
  final String? batTeamShortName;
  final Map<String, BatsmenDatum> batsmenData;

  factory BatTeamDetails.fromJson(Map<String, dynamic> json) {
    return BatTeamDetails(
      batTeamId: json["batTeamId"],
      batTeamName: json["batTeamName"],
      batTeamShortName: json["batTeamShortName"],
      batsmenData: Map.from(json["batsmenData"]).map((k, v) =>
          MapEntry<String, BatsmenDatum>(k, BatsmenDatum.fromJson(v))),
    );
  }
}

class BatsmenDatum {
  BatsmenDatum({
    required this.batId,
    required this.batName,
    required this.batShortName,
    required this.isCaptain,
    required this.isKeeper,
    required this.runs,
    required this.balls,
    required this.dots,
    required this.fours,
    required this.sixes,
    required this.mins,
    required this.strikeRate,
    required this.outDesc,
    required this.bowlerId,
    required this.fielderId1,
    required this.fielderId2,
    required this.fielderId3,
    required this.ones,
    required this.twos,
    required this.threes,
    required this.fives,
    required this.boundaries,
    required this.sixers,
    required this.wicketCode,
    required this.isOverseas,
    required this.inMatchChange,
    required this.playingXiChange,
  });

  final int? batId;
  final String? batName;
  final String? batShortName;
  final bool? isCaptain;
  final bool? isKeeper;
  final int? runs;
  final int? balls;
  final int? dots;
  final int? fours;
  final int? sixes;
  final int? mins;
  final double? strikeRate;
  final String? outDesc;
  final int? bowlerId;
  final int? fielderId1;
  final int? fielderId2;
  final int? fielderId3;
  final int? ones;
  final int? twos;
  final int? threes;
  final int? fives;
  final int? boundaries;
  final int? sixers;
  final String? wicketCode;
  final bool? isOverseas;
  final String? inMatchChange;
  final String? playingXiChange;

  factory BatsmenDatum.fromJson(Map<String, dynamic> json) {
    return BatsmenDatum(
      batId: json["batId"],
      batName: json["batName"],
      batShortName: json["batShortName"],
      isCaptain: json["isCaptain"],
      isKeeper: json["isKeeper"],
      runs: json["runs"],
      balls: json["balls"],
      dots: json["dots"],
      fours: json["fours"],
      sixes: json["sixes"],
      mins: json["mins"],
      strikeRate: json["strikeRate"],
      outDesc: json["outDesc"],
      bowlerId: json["bowlerId"],
      fielderId1: json["fielderId1"],
      fielderId2: json["fielderId2"],
      fielderId3: json["fielderId3"],
      ones: json["ones"],
      twos: json["twos"],
      threes: json["threes"],
      fives: json["fives"],
      boundaries: json["boundaries"],
      sixers: json["sixers"],
      wicketCode: json["wicketCode"],
      isOverseas: json["isOverseas"],
      inMatchChange: json["inMatchChange"],
      playingXiChange: json["playingXIChange"],
    );
  }
}

class BowlTeamDetails {
  BowlTeamDetails({
    required this.bowlTeamId,
    required this.bowlTeamName,
    required this.bowlTeamShortName,
    required this.bowlersData,
  });

  final int? bowlTeamId;
  final String? bowlTeamName;
  final String? bowlTeamShortName;
  final BowlersData? bowlersData;

  factory BowlTeamDetails.fromJson(Map<String, dynamic> json) {
    return BowlTeamDetails(
      bowlTeamId: json["bowlTeamId"],
      bowlTeamName: json["bowlTeamName"],
      bowlTeamShortName: json["bowlTeamShortName"],
      bowlersData: json["bowlersData"] == null
          ? null
          : BowlersData.fromJson(json["bowlersData"]),
    );
  }
}

class BowlersData {
  BowlersData({required this.bowlers});

  final List<Bowl> bowlers;

  factory BowlersData.fromJson(Map<String, dynamic> json) {
    List<Bowl> parsedBowlers = [];
    json.forEach((key, value) {
      if (key.startsWith("bowl_") && value != null) {
        parsedBowlers.add(Bowl.fromJson(value));
      }
    });

    return BowlersData(bowlers: parsedBowlers);
  }
}

class Bowl {
  Bowl({
    required this.bowlerId,
    required this.bowlName,
    required this.bowlShortName,
    required this.isCaptain,
    required this.isKeeper,
    required this.overs,
    required this.maidens,
    required this.runs,
    required this.wickets,
    required this.economy,
    required this.noBalls,
    required this.wides,
    required this.dots,
    required this.balls,
    required this.runsPerBall,
    required this.isOverseas,
    required this.inMatchChange,
    required this.playingXiChange,
  });

  final int? bowlerId;
  final String? bowlName;
  final String? bowlShortName;
  final bool? isCaptain;
  final bool? isKeeper;
  final double? overs;
  final int? maidens;
  final int? runs;
  final int? wickets;
  final double? economy;
  final int? noBalls;
  final int? wides;
  final int? dots;
  final int? balls;
  final double? runsPerBall;
  final bool? isOverseas;
  final String? inMatchChange;
  final String? playingXiChange;

  factory Bowl.fromJson(Map<String, dynamic> json) {
    return Bowl(
      bowlerId: json["bowlerId"],
      bowlName: json["bowlName"],
      bowlShortName: json["bowlShortName"],
      isCaptain: json["isCaptain"],
      isKeeper: json["isKeeper"],
      overs: json["overs"],
      maidens: json["maidens"],
      runs: json["runs"],
      wickets: json["wickets"],
      economy: json["economy"],
      noBalls: json["no_balls"],
      wides: json["wides"],
      dots: json["dots"],
      balls: json["balls"],
      runsPerBall: json["runsPerBall"],
      isOverseas: json["isOverseas"],
      inMatchChange: json["inMatchChange"],
      playingXiChange: json["playingXIChange"],
    );
  }
}

class ExtrasData {
  ExtrasData({
    required this.noBalls,
    required this.total,
    required this.byes,
    required this.penalty,
    required this.wides,
    required this.legByes,
  });

  final int? noBalls;
  final int? total;
  final int? byes;
  final int? penalty;
  final int? wides;
  final int? legByes;

  factory ExtrasData.fromJson(Map<String, dynamic> json) {
    return ExtrasData(
      noBalls: json["noBalls"],
      total: json["total"],
      byes: json["byes"],
      penalty: json["penalty"],
      wides: json["wides"],
      legByes: json["legByes"],
    );
  }
}

class PartnershipsDatum {
  PartnershipsDatum({
    required this.bat1Id,
    required this.bat1Name,
    required this.bat1Runs,
    required this.bat1Fours,
    required this.bat1Sixes,
    required this.bat2Id,
    required this.bat2Name,
    required this.bat2Runs,
    required this.bat2Fours,
    required this.bat2Sixes,
    required this.totalRuns,
    required this.totalBalls,
    required this.bat1Balls,
    required this.bat2Balls,
    required this.bat1Ones,
    required this.bat1Twos,
    required this.bat1Threes,
    required this.bat1Fives,
    required this.bat1Boundaries,
    required this.bat1Sixers,
    required this.bat2Ones,
    required this.bat2Twos,
    required this.bat2Threes,
    required this.bat2Fives,
    required this.bat2Boundaries,
    required this.bat2Sixers,
  });

  final int? bat1Id;
  final String? bat1Name;
  final int? bat1Runs;
  final int? bat1Fours;
  final int? bat1Sixes;
  final int? bat2Id;
  final String? bat2Name;
  final int? bat2Runs;
  final int? bat2Fours;
  final int? bat2Sixes;
  final int? totalRuns;
  final int? totalBalls;
  final int? bat1Balls;
  final int? bat2Balls;
  final int? bat1Ones;
  final int? bat1Twos;
  final int? bat1Threes;
  final int? bat1Fives;
  final int? bat1Boundaries;
  final int? bat1Sixers;
  final int? bat2Ones;
  final int? bat2Twos;
  final int? bat2Threes;
  final int? bat2Fives;
  final int? bat2Boundaries;
  final int? bat2Sixers;

  factory PartnershipsDatum.fromJson(Map<String, dynamic> json) {
    return PartnershipsDatum(
      bat1Id: json["bat1Id"],
      bat1Name: json["bat1Name"],
      bat1Runs: json["bat1Runs"],
      bat1Fours: json["bat1fours"],
      bat1Sixes: json["bat1sixes"],
      bat2Id: json["bat2Id"],
      bat2Name: json["bat2Name"],
      bat2Runs: json["bat2Runs"],
      bat2Fours: json["bat2fours"],
      bat2Sixes: json["bat2sixes"],
      totalRuns: json["totalRuns"],
      totalBalls: json["totalBalls"],
      bat1Balls: json["bat1balls"],
      bat2Balls: json["bat2balls"],
      bat1Ones: json["bat1Ones"],
      bat1Twos: json["bat1Twos"],
      bat1Threes: json["bat1Threes"],
      bat1Fives: json["bat1Fives"],
      bat1Boundaries: json["bat1Boundaries"],
      bat1Sixers: json["bat1Sixers"],
      bat2Ones: json["bat2Ones"],
      bat2Twos: json["bat2Twos"],
      bat2Threes: json["bat2Threes"],
      bat2Fives: json["bat2Fives"],
      bat2Boundaries: json["bat2Boundaries"],
      bat2Sixers: json["bat2Sixers"],
    );
  }
}

class ScoreDetails {
  ScoreDetails({
    required this.ballNbr,
    required this.isDeclared,
    required this.isFollowOn,
    required this.overs,
    required this.revisedOvers,
    required this.runRate,
    required this.runs,
    required this.wickets,
    required this.runsPerBall,
  });

  final int? ballNbr;
  final bool? isDeclared;
  final bool? isFollowOn;
  final double? overs;
  final int? revisedOvers;
  final double? runRate;
  final int? runs;
  final int? wickets;
  final double? runsPerBall;

  factory ScoreDetails.fromJson(Map<String, dynamic> json) {
    return ScoreDetails(
      ballNbr: json["ballNbr"],
      isDeclared: json["isDeclared"],
      isFollowOn: json["isFollowOn"],
      overs: json["overs"],
      revisedOvers: json["revisedOvers"],
      runRate: json["runRate"],
      runs: json["runs"],
      wickets: json["wickets"],
      runsPerBall: json["runsPerBall"],
    );
  }
}

class WicketsDatum {
  WicketsDatum({
    required this.batId,
    required this.batName,
    required this.wktNbr,
    required this.wktOver,
    required this.wktRuns,
    required this.ballNbr,
  });

  final int? batId;
  final String? batName;
  final int? wktNbr;
  final double? wktOver;
  final int? wktRuns;
  final int? ballNbr;

  factory WicketsDatum.fromJson(Map<String, dynamic> json) {
    return WicketsDatum(
      batId: json["batId"],
      batName: json["batName"],
      wktNbr: json["wktNbr"],
      wktOver: json["wktOver"],
      wktRuns: json["wktRuns"],
      ballNbr: json["ballNbr"],
    );
  }
}
