// creator  : aVENGER
// argument : WSMITH01.DLG

EXTEND_BOTTOM WSMITH01 13
  IF ~PartyHasItem("RR#KEEP")~ THEN GOTO RR#UPGD00
END
  
APPEND WSMITH01
  IF ~~ THEN BEGIN RR#UPGD00 SAY @6020
    IF ~PartyHasItem("RR#KEEP")
        !PartyHasItem("MISC9Y")~ THEN GOTO RR#UPGD01
    IF ~PartyHasItem("RR#KEEP")
        PartyHasItem("MISC9Y")~ THEN GOTO RR#UPGD02
  END
  
  IF ~~ THEN BEGIN RR#UPGD01 SAY @6021
    IF ~~ THEN GOTO RR#NOTNX
  END
  
  IF ~~ THEN BEGIN RR#UPGD02 SAY @6022
    IF ~PartyGoldLT(5000)~ THEN REPLY #66662 GOTO RR#NOTNX
    IF ~PartyGoldGT(4999)~ THEN REPLY #66664 DO ~SetGlobal("RR#Items","ar0334",3)
                                                 SetGlobal("ForgeStuff","GLOBAL",1)
                                                 TakePartyGold(5000)
                                                 TakePartyItemNum("RR#KEEP",1)
                                                 DestroyItem("RR#KEEP")
                                                 TakePartyItemNum("MISC9Y",1)
                                                 DestroyItem("MISC9Y")
                                                 DestroyGold(5000)~ GOTO 56
    IF ~~ THEN REPLY #66770 GOTO RR#NOTNX
  END

  IF ~~ THEN BEGIN RR#NOTNX SAY @6003
   COPY_TRANS WSMITH01 13
  END
END