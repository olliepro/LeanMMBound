import CheckedIndexTable
import SuppliedHierarchyParentData
import FiniteIndexBlockComposition

/-! Complete source hierarchy lookup, including the exact absent support entries. -/
namespace MatrixBounds.Numeric.SuppliedNodeLookup
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- Original grid codes beginning at row-major position 0. -/
def leaf000 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    946,947,0,0,0,0,0,0,0,948,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,949,950,951,0,0,0,0,0,0,952,2,3,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,953,954,955,956,0,0,
    0,0,0,957,4,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 128. -/
def leaf001 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,0,958,959,960,961,962,0,0,0,0,963,7,8,9,10,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,964,965,966,967,968,969,0,0,0,970,11,12,
    13,14,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,971,972,973,974,975,976,977,0,0,978,16,17,18,19,20,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 256. -/
def leaf002 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,979,980,981,982,983,984,985,986,0,987,22,23,24,25,26,27,988,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,989,990,991,992,
    993,994,995,996,997,28,29,30,31,32,33,998,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,999,1000,1001,1002,1003,1004,1005,0,34,35,36,37,38,39,1006,0,0,0,0,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 384. -/
def leaf003 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1007,1008,1009,1010,1011,1012,0,0,
    40,41,42,43,44,1013,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,1014,1015,1016,1017,1018,0,0,0,45,46,47,48,1019,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1020,1021,1022,1023,0,0,0,0,49,50,51,1024
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 512. -/
def leaf004 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,1025,1026,1027,0,0,0,0,0,52,53,1028,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1029,1030,0,0,0,0,0,0,54,1031,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1032,1033,0,0,0,0,0,0,0,1034
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 640. -/
def leaf005 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    55,0,0,0,0,0,0,1035,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,1036,1037,1038,0,0,0,0,0,0,1039,57,58,0,0,0,0,0,1040,59,60,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1041,1042,1043,1044,0,0,0,0,0,1045,61,62,63,0,0,0,
    0,1046,64,65,66,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1047,1048,1049
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 768. -/
def leaf006 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    1050,1051,0,0,0,0,1052,67,68,69,70,0,0,0,1053,71,72,73,74,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,1054,1055,1056,1057,1058,1059,0,0,0,1060,75,76,77,78,79,0,0,1061,80,81,82,83,
    84,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1062,1063,1064,1065,1066,1067,1068,0,0,
    1069,85,86,87,88,89,90,0,1070,91,92,93,94,95,1071,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 896. -/
def leaf007 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,1072,1073,1074,1075,1076,1077,1078,0,1079,96,97,98,99,100,101,1080,1081,102,103,104,105,106,1082,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1083,1084,1085,1086,1087,1088,1089,0,107,108,109,110,111,
    112,1090,1091,113,114,115,116,117,1092,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,1093,1094,1095,1096,1097,1098,0,0,118,119,120,121,122,1099,0,123,124,125,126,127,1100,0,0,0,0,0,0,0,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 1024. -/
def leaf008 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1101,1102,1103,1104,1105,0,0,0,128,129,130,131,1106,0,0,132,133,
    134,135,1107,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1108,1109,1110,
    1111,0,0,0,0,136,137,138,1112,0,0,0,139,140,141,1113,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,1114,1115,1116,0,0,0,0,0,142,143,1117,0,0,0,0,144,145,1118,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 1152. -/
def leaf009 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1119,1120,0,0,0,0,0,
    0,146,1121,0,0,0,0,0,147,1122,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1123,
    1124,0,0,0,0,0,0,0,1125,148,0,0,0,0,0,0,1126,149,0,0,0,0,0,1127,150,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,1128,1129,1130,0,0,0,0,0,0,1131,151,152,0,0,0,0,0,1132,153,154
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 1280. -/
def leaf010 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,1133,155,156,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1134,1135,1136,1137,0,0,0,
    0,0,1138,157,158,159,0,0,0,0,1139,160,161,162,0,0,0,1140,163,164,165,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,1141,1142,1143,1144,1145,0,0,0,0,1146,166,167,168,169,0,0,0,1147,170,171,172,173,0,0,1148,174,
    175,176,177,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1149,1150,1151,1152,1153,1154,0,0,0,1155,178,179,180
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 1408. -/
def leaf011 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    181,182,0,0,1156,183,184,185,186,187,0,1157,188,189,190,191,1158,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,1159,1160,1161,1162,1163,1164,0,0,1165,192,193,194,195,196,197,0,1166,198,199,200,201,202,1167,1168,203,204,205,206,1169,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1170,1171,1172,1173,1174,1175,0,0,207,208,209,210,211,212,1176,1177,213,
    214,215,216,217,1178,1179,218,219,220,221,1180,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1181,1182,1183
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 1536. -/
def leaf012 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    1184,1185,1186,0,0,222,223,224,225,226,1187,0,227,228,229,230,231,1188,1189,232,233,234,235,1190,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,1191,1192,1193,1194,1195,0,0,0,236,237,238,239,1196,0,0,240,241,242,243,1197,0,
    244,245,246,247,1198,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1199,1200,1201,1202,0,0,0,
    0,248,249,250,1203,0,0,0,251,252,253,1204,0,0,254,255,256,1205,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 1664. -/
def leaf013 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,0,1206,1207,1208,0,0,0,0,0,257,258,1209,0,0,0,0,259,260,1210,0,0,0,261,262,1211,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1212,1213,0,0,0,0,0,0,263,1214,0,
    0,0,0,0,264,1215,0,0,0,0,265,1216,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1217,1218,0,0,0,
    0,0,0,0,1219,266,0,0,0,0,0,0,1220,267,0,0,0,0,0,1221,268,0,0,0,0,1222,269,0,0,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 1792. -/
def leaf014 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,0,0,1223,1224,1225,0,0,0,0,0,0,1226,270,271,0,0,0,0,0,1227,272,273,0,0,0,0,
    1228,274,275,0,0,0,1229,276,277,0,0,0,0,0,0,0,0,0,0,0,0,1230,1231,1232,1233,0,0,0,0,0,1234,278,
    279,280,0,0,0,0,1235,281,282,283,0,0,0,1236,284,285,286,0,0,1237,287,288,289,0,0,0,0,0,0,0,0,0,
    0,0,1238,1239,1240,1241,1242,0,0,0,0,1243,290,291,292,293,0,0,0,1244,294,295,296,297,0,0,1245,298,299,300,301,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 1920. -/
def leaf015 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    1246,302,303,304,1247,0,0,0,0,0,0,0,0,0,0,0,1248,1249,1250,1251,1252,0,0,0,1253,305,306,307,308,309,0,0,
    1254,310,311,312,313,314,0,1255,315,316,317,318,1256,1257,319,320,321,1258,0,0,0,0,0,0,0,0,0,0,0,0,1259,1260,
    1261,1262,1263,0,0,0,322,323,324,325,326,327,0,1264,328,329,330,331,332,1265,1266,333,334,335,336,1267,1268,337,338,339,1269,0,
    0,0,0,0,0,0,0,0,0,0,0,0,1270,1271,1272,1273,1274,0,0,0,340,341,342,343,344,1275,0,345,346,347,348,349
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 2048. -/
def leaf016 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    1276,1277,350,351,352,353,1278,1279,354,355,356,1280,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1281,1282,1283,1284,1285,0,
    0,0,357,358,359,360,1286,0,0,361,362,363,364,1287,0,365,366,367,368,1288,1289,369,370,371,1290,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,1291,1292,1293,1294,0,0,0,0,372,373,374,1295,0,0,0,375,376,377,1296,0,0,378,379,380,
    1297,0,381,382,383,1298,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1299,1300,1301,0,0,0,0,0,384,385
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 2176. -/
def leaf017 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    1302,0,0,0,0,386,387,1303,0,0,0,388,389,1304,0,0,390,391,1305,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,1306,1307,0,0,0,0,0,0,392,1308,0,0,0,0,0,393,1309,0,0,0,0,394,1310,0,0,0,395,1311,
    0,0,0,0,0,0,0,0,0,0,1312,1313,0,0,0,0,0,0,0,1314,396,0,0,0,0,0,0,1315,397,0,0,0,
    0,0,1316,398,0,0,0,0,1317,399,0,0,0,1318,400,0,0,0,0,0,0,0,0,1319,1320,1321,0,0,0,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 2304. -/
def leaf018 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    1322,401,402,0,0,0,0,0,1323,403,404,0,0,0,0,1324,405,406,0,0,0,1325,407,408,0,0,1326,409,410,0,0,0,
    0,0,0,0,1327,1328,1329,1330,0,0,0,0,0,1331,411,412,413,0,0,0,0,1332,414,415,416,0,0,0,1333,417,418,419,
    0,0,1334,420,421,422,0,1335,423,424,1336,0,0,0,0,0,0,0,1337,1338,1339,1340,0,0,0,0,1341,425,426,427,428,0,
    0,0,1342,429,430,431,432,0,0,1343,433,434,435,436,0,1344,437,438,439,1345,1346,440,441,1347,0,0,0,0,0,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 2432. -/
def leaf019 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    1348,1349,1350,1351,0,0,0,0,442,443,444,445,446,0,0,1352,447,448,449,450,451,0,1353,452,453,454,455,1354,1355,456,457,458,
    1356,1357,459,460,1358,0,0,0,0,0,0,0,0,0,1359,1360,1361,1362,0,0,0,0,461,462,463,464,465,0,0,466,467,468,
    469,470,1363,1364,471,472,473,474,1365,1366,475,476,477,1367,1368,478,479,1369,0,0,0,0,0,0,0,0,0,0,1370,1371,1372,1373,
    0,0,0,0,480,481,482,483,1374,0,0,484,485,486,487,1375,0,488,489,490,491,1376,1377,492,493,494,1378,1379,495,496,1380,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 2560. -/
def leaf020 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,0,0,0,0,1381,1382,1383,1384,0,0,0,0,497,498,499,1385,0,0,0,500,501,502,1386,0,0,503,
    504,505,1387,0,506,507,508,1388,1389,509,510,1390,0,0,0,0,0,0,0,0,0,0,0,0,1391,1392,1393,0,0,0,0,0,
    511,512,1394,0,0,0,0,513,514,1395,0,0,0,515,516,1396,0,0,517,518,1397,0,519,520,1398,0,0,0,0,0,0,0,
    0,0,0,0,0,0,1399,1400,0,0,0,0,0,0,521,1401,0,0,0,0,0,522,1402,0,0,0,0,523,1403,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 2688. -/
def leaf021 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    524,1404,0,0,525,1405,0,0,0,0,0,0,1406,1407,0,0,0,0,0,0,0,1408,526,0,0,0,0,0,0,1409,527,0,
    0,0,0,0,1410,528,0,0,0,0,1411,529,0,0,0,1412,530,0,0,1413,531,0,0,0,0,1414,1415,1416,0,0,0,0,
    0,0,1417,532,533,0,0,0,0,0,1418,534,535,0,0,0,0,1419,536,537,0,0,0,1420,538,539,0,0,1421,540,541,0,
    1422,542,1423,0,0,0,0,1424,1425,1426,0,0,0,0,0,1427,543,544,545,0,0,0,0,1428,546,547,548,0,0,0,1429,549
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 2816. -/
def leaf022 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    550,551,0,0,1430,552,553,554,0,1431,555,556,1432,1433,557,1434,0,0,0,0,0,1435,1436,1437,0,0,0,0,0,558,559,560,
    561,0,0,0,1438,562,563,564,565,0,0,1439,566,567,568,569,0,1440,570,571,572,1441,1442,573,574,1443,1444,575,1445,0,0,0,
    0,0,0,1446,1447,1448,0,0,0,0,0,576,577,578,579,0,0,0,580,581,582,583,584,0,1449,585,586,587,588,1450,1451,589,
    590,591,1452,1453,592,593,1454,1455,594,1456,0,0,0,0,0,0,0,1457,1458,1459,0,0,0,0,0,595,596,597,598,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 2944. -/
def leaf023 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    599,600,601,602,1460,0,603,604,605,606,1461,1462,607,608,609,1463,1464,610,611,1465,1466,612,1467,0,0,0,0,0,0,0,0,1468,
    1469,1470,0,0,0,0,0,613,614,615,1471,0,0,0,616,617,618,1472,0,0,619,620,621,1473,0,622,623,624,1474,1475,625,626,
    1476,1477,627,1478,0,0,0,0,0,0,0,0,0,1479,1480,1481,0,0,0,0,0,628,629,1482,0,0,0,0,630,631,1483,0,
    0,0,632,633,1484,0,0,634,635,1485,0,636,637,1486,1487,638,1488,0,0,0,0,0,0,0,0,0,0,1489,1490,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 3072. -/
def leaf024 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,639,1491,0,0,0,0,0,640,1492,0,0,0,0,641,1493,0,0,0,642,1494,0,0,643,1495,0,644,1496,0,0,
    0,1497,1498,0,0,0,0,0,0,0,1499,645,0,0,0,0,0,0,1500,646,0,0,0,0,0,1501,647,0,0,0,0,1502,
    648,0,0,0,1503,649,0,0,1504,650,0,1505,1506,0,0,1507,1508,0,0,0,0,0,0,1509,651,652,0,0,0,0,0,1510,
    653,654,0,0,0,0,1511,655,656,0,0,0,1512,657,658,0,0,1513,659,660,0,1514,661,1515,1516,1517,0,0,0,1518,1519,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 3200. -/
def leaf025 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,662,663,664,0,0,0,0,1520,665,666,667,0,0,0,1521,668,669,670,0,0,1522,671,672,673,0,1523,674,
    675,1524,1525,676,1526,1527,1528,0,0,0,0,1529,1530,0,0,0,0,0,0,677,678,679,0,0,0,0,680,681,682,683,0,0,
    1531,684,685,686,687,0,1532,688,689,690,1533,1534,691,692,1535,1536,693,1537,1538,1539,0,0,0,0,0,1540,1541,0,0,0,0,0,
    0,694,695,696,0,0,0,0,697,698,699,700,0,0,701,702,703,704,1542,1543,705,706,707,1544,1545,708,709,1546,1547,710,1548,1549
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 3328. -/
def leaf026 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    1550,0,0,0,0,0,0,1551,1552,0,0,0,0,0,0,711,712,713,0,0,0,0,714,715,716,1553,0,0,717,718,719,1554,
    0,720,721,722,1555,1556,723,724,1557,1558,725,1559,1560,1561,0,0,0,0,0,0,0,1562,1563,0,0,0,0,0,0,726,727,1564,
    0,0,0,0,728,729,1565,0,0,0,730,731,1566,0,0,732,733,1567,0,734,735,1568,1569,736,1570,1571,1572,0,0,0,0,0,
    0,0,0,1573,1574,0,0,0,0,0,0,737,1575,0,0,0,0,0,738,1576,0,0,0,0,739,1577,0,0,0,740,1578,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 3456. -/
def leaf027 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,741,1579,0,742,1580,1581,1582,0,0,1583,0,0,0,0,0,0,0,1584,743,0,0,0,0,0,0,1585,744,0,0,0,0,
    0,1586,745,0,0,0,0,1587,746,0,0,0,1588,747,0,0,1589,748,0,1590,1591,1592,0,0,1593,0,0,0,0,0,0,0,
    749,750,0,0,0,0,0,1594,751,752,0,0,0,0,1595,753,754,0,0,0,1596,755,756,0,0,1597,757,758,0,1598,759,1599,
    1600,1601,1602,0,0,0,1603,0,0,0,0,0,0,0,760,761,0,0,0,0,0,762,763,764,0,0,0,1604,765,766,767,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 3584. -/
def leaf028 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,1605,768,769,770,0,1606,771,772,1607,1608,773,1609,1610,1611,1612,0,0,0,0,1613,0,0,0,0,0,0,0,774,775,0,0,
    0,0,0,776,777,778,0,0,0,779,780,781,782,0,1614,783,784,785,1615,1616,786,787,1617,1618,788,1619,1620,1621,1622,0,0,0,
    0,0,1623,0,0,0,0,0,0,0,789,790,0,0,0,0,0,791,792,793,0,0,0,794,795,796,1624,0,797,798,799,1625,
    1626,800,801,1627,1628,802,1629,1630,1631,1632,0,0,0,0,0,0,1633,0,0,0,0,0,0,0,803,804,0,0,0,0,0,805
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 3712. -/
def leaf029 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    806,1634,0,0,0,807,808,1635,0,0,809,810,1636,0,811,812,1637,1638,813,1639,1640,1641,1642,0,0,0,0,0,0,0,1643,0,
    0,0,0,0,0,0,814,1644,0,0,0,0,0,815,1645,0,0,0,0,816,1646,0,0,0,817,1647,0,0,818,1648,0,819,
    1649,1650,1651,1652,0,0,0,0,0,0,0,0,0,0,820,0,0,0,0,0,0,1653,821,0,0,0,0,0,1654,822,0,0,
    0,0,1655,823,0,0,0,1656,824,0,0,1657,825,0,1658,1659,1660,0,0,0,0,0,0,0,0,0,0,0,826,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 3840. -/
def leaf030 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,827,828,0,0,0,0,1661,829,830,0,0,0,1662,831,832,0,0,1663,833,834,0,1664,835,1665,1666,1667,1668,0,0,
    0,0,0,0,0,0,0,0,0,0,836,0,0,0,0,0,0,837,838,0,0,0,0,839,840,841,0,0,1669,842,843,844,
    0,1670,845,846,1671,1672,847,1673,1674,1675,1676,0,0,0,0,0,0,0,0,0,0,0,0,0,848,0,0,0,0,0,0,849,
    850,0,0,0,0,851,852,853,0,0,854,855,856,1677,1678,857,858,1679,1680,859,1681,1682,1683,1684,0,0,0,0,0,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 3968. -/
def leaf031 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,860,0,0,0,0,0,0,861,862,0,0,0,0,863,864,1685,0,0,865,866,1686,0,867,868,1687,1688,
    869,1689,1690,1691,1692,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,870,0,0,0,0,0,0,871,1693,0,0,0,
    0,872,1694,0,0,0,873,1695,0,0,874,1696,0,875,1697,1698,1699,1700,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,876,0,0,0,0,0,1701,877,0,0,0,0,1702,878,0,0,0,1703,879,0,0,1704,880,0,1705,1706,1707,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 4096. -/
def leaf032 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,881,0,0,0,0,0,882,883,0,0,0,1708,884,885,
    0,0,1709,886,887,0,1710,888,1711,1712,1713,1714,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    889,0,0,0,0,0,890,891,0,0,0,892,893,894,0,1715,895,896,1716,1717,897,1718,1719,1720,1721,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,898,0,0,0,0,0,899,900,0,0,0,901,902,1722,0,903,904,1723
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 4224. -/
def leaf033 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    1724,905,1725,1726,1727,1728,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,906,0,0,0,
    0,0,907,1729,0,0,0,908,1730,0,0,909,1731,0,910,1732,1733,1734,1735,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,911,0,0,0,0,1736,912,0,0,0,1737,913,0,0,1738,914,0,1739,1740,1741,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,915,0,0,0,0,916
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 4352. -/
def leaf034 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    917,0,0,1742,918,919,0,1743,920,1744,1745,1746,1747,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,921,0,0,0,0,922,923,0,0,924,925,1748,1749,926,1750,1751,1752,1753,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,927,0,0,0,0,928,1754,0,0,929,
    1755,0,930,1756,1757,1758,1759,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 4480. -/
def leaf035 : CheckedIndexTable 128 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,931,0,0,0,1760,932,0,0,1761,933,0,1762,1763,1764,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,934,0,0,0,935,936,0,1765,937,1766,1767,1768,
    1769,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,938,0,0,0,939,1770,0,940,1771,1772,1773,1774,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  ] (by decide) (by decide)

/-- Original grid codes beginning at row-major position 4608. -/
def leaf036 : CheckedIndexTable 117 1786 :=
  CheckedIndexTable.ofList [
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,941,0,0,1775,942,0,1776,1777,1778,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    943,0,0,944,1779,1780,1781,1782,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,945,0,1783,1784,1785
  ] (by decide) (by decide)

/-- The exact complete hierarchy grid in original parent/child order. -/
def table : CheckedIndexTable 4725 1786 :=
  ((((((((((((((((((((((((((((((((((((leaf000).append leaf001).append leaf002).append leaf003).append leaf004).append leaf005).append leaf006).append leaf007).append leaf008).append leaf009).append leaf010).append leaf011).append leaf012).append leaf013).append leaf014).append leaf015).append leaf016).append leaf017).append leaf018).append leaf019).append leaf020).append leaf021).append leaf022).append leaf023).append leaf024).append leaf025).append leaf026).append leaf027).append leaf028).append leaf029).append leaf030).append leaf031).append leaf032).append leaf033).append leaf034).append leaf035).append leaf036

/-- Decode a checked source code: zero means absent; positive and zero nodes retain their original labels. -/
def decode (code : Fin 1786) : Option (Fin 945 ⊕ Fin 840) :=
  if absent : code.val = 0 then none
  else if positive : code.val ≤ 945 then some (Sum.inl ⟨code.val-1, by omega⟩)
  else some (Sum.inr ⟨code.val-946, by have := code.isLt; omega⟩)

/-- Look up the original hierarchy node at a parent and complete child column. -/
def lookup (parent : Fin 105) (child : Fin 45) : Option (Fin 945 ⊕ Fin 840) :=
  decode (table.get (finProdFinEquiv (parent, child)))

/-- Every grid entry agrees with its original source node; absent entries are exactly inadmissible. -/
def correct (parent : Fin 105) (child : Fin 45) : Prop :=
  match lookup parent child with
  | none => ¬ (SuppliedShapeIndices.shapeAt 8 child.val).Fits (SuppliedHierarchyParents.parent4 parent)
  | some (Sum.inl node) =>
    (SuppliedShapeIndices.positiveNode node).parent = parent.val ∧
    (SuppliedShapeIndices.positiveNode node).child = child.val ∧
    (SuppliedShapeIndices.shapeAt 8 child.val).Fits (SuppliedHierarchyParents.parent4 parent)
  | some (Sum.inr node) =>
    (SuppliedShapeIndices.zeroNode node).parent = parent.val ∧
    (SuppliedShapeIndices.zeroNode node).child = child.val ∧
    (SuppliedShapeIndices.shapeAt 8 child.val).Fits (SuppliedHierarchyParents.parent4 parent)

/-- Decide grid correctness using only the finite source data. -/
instance correctDecidable (parent : Fin 105) (child : Fin 45) : Decidable (correct parent child) := by
  unfold correct
  cases lookup parent child with
  | none => infer_instance
  | some node => cases node <;> infer_instance

/-- Row-major finite predicate used by independent bounded kernel checks. -/
def correctAt (index : Fin (105*45)) : Prop := correct index.divNat index.modNat

/-- Every original positive node is recovered at its original parent and child column. -/
def positiveInverse (node : Fin 945) : Prop :=
  lookup ⟨(SuppliedShapeIndices.positiveNode node).parent, (SuppliedShapeIndices.positiveNode_bounds node).1⟩
    ⟨(SuppliedShapeIndices.positiveNode node).child, (SuppliedShapeIndices.positiveNode_bounds node).2.1⟩ = some (Sum.inl node)

/-- Every original zero node is recovered at its original parent and child column. -/
def zeroInverse (node : Fin 840) : Prop :=
  lookup ⟨(SuppliedShapeIndices.zeroNode node).parent, (SuppliedShapeIndices.zeroNode_bounds node).1⟩
    ⟨(SuppliedShapeIndices.zeroNode node).child, (SuppliedShapeIndices.zeroNode_bounds node).2.1⟩ = some (Sum.inr node)
/-- Independent original-source checks at positions 0 through 127. -/
theorem correctBlock000 : IndexBlockCertificate correctAt 0 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 128 through 255. -/
theorem correctBlock001 : IndexBlockCertificate correctAt 128 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 256 through 383. -/
theorem correctBlock002 : IndexBlockCertificate correctAt 256 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 384 through 511. -/
theorem correctBlock003 : IndexBlockCertificate correctAt 384 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 512 through 639. -/
theorem correctBlock004 : IndexBlockCertificate correctAt 512 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 640 through 767. -/
theorem correctBlock005 : IndexBlockCertificate correctAt 640 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 768 through 895. -/
theorem correctBlock006 : IndexBlockCertificate correctAt 768 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 896 through 1023. -/
theorem correctBlock007 : IndexBlockCertificate correctAt 896 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 1024 through 1151. -/
theorem correctBlock008 : IndexBlockCertificate correctAt 1024 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 1152 through 1279. -/
theorem correctBlock009 : IndexBlockCertificate correctAt 1152 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 1280 through 1407. -/
theorem correctBlock010 : IndexBlockCertificate correctAt 1280 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 1408 through 1535. -/
theorem correctBlock011 : IndexBlockCertificate correctAt 1408 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 1536 through 1663. -/
theorem correctBlock012 : IndexBlockCertificate correctAt 1536 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 1664 through 1791. -/
theorem correctBlock013 : IndexBlockCertificate correctAt 1664 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 1792 through 1919. -/
theorem correctBlock014 : IndexBlockCertificate correctAt 1792 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 1920 through 2047. -/
theorem correctBlock015 : IndexBlockCertificate correctAt 1920 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 2048 through 2175. -/
theorem correctBlock016 : IndexBlockCertificate correctAt 2048 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 2176 through 2303. -/
theorem correctBlock017 : IndexBlockCertificate correctAt 2176 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 2304 through 2431. -/
theorem correctBlock018 : IndexBlockCertificate correctAt 2304 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 2432 through 2559. -/
theorem correctBlock019 : IndexBlockCertificate correctAt 2432 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 2560 through 2687. -/
theorem correctBlock020 : IndexBlockCertificate correctAt 2560 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 2688 through 2815. -/
theorem correctBlock021 : IndexBlockCertificate correctAt 2688 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 2816 through 2943. -/
theorem correctBlock022 : IndexBlockCertificate correctAt 2816 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 2944 through 3071. -/
theorem correctBlock023 : IndexBlockCertificate correctAt 2944 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 3072 through 3199. -/
theorem correctBlock024 : IndexBlockCertificate correctAt 3072 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 3200 through 3327. -/
theorem correctBlock025 : IndexBlockCertificate correctAt 3200 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 3328 through 3455. -/
theorem correctBlock026 : IndexBlockCertificate correctAt 3328 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 3456 through 3583. -/
theorem correctBlock027 : IndexBlockCertificate correctAt 3456 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 3584 through 3711. -/
theorem correctBlock028 : IndexBlockCertificate correctAt 3584 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 3712 through 3839. -/
theorem correctBlock029 : IndexBlockCertificate correctAt 3712 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 3840 through 3967. -/
theorem correctBlock030 : IndexBlockCertificate correctAt 3840 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 3968 through 4095. -/
theorem correctBlock031 : IndexBlockCertificate correctAt 3968 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 4096 through 4223. -/
theorem correctBlock032 : IndexBlockCertificate correctAt 4096 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 4224 through 4351. -/
theorem correctBlock033 : IndexBlockCertificate correctAt 4224 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 4352 through 4479. -/
theorem correctBlock034 : IndexBlockCertificate correctAt 4352 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 4480 through 4607. -/
theorem correctBlock035 : IndexBlockCertificate correctAt 4480 128 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Independent original-source checks at positions 4608 through 4724. -/
theorem correctBlock036 : IndexBlockCertificate correctAt 4608 117 :=
  ⟨by decide +kernel, by unfold correctAt; decide +kernel⟩

/-- Complete kernel-checked correspondence across all 4725 source positions. -/
theorem correctComplete : IndexBlockCertificate correctAt 0 4725 :=
  ((((((((((((((((((((((((((((((((((((correctBlock000).append correctBlock001).append correctBlock002).append correctBlock003).append correctBlock004).append correctBlock005).append correctBlock006).append correctBlock007).append correctBlock008).append correctBlock009).append correctBlock010).append correctBlock011).append correctBlock012).append correctBlock013).append correctBlock014).append correctBlock015).append correctBlock016).append correctBlock017).append correctBlock018).append correctBlock019).append correctBlock020).append correctBlock021).append correctBlock022).append correctBlock023).append correctBlock024).append correctBlock025).append correctBlock026).append correctBlock027).append correctBlock028).append correctBlock029).append correctBlock030).append correctBlock031).append correctBlock032).append correctBlock033).append correctBlock034).append correctBlock035).append correctBlock036
/-- Independent original-source checks at positions 0 through 127. -/
theorem positiveBlock000 : IndexBlockCertificate positiveInverse 0 128 :=
  ⟨by decide +kernel, by unfold positiveInverse; decide +kernel⟩

/-- Independent original-source checks at positions 128 through 255. -/
theorem positiveBlock001 : IndexBlockCertificate positiveInverse 128 128 :=
  ⟨by decide +kernel, by unfold positiveInverse; decide +kernel⟩

/-- Independent original-source checks at positions 256 through 383. -/
theorem positiveBlock002 : IndexBlockCertificate positiveInverse 256 128 :=
  ⟨by decide +kernel, by unfold positiveInverse; decide +kernel⟩

/-- Independent original-source checks at positions 384 through 511. -/
theorem positiveBlock003 : IndexBlockCertificate positiveInverse 384 128 :=
  ⟨by decide +kernel, by unfold positiveInverse; decide +kernel⟩

/-- Independent original-source checks at positions 512 through 639. -/
theorem positiveBlock004 : IndexBlockCertificate positiveInverse 512 128 :=
  ⟨by decide +kernel, by unfold positiveInverse; decide +kernel⟩

/-- Independent original-source checks at positions 640 through 767. -/
theorem positiveBlock005 : IndexBlockCertificate positiveInverse 640 128 :=
  ⟨by decide +kernel, by unfold positiveInverse; decide +kernel⟩

/-- Independent original-source checks at positions 768 through 895. -/
theorem positiveBlock006 : IndexBlockCertificate positiveInverse 768 128 :=
  ⟨by decide +kernel, by unfold positiveInverse; decide +kernel⟩

/-- Independent original-source checks at positions 896 through 944. -/
theorem positiveBlock007 : IndexBlockCertificate positiveInverse 896 49 :=
  ⟨by decide +kernel, by unfold positiveInverse; decide +kernel⟩

/-- Complete kernel-checked correspondence across all 945 source positions. -/
theorem positiveComplete : IndexBlockCertificate positiveInverse 0 945 :=
  (((((((positiveBlock000).append positiveBlock001).append positiveBlock002).append positiveBlock003).append positiveBlock004).append positiveBlock005).append positiveBlock006).append positiveBlock007
/-- Independent original-source checks at positions 0 through 127. -/
theorem zeroBlock000 : IndexBlockCertificate zeroInverse 0 128 :=
  ⟨by decide +kernel, by unfold zeroInverse; decide +kernel⟩

/-- Independent original-source checks at positions 128 through 255. -/
theorem zeroBlock001 : IndexBlockCertificate zeroInverse 128 128 :=
  ⟨by decide +kernel, by unfold zeroInverse; decide +kernel⟩

/-- Independent original-source checks at positions 256 through 383. -/
theorem zeroBlock002 : IndexBlockCertificate zeroInverse 256 128 :=
  ⟨by decide +kernel, by unfold zeroInverse; decide +kernel⟩

/-- Independent original-source checks at positions 384 through 511. -/
theorem zeroBlock003 : IndexBlockCertificate zeroInverse 384 128 :=
  ⟨by decide +kernel, by unfold zeroInverse; decide +kernel⟩

/-- Independent original-source checks at positions 512 through 639. -/
theorem zeroBlock004 : IndexBlockCertificate zeroInverse 512 128 :=
  ⟨by decide +kernel, by unfold zeroInverse; decide +kernel⟩

/-- Independent original-source checks at positions 640 through 767. -/
theorem zeroBlock005 : IndexBlockCertificate zeroInverse 640 128 :=
  ⟨by decide +kernel, by unfold zeroInverse; decide +kernel⟩

/-- Independent original-source checks at positions 768 through 839. -/
theorem zeroBlock006 : IndexBlockCertificate zeroInverse 768 72 :=
  ⟨by decide +kernel, by unfold zeroInverse; decide +kernel⟩

/-- Complete kernel-checked correspondence across all 840 source positions. -/
theorem zeroComplete : IndexBlockCertificate zeroInverse 0 840 :=
  ((((((zeroBlock000).append zeroBlock001).append zeroBlock002).append zeroBlock003).append zeroBlock004).append zeroBlock005).append zeroBlock006

end MatrixBounds.Numeric.SuppliedNodeLookup
