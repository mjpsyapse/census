create schema if not exists hive.warehouse with ( location = 's3a://warehouse/' );

create table if not exists hive.warehouse.census_2020_data (hrhhid2 varchar,HUFINAL varchar,OCCURNUM varchar,HUINTTYP varchar,HURESPLI varchar,HUPRSCNT varchar,HUTYPEA varchar,HUTYPB varchar,HUTYPC varchar,HUBUS varchar,HUBUSL1 varchar,HUBUSL2 varchar,HUBUSL3 varchar,HUBUSL4 varchar,HRMIS varchar,HRMONTH varchar,HRYEAR4 varchar,HRLONGLK varchar,qstnum varchar,gereg varchar,gestfips varchar,gediv varchar,hehousut varchar,hxhousut varchar,hephoneo varchar,hxphoneo varchar,hetelavl varchar,hxtelavl varchar,hetelhhd varchar,hxtelhhd varchar,hrhtype varchar,hrintsta varchar,hrnumhou varchar,hefaminc varchar,hxfaminc varchar,hwhhwgt varchar,hwhhwtln varchar,PULINENO varchar,PUCHINHH varchar,PUWK varchar,PUBUS1 varchar,PUDIS varchar,PULAY varchar,PUHROFF1 varchar,PUHROFF2 varchar,PUHROT1 varchar,PUHROT2 varchar,PUABSOT varchar,PUBUSCK1 varchar,PUBUSCK2 varchar,PUBUSCK3 varchar,PUBUSCK4 varchar,PURETOT varchar,PUHRCK1 varchar,PUHRCK2 varchar,PUHRCK3 varchar,PUHRCK4 varchar,PUHRCK5 varchar,PUHRCK6 varchar,PUHRCK7 varchar,PUHRCK12 varchar,PULAYDT varchar,PULAY6M varchar,PULAYAVR varchar,PULK varchar,PULKAVR varchar,PULAYCK1 varchar,PULAYCK2 varchar,PULAYCK3 varchar,PUDWCK1 varchar,PUDWCK2 varchar,PUDWCK3 varchar,PUDWCK4 varchar,PUDWCK5 varchar,PUJHCK1 varchar,PUJHCK2 varchar,PUJHDP1O varchar,PUJHCK3 varchar,PUJHCK4 varchar,PUJHCK5 varchar,PULKM2 varchar,PULKM3 varchar,PULKM4 varchar,PULKM5 varchar,PULKM6 varchar,PULKDK1 varchar,PULKDK2 varchar,PULKDK3 varchar,PULKDK4 varchar,PULKDK5 varchar,PULKDK6 varchar,PULKPS1 varchar,PULKPS2 varchar,PULKPS3 varchar,PULKPS4 varchar,PULKPS5 varchar,PULKPS6 varchar,PUIOCK1 varchar,PUIOCK2 varchar,PUIOCK3 varchar,PUIODP1 varchar,PUIODP2 varchar,PUIODP3 varchar,PUIO1MFG varchar,PUIO2MFG varchar,ptern2 varchar,pternh1c varchar,PUNLFCK1 varchar,PUNLFCK2 varchar,PUSLFPRX varchar,PUDIS1 varchar,PUDIS2 varchar,PUBUS2OT varchar,perrp varchar,pxrrp varchar,pxage varchar,peafnow varchar,pxafnow varchar,pesex varchar,pxsex varchar,pemaritl varchar,pxmaritl varchar,pxrace1 varchar,pehspnon varchar,pxhspnon varchar,peeduca varchar,pxeduca varchar,peafever varchar,pxafever varchar,peafwhn1 varchar,pxafwhn1 varchar,peafwhn2 varchar,peafwhn3 varchar,peafwhn4 varchar,pespouse varchar,pxspouse varchar,penatvty varchar,pxnatvty varchar,pemntvty varchar,pxmntvty varchar,pefntvty varchar,pxfntvty varchar,pxinusyr varchar,pedipged varchar,pxdipged varchar,pehgcomp varchar,pxhgcomp varchar,pecyc varchar,pxcyc varchar,pepar1 varchar,pxpar1 varchar,pepar2 varchar,pxpar2 varchar,pepar1typ varchar,pxpar1typ varchar,pepar2typ varchar,pxpar2typ varchar,prdasian varchar,prmarsta varchar,ptdtrace varchar,prdthsp varchar,prpertyp varchar,prfamnum varchar,prfamtyp varchar,prfamrel varchar,prnmchld varchar,prchld varchar,prcitflg varchar,prcitshp varchar,prinuyer varchar,prtage varchar,prtfage varchar,pecohab varchar,pxcohab varchar,peabspdo varchar,peabsrsn varchar,pedwavl varchar,pedwavr varchar,pedwlko varchar,pedwlkwk varchar,pedwrsn varchar,pedwwk varchar,pedwwnto varchar,pedw4wk varchar,pehractt varchar,pehract1 varchar,pehract2 varchar,pehravl varchar,pehrftpt varchar,pehrrsn1 varchar,pehrrsn2 varchar,pehrrsn3 varchar,pehruslt varchar,pehrusl1 varchar,pehrusl2 varchar,pehrwant varchar,pejhrsn varchar,pejhwant varchar,pejhwko varchar,pelayavl varchar,pelaydur varchar,pelayfto varchar,pelaylk varchar,pelkavl varchar,pelkdur varchar,pelkfto varchar,pelkll1o varchar,pelkll2o varchar,pelklwo varchar,pelkm1 varchar,pemjnum varchar,pemjot varchar,pemlr varchar,penlfact varchar,penlfjh varchar,penlfret varchar,peret1 varchar,pxabspdo varchar,pxabsrsn varchar,pxdwavl varchar,pxdwavr varchar,pxdwlko varchar,pxdwlkwk varchar,pxdwrsn varchar,pxdwwk varchar,pxdwwnto varchar,pxdw4wk varchar,pxhractt varchar,pxhract1 varchar,pxhract2 varchar,pxhravl varchar,pxhrftpt varchar,pxhrrsn1 varchar,pxhrrsn2 varchar,pxhrrsn3 varchar,pxhruslt varchar,pxhrusl1 varchar,pxhrusl2 varchar,pxhrwant varchar,pxjhrsn varchar,pxjhwant varchar,pxjhwko varchar,pxlayavl varchar,pxlaydur varchar,pxlayfto varchar,pxlaylk varchar,pxlkavl varchar,pxlkdur varchar,pxlkfto varchar,pxlkll1o varchar,pxlkll2o varchar,pxlklwo varchar,pxlkm1 varchar,pxmjnum varchar,pxmjot varchar,pxmlr varchar,pxnlfact varchar,pxnlfjh varchar,pxnlfret varchar,pxret1 varchar,prabsrea varchar,prcivlf varchar,prdisc varchar,premphrs varchar,prempnot varchar,prexplf varchar,prftlf varchar,prhrusl varchar,prjobsea varchar,prpthrs varchar,prptrea varchar,prunedur varchar,pruntype varchar,prwksch varchar,prwkstat varchar,prwntjob varchar,peio1icd varchar,peio2icd varchar,ptio1ocd varchar,ptio2ocd varchar,peio1cow varchar,peio2cow varchar,pepdemp1 varchar,pepdemp2 varchar,pxio1icd varchar,pxio2icd varchar,pxio1ocd varchar,pxio2ocd varchar,pxio1cow varchar,pxio2cow varchar,pxpdemp1 varchar,pxpdemp2 varchar,pxnmemp1 varchar,pxnmemp2 varchar,prioelg varchar,premp varchar,prcow1 varchar,prcow2 varchar,prnagws varchar,prnagpws varchar,prdtcow1 varchar,prdtcow2 varchar,prmjind1 varchar,prmjind2 varchar,primind1 varchar,primind2 varchar,prmjocc1 varchar,prmjocc2 varchar,prdtind1 varchar,prdtind2 varchar,prdtocc1 varchar,prdtocc2 varchar,pragna varchar,prsjmj varchar,prcowpg varchar,prmjocgr varchar,peernper varchar,peernhry varchar,peernuot varchar,peernwkp varchar,peernrt varchar,pternh2 varchar,pternh1o varchar,peernhro varchar,ptern varchar,peernlab varchar,peerncov varchar,pxernper varchar,pxernhry varchar,pxernuot varchar,pxernwkp varchar,pxernrt varchar,pxernh2 varchar,pxernh1o varchar,pxernhro varchar,pxern varchar,pxernlab varchar,pxerncov varchar,prerelg varchar,pternwa varchar,pternhly varchar,prwernal varchar,prhernal varchar,peschlvl varchar,peschenr varchar,peschft varchar,pxschlvl varchar,pxschenr varchar,pxschft varchar,prnlfsch varchar,pedisear varchar,pediseye varchar,pedisrem varchar,pedisphy varchar,pedisdrs varchar,pedisout varchar,pxdisear varchar,pxdiseye varchar,pxdisrem varchar,pxdisphy varchar,pxdisdrs varchar,pxdisout varchar,prdisflg varchar,pecert1 varchar,pecert2 varchar,pecert3 varchar,pxcert1 varchar,pxcert2 varchar,pxcert3 varchar,pwsswgt varchar,pwlgwgt varchar,pwvetwgt varchar,pworwgt varchar,pwfmwgt varchar,pwcmpwgt varchar,pthr varchar,ptwk varchar,ptot varchar,ptnmemp1 varchar,ptnmemp2 varchar,hrhhid varchar,gtcbsa varchar,gtco varchar,gtcbsast varchar,gtcbsasz varchar,gtcsa varchar,gtmetsta varchar,gtindvpc varchar)
with (
    format = 'CSV',
    external_location = 's3a://warehouse/census/2020/data/'
);

create table if not exists hive.warehouse.census_2020_legend (name varchar, description varchar)
with (
    format = 'CSV',
    external_location = 's3a://warehouse/census/2020/legend/'
);
