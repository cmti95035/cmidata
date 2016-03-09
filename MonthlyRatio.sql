/* add a small value to 月平均 to avoid divided by zero error */

create table MonthlyRatio as select A.出访gprs流量, (A.出访gprs流量 + 0.001) / (B.出访gprs流量月平均 + 0.001) as 出访gprs流量月比例 , 
 A.出访统一后总金额, (A.出访统一后总金额 + 0.001) / (B.出访统一后总金额月平均 + 0.001) as 出访统一后总金额月比例, A.国家,A.时间 from Monthly as A join MonthlyAverage as B on A.国家 =  B.国家 