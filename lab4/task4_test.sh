#!/bin/bash

echo --------------------------------------------------------------------------------------------*task4_tests
echo ----------------------------------------------*test1
diff <(bash task4.sh a-06-20) <(echo -e "1.	NazhmetdinovMA\n2.	ChernyshovDM\n3.	KrivosheevAV\n4.	TretyakovAlO\n5.	DereberiaTM\n6.	ZinchenkoSK\n7.	BespalovML\n8.	BoldyrevIN\n9.	DavydovAlD\n10.	RybakovArV") -s
echo ----------------------------------------------*test2
diff <(bash task4.sh A-09-20) <(echo -e "1.	MukhamejanovAI\n2.	KharitonovAnA\n3.	TikhonovAVad\n4.	GrebeniukKS\n5.	MikhailovPA\n6.	FurtayevIV\n7.	GumerovaEF\n8.	LabanovaMS\n9.	SukhanovVS\n10.	AslanovAF") -s
echo ----------------------------------------------*test3
diff <(bash task4.sh A-F-K) <(echo -e "1.	AwesomeBL\n2.	ZubenkoMP\n3.	NiceDK\n4.	AboBA") -s
echo ----------------------------------------------*test4
diff <(bash task4.sh A-06-08) <(echo -e "1.	MalakhovaFR\n2.	PogrebnovWM\n3.	ZabolotnyDY\n4.	LimonovJM\n5.	LidinaSM\n6.	ShipovUU\n7.	DubovNO\n8.	PodaKS") -s
echo ----------------------------------------------*test5
diff <(bash task4.sh) <(echo -e "1.	Surovtsev-ButovA\n2.	SemichayevskyFF\n3.	ChakolyadenisE\n4.	CherenchikovJH\n5.	MukhamejanovAI\n6.	NazhmetdinovMA\n7.	PodshivalovaBH\n8.	PodshivalovaBZ\n9.	PodshivalovaOR\n10.	AbramenkoSemV") -s
