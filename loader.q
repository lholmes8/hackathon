distance:0.001

parksdata:("SSSFF";enlist",")0:`:rawdata/parksdata.csv

d:()!()

bikerentals:("SSJJJJ";enlist",")0:`:rawdata/BikeRentals.csv
bikestations:("JSFFFFFF";enlist",")0:`:rawdata/BikeStations.csv
carparklocation:("SSSJJJFFJJJSS";enlist",")0:hsym `$"rawdata/car-park-locations-data.csv"
carparktariff:("SSSSSSSSSSSSS";enlist",")0: hsym `$"rawdata/car-park-tariffs-data.csv"
civicamenities:("SSSFF";enlist",")0:`:rawdata/civicamenitysitesdata.csv
communitycentres:("SSSFF";enlist",")0:`:rawdata/communitycentresdata.csv
leisurecentres:("SSSFF";enlist",")0:`:rawdata/leisurecentresdata.csv
trees:("SSSSSSSSJJFFFFJF";enlist",")0:`:rawdata/odTrees.csv
toiletsdata:("SSSSSFF"; enlist",")0:`:rawdata/toiletsdata.csv
playgroundsdata:("SSSFF";enlist",")0:`:rawdata/playgroundsdata.csv
playcentresdata:("SSSFF";enlist",")0:`:rawdata/playcentresdata.csv
pitchesplayingfieldsdata:("SSSFF";enlist",")0:`:rawdata/pitchesplayingfieldsdata.csv

exceptions:`parksdata`bikerentals`carparktariff
// big update boy
{[x] ![x;();0b;enlist[`park]!enlist ((';{[x;y]parksdata[`NAME] where all 0.01>abs parksdata[`LONGITUDE`LATITUDE]-(x;y)});`LONGITUDE;`LATITUDE)]}each tables[]except exceptions
