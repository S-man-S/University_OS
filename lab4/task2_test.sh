#!/bin/bash

echo --------------------------------------------------------------------------------------------*task2_tests
echo ----------------------------------------------*test1
diff <(bash task2.sh Пивоварение a-06-20) <(echo -e "BespalovML 1 2 3\nChernyshovDM 3\nDavydovAlD 2 4\nDereberiaTM 4\nDolgyAV 1 4\nKrivosheevAV 1 2\nNazhmetdinovMA 1 4\nRybakovArV 1 2\nSanjiyevMJ 2\nTereshinDP 1 2\nTretyakovAlO 4\nYankinMI 2 3\nZhidkikhYS 1 2 4\nZinchenkoSK 4") -s
echo ----------------------------------------------*test2
diff <(bash task2.sh Пивоварение A-09-17) <(echo -e "FrolovSerAl 2 4\nGromovMN 1 3\nKukinVA 2\nLebedevAlD 4\nMakhalovaOS 2 4\nMarchukON 1\nStudenikinYV 1 2 3\nVlasovaOM 2 3\nZagainovaMD 1 2 4") -s
echo ----------------------------------------------*test3
diff <(bash task2.sh Пивоварение A-06-08) <(echo -e "DubovNO 1 4\nLimonovJM 3\nMalakhovaFR 1 3 4\nPodaKS 1 2\nPogrebnovWM 1 2\nShipovUU 1 2 3 4\nZabolotnyDY 3 4") -s
echo ----------------------------------------------*test4
diff <(bash task2.sh Криптозоология A-06-08) <(echo -e "DubovNO 4\nLidinaSM 2\nLimonovJM 1 2 3 4\nMalakhovaFR 2 3\nPodaKS 1 2 3\nPogrebnovWM 2 3 4\nShipovUU 4\nZabolotnyDY 2 3 4") -s
echo ----------------------------------------------*test5
diff <(bash task2.sh Криптоварение A-F-K) <(echo -e "Все студенты сдали тесты") -s