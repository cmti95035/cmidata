#this is a sample hive sql used to look up region according to the prefix of cgsccpadd

create table en_cg stored as orc as select sccp.*, 
lookup.prefix as prefix, lookup.area as area,
lookup.region as region, lookup.carrier as carrier, lookup.network as network
from sccp_raw_simplified_time as sccp join sccp_region_lookup as lookup 
where substring(sccp.cgsccpadd, 1, 2) != "86" and 
(substring(sccp.cgsccpadd, 1, 3) = lookup.prefix or 
 substring(sccp.cgsccpadd, 1, 4) = lookup.prefix or
 substring(sccp.cgsccpadd, 1, 5) = lookup.prefix or
 substring(sccp.cgsccpadd, 1, 6) = lookup.prefix or
 substring(sccp.cgsccpadd, 1, 7) = lookup.prefix or
 substring(sccp.cgsccpadd, 1, 8) = lookup.prefix or
 substring(sccp.cgsccpadd, 1, 9) = lookup.prefix or
 substring(sccp.cgsccpadd, 1, 10) = lookup.prefix or
 substring(sccp.cgsccpadd, 1, 11) = lookup.prefix);
