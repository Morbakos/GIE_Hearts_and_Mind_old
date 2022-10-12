richAssets[] = {
  "20220809153229_1", "20220809153257_1", "20220809153307_1",
  "20220809155140_1", "20220809155414_1", "20220809160225_1",
  "20220809160909_1", "20220809160915_1", "20220809160932_1",
  "20220809161344_1", "20220809162930_1", "20220809162937_1",
  "20220809163001_1", "20220809163405_1", "20220809163429_1",
  "20220809163441_1", "20220809164500_1", "20220809164515_1",
  "20220809164521_1", "20220809223022_1", "20220809223532_1",
  "20220809223548_1", "20220809223603_1", "20220809224145_1",
  "20220809224741_1", "20220809224752_1", "20220809225801_1",
  "20220809225809_1", "20220809225956_1", "20220809230054_1",
  "20220809230320_1", "20220809230326_1", "20220809230338_1",
  "20220809231251_1", "20220809231303_1", "20220809231903_1",
  "20220809231925_1", "20220809231935_1", "20220810163054_1",
  "20220810163135_1", "20220810163217_1", "20220810170205_1",
  "20220810170254_1", "20220810170342_1", "20220810170358_1",
  "20220810170504_1", "20220810170940_1", "20220810171008_1",
  "20220810171159_1", "20220810171613_1", "20220810171749_1",
  "20220810171806_1", "20220829141021_1", "20220829141034_1",
  "20220829141036_1", "20220829142630_1", "20220829142638_1",
  "20220829142700_1", "20220829142710_1", "20220829143043_1",
  "20220829145436_1", "20220829145442_1", "20220829145509_1",
  "20220829145538_1", "20220829145557_1", "20220829154335_1",
  "20220829154348_1", "20220829154405_1", "20220829155516_1",
  "20220829155522_1", "20220829155531_1", "20220829155542_1",
  "20220829155555_1", "20220829155604_1", "20220830182850_1",
  "20220830182931_1", "20220830182947_1", "20220830183018_1"
};

class CfgDiscordRichPresence {
    applicationID = "510077934934032386";             // Provided by discord
    defaultDetails = "test";            // Upper text
    defaultState = "test2";              // Lower text
    defaultLargeImageKey = __EVAL(call compile "selectRandom (getMissionConfigValue [""richAssets"", []])");      // Large image
    defaultLargeImageText = "myImg1 hover";     // Large image hover text
    defaultSmallImageKey = __EVAL(call compile "selectRandom (getMissionConfigValue [""richAssets"", []])");      // Small image
    defaultSmallImageText = "myImg2 hover";     // Small image hover text
    defaultButtons[] = {};		  // Button texts and urls
    useTimeElapsed = 1;             // Show time elapsed since the player connected (1 - true, 0 - false)
};