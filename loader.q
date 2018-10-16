parksdata:("***FF";enlist",")0:`:rawdata/parksdata.csv
bikerentals:("*SJJJJ";enlist",")0:`:rawdata/BikeRentals.csv
bikestations:("J*FFFFFF";enlist",")0:`:rawdata/BikeStations.csv
carparklocation:("***JJJFFJJJS*";enlist",")0:hsym `$"rawdata/car-park-locations-data.csv"
carparktariff:("*************";enlist",")0: hsym `$"rawdata/car-park-tariffs-data.csv"
civicamenities:("***FF";enlist",")0:`:rawdata/civicamenitysitesdata.csv
communitycentres:("***FF";enlist",")0:`:rawdata/communitycentresdata.csv
leisurecentres:("***FF";enlist",")0:`:rawdata/leisurecentresdata.csv
trees:("SS***SSSSJJFFFFJF";enlist",")0:`:rawdata/odTrees.csv
toiletsdata:("***SSFF"; enlist",")0:`:rawdata/toiletsdata.csv
playgrounds:("***FF";enlist",")0:`:rawdata/playgroundsdata.csv
playcentres:("***FF";enlist",")0:`:rawdata/playcentresdata.csv
pitchesplayingfields:("***FF";enlist",")0:`:rawdata/pitchesplayingfieldsdata.csv
crimes:("S***FF*S****";enlist",")0:`:rawdata/crimedata.csv

distance:0.001

exceptions:`parksdata`bikerentals`carparktariff
// big update boy
{[x] ![x;();0b;enlist[`park]!enlist ((';{[x;y]parksdata[`NAME] where all 0.01>abs parksdata[`LONGITUDE`LATITUDE]-(x;y)});`LONGITUDE;`LATITUDE)]}each tables[]except exceptions
