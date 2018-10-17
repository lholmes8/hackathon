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

distance:0.0015

exceptions:`parksdata`bikerentals`carparktariff`ratingagg`ratings`ratingtot
// big update boy

.api.getdata:{[t;c;p] c:cols t;?[t;enlist ((/:;in);(enlist p);`park);0b;{x!x}(),c]}

addparks:{[x] ![x;();0b;enlist[`park]!enlist ((';{[x;y]parksdata[`NAME] where all distance>abs parksdata[`LONGITUDE`LATITUDE]-(x;y)});`LONGITUDE;`LATITUDE)]}
addparks each tables[]except exceptions

splitparks:{[tbl]@[tbl where count each tbl `park;`park;:;raze tbl `park]}
m set'splitparks each m:tables[]except exceptions

update score:floor score%(0.1*max score)from update score:count i by park from `carparklocation;
update score:floor score%(0.1*max score)from update score:count i by park from `crimes;
update score:floor score%(0.1*max score)from update score:count i by park from `toiletsdata;
update score:floor score%(0.1*max score)from update score:count i by park from `playgrounds;

// ratings
ratings:([]park:`$();facilities:`int$();cleanliness:`int$();childfriendliness:`int$();safety:`int$())
ratingtot:([park:`$()] facilities:`int$();cleanliness:`int$();childfriendliness:`int$();safety:`int$();cnt:`int$())
ratingagg:([park:`$()] facilities:`float$();cleanliness:`float$();childfriendliness:`float$();safety:`float$();totalrating:`float$())
d:()!()
d[`ratings]:{[t;x]
	t insert x;
	park:x 0;
	`ratingtot upsert (enlist[`park]!enlist[park]),(0^ratingtot park) + 1_x,1;
	a:%[`cnt _ ratingtot park;ratingtot[park]`cnt];
	`ratingagg upsert park,value[a],avg value a
	}

upd:{[t;x]
	d[t] . (t;x)} 	

.api.cooljoin:{[x] raze{[x]([]typ:count[a]#x),'a:`park`LONGITUDE`LATITUDE#value x}'[x]}
