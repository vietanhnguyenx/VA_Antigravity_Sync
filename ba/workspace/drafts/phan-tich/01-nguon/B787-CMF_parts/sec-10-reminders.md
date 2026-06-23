## **10 Reminders** 

The Reminders function enables the flight crew to set reminder messages that the AMI posts to NEW MESSAGES when certain conditions are met.  For each reminder, the flight crew may enter a specific message to be posted when the condition is met.  The posted message is annunciated by visual “●COMM” and aural high-low chime alerts and displays text and parameters indicating which condition has been met along with the specific message entered by the flight crew. 

## **10.1 Display Definition** 

Figure 10-1 shows the Reminders display definition. 

**==> picture [241 x 361] intentionally omitted <==**

**Figure 10-1  Reminders Display Definition** 

243 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “REMINDERS” 

## **Main Area** 

Table 10-1 describes the Reminders display entry boxes in the reminder event column. 

**Table 10-1  Reminders Display Reminder Event Column Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|TIME 1|No|4|HHMM|||REMINDER_TIME_1|
|TIME 2|No|4|HHMM|||REMINDER_TIME_2|
|TIME 3|No|4|HHMM|||REMINDER_TIME_3|
|TIME TO T/D (top of<br>descent)|No|4|HHMM|||REMINDER_TIME_TOD|
|TIME TO DEST|No|4|HHMM|||REMINDER_TIME_DEST|
|WAYPOINT|No|1-7|XXXXXXX|||REMINDER_POSN|
|LATITUDE (direction)|No|1|A|N or S||REMINDER_LAT_DIR|
|LATITUDE (degrees)|No|2|NN|00-90||REMINDER_LAT|
|LONGITUDE (direction)|No|1|A|E or W||REMINDER_LONG_DIR|
|LONGITUDE (degrees)|No|3|NNN|000-180||REMINDER_LONG|
|FUEL|No|1-5|NNN.N|0.0-280.0||REMINDER_FUEL|
|ALTITUDE|No|1-5|NNNNN|0-49000||REMINDER_ALTITUDE|
|FLIGHT LEVEL|No|1-3|NNN|0-490||REMINDER_FL|
|WAYPOINT ETA<br>CHANGE (by minutes)|No|1|N|1-9|3|REMINDER_ETA_CHANGE|



Table 10-2 describes the Reminders display entry boxes in the reminder text column. 

**Table 10-2  Reminders Display Reminder Text Column Entry Boxes** 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|TIME 1|No|1-24|XXX…||“CREW<br>CHANGE”|REMINDER_TIME_TEXT_1|
|TIME 2|No|1-24|XXX…|||REMINDER_TIME_TEXT_2|
|TIME 3|No|1-24|XXX…|||REMINDER_TIME_TEXT_3|
|TIME TO T/D|No|1-24|XXX…|||REMINDER_TIME_TEXT_TOD|
|TIME TO DEST|No|1-24|XXX…|||REMINDER_TIME_TEXT_DEST|
|WAYPOINT|No|1-24|XXX…|||REMINDER_POSN_TEXT|
|LATITUDE|No|1-24|XXX…|||REMINDER_LAT_TEXT|



244 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Name**|**Mand**<br>**atory**|**Length**|**Format**|**Range**|**Default**|**Parameter**|
|---|---|---|---|---|---|---|
|LONGITUDE|No|1-24|XXX…|||REMINDER_LONG_TEXT|
|FUEL|No|1-24|XXX…|||REMINDER_FUEL_TEXT|
|ALTITUDE|No|1-24|XXX…|||REMINDER_ALTITUDE_TEXT|
|FLIGHT LEVEL|No|1-24|XXX…|||REMINDER_FL_TEXT|
|WAYPOINT ETA<br>CHANGE|No|1-24|XXX…|||REMINDER_ETA_CHANGE_TEXT|



The Waypoint ETA Change Reminder data (including the current waypoint ETA) is displayed when the WAYPOINT ETA CHANGE NESB is selected. 

## **Command Buttons** 

Table 10-3 describes the Reminders display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 10-3  Reminders Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|RESET|Reset|Always|-|
|5|RETURN|Return|Always|-|
|6|EXIT|Exit|Always|-|



## **10.2 Logic Unit** 

The AMI implements a logic unit to generate reminder messages that the flight crew has set. 

```
-- ----------------------------------------------------------------------------
-- This Logic Unit issues sidelinks as requested on the
-- REMINDERS page, using the text specified on that page
-- for each selection.
--
-- G.Sandell  7-28-2009
-- G.Sandell 12-22-2011     Corrected FMF_ETA calculations to add 24
--                          hours to the Baseline ETA if the ETA time
--                          is less than the current time.
--
--                          Removed "FROM" ETA Entry Box from
--                          Reminders Main display and adjusted logic.
--
```

245 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
--                          Corrected Longitude Reminder by checking
--                          that if the Reminder Longitude is not 180
--                          degrees or zero degrees that the last and
--                          current longitude values must both be
--                          positive or negative.  Added specific
--                          check for when the target Longitude is
--                          zero due to positive/negative check for
--                          non 180 degree Longitudes.
--
--                          In Latitude Reminder changed <= and >= to
--                          < and > in the LAST_FMF_POS_LAT comparison.
--
--                          Added 3rd and 4th UTC Timers.
--
-- G.Sandell 2-7-2012       Made corrections per 777 tests to
--                          longitude check and to move storage of old
--                          values closer to where they are used.
--
-- G.Sandell 7-17-2012      Made corrections to fix errors.
--
-- G.Sandell 4-17-2014      Added logic to reset targets to default
--                          when entry is invalid (to cover resets).
--
-- G.Sandell 5-13-2014      Revised ETA change logic to not alert 10
--                          seconds either side of waypoint sequence
--
-- G.Sandell 11-5-2014      Revised latitude and longitude passing
--                          logic to allow for invalid data
--
-- ----------------------------------------------------------------------------
-- VERSION C003
--
-- G.Sandell  1-7-2015      Revised latitude and longitude to allow
--                          for last position rounding from double to
--                          single-precision
-- ----------------------------------------------------------------------------
--
-- S Meisch   2018 SEP      Changes to conform with Boeing's Configuration
--                          control processes:
--                          - Logic Unit Name Changed to BCG_REMINDERS
--                          - Display Names Posted to New Messages were
--                            change to "BCG_REMINDERS_xxx"
--
-- ----------------------------------------------------------------------------
--
-- Version E001  M. Matyas  08-FEB-2019
```

246 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
--     Replaced time 4 reminder with flight level reminder.
--
-- ----------------------------------------------------------------------------
--
-- Version F001  M. Matyas  29-SEP-2020
--     Updated references to renamed display components.
--
-- ----------------------------------------------------------------------------
--
--  UDPs used specifically for this function:
--  REMINDER_SIDELINK_TIME1_B
--  REMINDER_SIDELINK_TIME2_B
--  REMINDER_SIDELINK_TIME3_B
--  REMINDER_SIDELINK_FL_B
--  REMINDER_SIDELINK_TIME_TOD_B
--  REMINDER_SIDELINK_TIME_DEST_B
--  REMINDER_SIDELINK_POSN_B
--  REMINDER_SIDELINK_LAT_B
--  REMINDER_SIDELINK_LONG_B
--  REMINDER_SIDELINK_FUEL_B
--  REMINDER_SIDELINK_ALT_B
--  REMINDER_SIDELINK_ETA_B
--  REMINDER_TIME_1
--  REMINDER_TIME_2
--  REMINDER_TIME_3
--  REMINDER_FL
--  REMINDER_TIME_1_DISPLAY
--  REMINDER_TIME_2_DISPLAY
--  REMINDER_TIME_3_DISPLAY
--  REMINDER_FL_DISPLAY
--  REMINDER_TIME_TOD
--  REMINDER_TIME_DEST
--  REMINDER_TIME_TOD_DISPLAY
--  REMINDER_TIME_DEST_DISPLAY
--  OLD_REMINDER_TIME_1
--  OLD_REMINDER_TIME_2
--  OLD_REMINDER_TIME_3
--  REMINDER_TIME_TEXT_1
--  REMINDER_TIME_TEXT_2
--  REMINDER_TIME_TEXT_3
--  REMINDER_FL_TEXT
--  REMINDER_TIME_TEXT_TOD
--  REMINDER_TIME_TEXT_DEST
--  REVISED_REMINDER_TIME_1
--  REVISED_REMINDER_TIME_2
--  REVISED_REMINDER_TIME_3
```

247 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
--  REVISED_REMINDER_FL
--  REVISED_REMINDER_TIME_DEST
--  REMINDER_POSN
--  REMINDER_POSN_DISPLAY
--  REMINDER_POSN_TEXT
--  REMINDER_FMF_LAST_WPT
--  REMINDER_FMF_ETA
--  REMINDER_LAT
--  REMINDER_LAT_DIR
--  REMINDER_LAT_DISPLAY
--  REMINDER_LAT_DIR_DISPLAY
--  REMINDER_LAT_TEXT
--  REVISED_LAT
--  LAST_NAV_POS_LAT
--  REMINDER_LONG
--  REMINDER_LONG_DIR
--  REMINDER_LONG_DISPLAY
--  REMINDER_LONG_DIR_DISPLAY
--  REMINDER_LONG_TEXT
--  REVISED_LONG
--  LAST_NAV_POS_LONG
--  REMINDER_FUEL
--  REMINDER_FUEL_DISPLAY
--  REMINDER_FUEL_TEXT
--  REMINDER_ALTITUDE
--  REMINDER_ALTITUDE_DISPLAY
--  REMINDER_ALTITUDE_TEXT
--  REMINDER_ENABLE_ETA_CHANGE
--  REMINDER_ETA_CHANGE
--  REMINDER_ETA_CHANGE_DISPLAY
--  REMINDER_ETA_CHANGE_TEXT
--  ETA_CHANGE
--  REMINDER_ETA_BASELINE
--  REMINDER_ETA_BASELINE_DISPLAY
--  FMF_ETA_DISPLAY
--  LAST_ACTIVE_WPT
--
-- ACPs also used:
--  CURRENT_TIME
--  CURRENT_DATE
--  CURRENT_DATE_TIME
--  FMF_ETA_TOP_OF_DESC
--  FMF_TIME_TO_DEST
--  FMF_LAST_WPT
--  FMF_ACTIVE_WPT
--  FMF_ETA
```

248 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
--  NAV_POS_LAT
--  NAV_POS_LON
--  TOTAL_FILTERED_FUEL_MASS
--  ADRF_PRESSALT_VOTED
--
-- ----------------------------------------------------------------------------
-- Clear targets when entries are invalid
-- ----------------------------------------------------------------------------
If not valid (REMINDER_TIME_1) and valid (OLD_REMINDER_TIME_1) then
     set_default (OLD_REMINDER_TIME_1);
     set_invalid (REVISED_REMINDER_TIME_1);
end_if;
If not valid (REMINDER_TIME_2) and valid (OLD_REMINDER_TIME_2) then
     set_default (OLD_REMINDER_TIME_2);
     set_invalid (REVISED_REMINDER_TIME_2);
end_if;
If not valid (REMINDER_TIME_3) and valid (OLD_REMINDER_TIME_3) then
     set_default (OLD_REMINDER_TIME_3);
     set_invalid (REVISED_REMINDER_TIME_3);
end_if;
If not valid (REMINDER_LAT_DIR) or not valid (REMINDER_LAT) then
      set_default (REVISED_LAT);
end_if;
If not valid (REMINDER_LONG_DIR) or not valid (REMINDER_LONG) then
      set_default (REVISED_LONG);
end_if;
```

```
-- ----------------------------------------------------------------------------
-- Look for the individual times (1, 2, 3).
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
-- Time 1
-- ----------------------------------------------------------------------------
If valid (REMINDER_TIME_1) then
 if REMINDER_TIME_1 changed or not valid (OLD_REMINDER_TIME_1) then
   if REMINDER_TIME_1 < CURRENT_TIME then
      REVISED_REMINDER_TIME_1 := REMINDER_TIME_1 + (CURRENT_DATE + 86400);
   else
      REVISED_REMINDER_TIME_1 := REMINDER_TIME_1 + CURRENT_DATE;
   end_if;
 end_if;
 OLD_REMINDER_TIME_1 := REMINDER_TIME_1;
 If CURRENT_DATE_TIME reached (REVISED_REMINDER_TIME_1) then
     REMINDER_SIDELINK_TIME1_B := REMINDER_TIME_TEXT_1;
     REMINDER_TIME_1_DISPLAY := REMINDER_TIME_1;
     post_message (BCG_RMDR_TIME1, visual_and_aural);
```

249 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
     set_default (REMINDER_TIME_1);
     set_default (REMINDER_TIME_TEXT_1);
     set_default (OLD_REMINDER_TIME_1);
     set_invalid (REVISED_REMINDER_TIME_1);
 end_if;
end_if;
-- ----------------------------------------------------------------------------
-- Time 2
-- ----------------------------------------------------------------------------
If valid (REMINDER_TIME_2) then
   if REMINDER_TIME_2 changed or not valid (OLD_REMINDER_TIME_2) then
     if REMINDER_TIME_2 < CURRENT_TIME then
        REVISED_REMINDER_TIME_2 := REMINDER_TIME_2 + (CURRENT_DATE + 86400);
     else
      REVISED_REMINDER_TIME_2 := REMINDER_TIME_2 + CURRENT_DATE;
     end_if;
   end_if;
   OLD_REMINDER_TIME_2 := REMINDER_TIME_2;
   If CURRENT_DATE_TIME reached (REVISED_REMINDER_TIME_2) then
     REMINDER_SIDELINK_TIME2_B := REMINDER_TIME_TEXT_2;
     REMINDER_TIME_2_DISPLAY := REMINDER_TIME_2;
     post_message (BCG_RMDR_TIME2, visual_and_aural);
     set_default (REMINDER_TIME_2);
     set_default (REMINDER_TIME_TEXT_2);
     set_default (OLD_REMINDER_TIME_2);
     set_invalid (REVISED_REMINDER_TIME_2);
   end_if;
end_if;
```

```
-- ----------------------------------------------------------------------------
```

```
-- Time 3
-- ----------------------------------------------------------------------------
If valid (REMINDER_TIME_3) then
   if REMINDER_TIME_3 changed or not valid (OLD_REMINDER_TIME_3) then
     if REMINDER_TIME_3 < CURRENT_TIME then
        REVISED_REMINDER_TIME_3 := REMINDER_TIME_3 +
        (CURRENT_DATE + 86400);
     else
        REVISED_REMINDER_TIME_3 := REMINDER_TIME_3 + CURRENT_DATE;
     end_if;
   end_if;
   OLD_REMINDER_TIME_3 := REMINDER_TIME_3;
```

```
   If CURRENT_DATE_TIME reached (REVISED_REMINDER_TIME_3) then
     REMINDER_SIDELINK_TIME3_B := REMINDER_TIME_TEXT_3;
     REMINDER_TIME_3_DISPLAY := REMINDER_TIME_3;
```

250 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
     post_message (BCG_RMDR_TIME3, visual_and_aural);
     set_default (REMINDER_TIME_3);
     set_default (REMINDER_TIME_TEXT_3);
     set_default (OLD_REMINDER_TIME_3);
     set_invalid (REVISED_REMINDER_TIME_3);
   end_if;
end_if;
-- ----------------------------------------------------------------------------
-- Look for time to top of descent.
-- ----------------------------------------------------------------------------
If valid (REMINDER_TIME_TOD) then
   If FMF_ETA_TOP_OF_DESC  <= REMINDER_TIME_TOD then
     REMINDER_SIDELINK_TIME_TOD_B := REMINDER_TIME_TEXT_TOD;
     REMINDER_TIME_TOD_DISPLAY := REMINDER_TIME_TOD;
     post_message (BCG_RMDR_TIME_TOD, visual_and_aural);
     set_default (REMINDER_TIME_TOD);
     set_default (REMINDER_TIME_TEXT_TOD);
   end_if;
end_if;
-- ----------------------------------------------------------------------------
-- Look for time to destination.
-- ----------------------------------------------------------------------------
 If valid (REMINDER_TIME_DEST) then
   If FMF_TIME_TO_DEST <= REMINDER_TIME_DEST  then
      REMINDER_SIDELINK_TIME_DEST_B := REMINDER_TIME_TEXT_DEST;
      REMINDER_TIME_DEST_DISPLAY := REMINDER_TIME_DEST;
      post_message (BCG_RMDR_TIME_DEST, visual_and_aural);
      set_default (REMINDER_TIME_DEST);
      set_default (REMINDER_TIME_TEXT_DEST);
   end_if;
end_if;
-- ----------------------------------------------------------------------------
-- Remove blank characters from FMF_LAST_WPT
-- ----------------------------------------------------------------------------
if valid (FMF_LAST_WPT) then
   REMINDER_FMF_LAST_WPT := "";
   REMINDER_FMF_LAST_WPT[1] := FMF_LAST_WPT[1];
   if FMF_LAST_WPT[2] != " " then
      REMINDER_FMF_LAST_WPT[2] := FMF_LAST_WPT[2];
      if FMF_LAST_WPT[3] != " " then
         REMINDER_FMF_LAST_WPT[3] := FMF_LAST_WPT[3];
```

NEW D613Z019-06 251 of 378 ECCN: 7E994 **BOEING PROPRIETARY** 

```
         if FMF_LAST_WPT[4] != " " then
            REMINDER_FMF_LAST_WPT[4] := FMF_LAST_WPT[4];
            if FMF_LAST_WPT[5] != " " then
               REMINDER_FMF_LAST_WPT[5] := FMF_LAST_WPT[5];
               if FMF_LAST_WPT[6] != " " then
                  REMINDER_FMF_LAST_WPT[6] := FMF_LAST_WPT[6];
                  if FMF_LAST_WPT[7] != " " then
                     REMINDER_FMF_LAST_WPT[7] := FMF_LAST_WPT[7];
                  end_if;
               end_if;
            end_if;
         end_if;
      end_if;
   end_if;
else
```

```
   set_invalid (REMINDER_FMF_LAST_WPT);
end_if;
```

```
-- ----------------------------------------------------------------------------
-- Look for sequencing the entered waypoint.
-- ----------------------------------------------------------------------------
If valid (REMINDER_POSN) then
   If REMINDER_POSN = REMINDER_FMF_LAST_WPT  then
      REMINDER_SIDELINK_POSN_B := REMINDER_POSN_TEXT;
      REMINDER_POSN_DISPLAY := REMINDER_POSN;
      post_message (BCG_RMDR_WPT_PASS, visual_and_aural);
      set_default (REMINDER_POSN);
      set_default (REMINDER_POSN_TEXT);
   end_if;
end_if;
```

```
-- ----------------------------------------------------------------------------
-- Look for passing the specified latitude.
-- ----------------------------------------------------------------------------
If valid (NAV_POS_LAT) then
    If valid (REMINDER_LAT_DIR) and valid (REMINDER_LAT)and
              ((REMINDER_LAT_DIR = "N") or (REMINDER_LAT_DIR = "S")) then
       If (REMINDER_LAT_DIR = "N") then REVISED_LAT := REMINDER_LAT;
       else REVISED_LAT := -REMINDER_LAT;
       end_if;
       If ((LAST_NAV_POS_LAT <= REVISED_LAT) and
            (NAV_POS_LAT >= REVISED_LAT)) or
```

252 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
            ((LAST_NAV_POS_LAT >= REVISED_LAT) and
            (NAV_POS_LAT <= REVISED_LAT)) then
          REMINDER_SIDELINK_LAT_B := REMINDER_LAT_TEXT;
          REMINDER_LAT_DIR_DISPLAY := REMINDER_LAT_DIR;
          REMINDER_LAT_DISPLAY := REMINDER_LAT;
          post_message (BCG_RMDR_LAT, visual_and_aural);
          set_default (REMINDER_LAT_DIR);
          set_default (REMINDER_LAT);
          set_default (REMINDER_LAT_TEXT);
       end_if;
    end_if;
-------------------------------------------------------------------------------
-- Set up for the next cycle
-- ----------------------------------------------------------------------------
    LAST_NAV_POS_LAT := NAV_POS_LAT;
end_if;
```

```
-- ----------------------------------------------------------------------------
-- Look for passing the specified longitude.
-- ----------------------------------------------------------------------------
If valid (NAV_POS_LON) then
    If valid (REMINDER_LONG_DIR) and valid (REMINDER_LONG)and
             ((REMINDER_LONG_DIR = "E") or (REMINDER_LONG_DIR = "W")) then
       If (REMINDER_LONG_DIR = "E") then REVISED_LONG := REMINDER_LONG;
       else REVISED_LONG := - REMINDER_LONG;
          If REVISED_LONG = -180 then
             REVISED_LONG := 180;
          end_if;
       end_if;
       If (((LAST_NAV_POS_LONG <= REVISED_LONG) and
          (NAV_POS_LON >= REVISED_LONG)) and
          ((LAST_NAV_POS_LONG > 0 AND NAV_POS_LON > 0) or
          (LAST_NAV_POS_LONG < 0 AND NAV_POS_LON < 0)))
          or
          (((LAST_NAV_POS_LONG >= REVISED_LONG) and
          (NAV_POS_LON <= REVISED_LONG)) and
          ((LAST_NAV_POS_LONG > 0 AND NAV_POS_LON > 0) or
          (LAST_NAV_POS_LONG < 0 AND NAV_POS_LON < 0)))
          or
          (REVISED_LONG = 180 and
          (((LAST_NAV_POS_LONG < -179) and (NAV_POS_LON > 179)) or
```

253 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
          ((LAST_NAV_POS_LONG > 179) and (NAV_POS_LON < -179)) or
          (NAV_POS_LON = 180) or (LAST_NAV_POS_LONG = 180)))
          or
          (REVISED_LONG = 0 and
          (((LAST_NAV_POS_LONG <= 0) and (NAV_POS_LON >= 0)) or
          ((LAST_NAV_POS_LONG >= 0) and (NAV_POS_LON <= 0)))) then
```

```
          REMINDER_SIDELINK_LONG_B := REMINDER_LONG_TEXT;
          REMINDER_LONG_DIR_DISPLAY := REMINDER_LONG_DIR;
          REMINDER_LONG_DISPLAY := REMINDER_LONG;
          post_message (BCG_RMDR_LONG, visual_and_aural);
          set_default (REMINDER_LONG_DIR);
          set_default (REMINDER_LONG);
          set_default (REMINDER_LONG_TEXT);
       end_if;
    end_if;
```

```
-- ----------------------------------------------------------------------------
-- Set up for the next cycle
-- ----------------------------------------------------------------------------
    LAST_NAV_POS_LONG := NAV_POS_LON;
end_if;
```

```
-- ----------------------------------------------------------------------------
```

```
-- Look for reaching the specified fuel load.
-- ----------------------------------------------------------------------------
If valid (REMINDER_FUEL) then
   If (REMINDER_FUEL >= TOTAL_FILTERED_FUEL_MASS)  then
      REMINDER_SIDELINK_FUEL_B := REMINDER_FUEL_TEXT;
      REMINDER_FUEL_DISPLAY := REMINDER_FUEL;
      post_message (BCG_RMDR_FUEL, visual_and_aural);
      set_default (REMINDER_FUEL);
      set_default (REMINDER_FUEL_TEXT);
   end_if;
end_if;
```

```
-- ----------------------------------------------------------------------------
-- Look for reaching the specified altitude.  Note that this is
-- based on non-baro-corrected pressure altitude.
-- ----------------------------------------------------------------------------
If valid (REMINDER_ALTITUDE) then
   If ADRF_PRESSALT_VOTED >= REMINDER_ALTITUDE - 150 and
      ADRF_PRESSALT_VOTED <= REMINDER_ALTITUDE + 150  then
```

D613Z019-06 254 of 378 ECCN: 7E994 

**BOEING PROPRIETARY** 

NEW 

```
      REMINDER_SIDELINK_ALT_B := REMINDER_ALTITUDE_TEXT;
      REMINDER_ALTITUDE_DISPLAY := REMINDER_ALTITUDE;
      post_message (BCG_RMDR_ALT, visual_and_aural);
      set_default (REMINDER_ALTITUDE);
      set_default (REMINDER_ALTITUDE_TEXT);
   end_if;
end_if;
-- ----------------------------------------------------------------------------
-- Look for reaching the specified flight level.
-- Note that this is based on non-baro-corrected pressure
-- altitude.
-- ----------------------------------------------------------------------------
If valid (REMINDER_FL) then
   REMINDER_FL_ALT := REMINDER_FL * 100;
   If ADRF_PRESSALT_VOTED >= REMINDER_FL_ALT - 150 and
      ADRF_PRESSALT_VOTED <= REMINDER_FL_ALT + 150  then
      REMINDER_SIDELINK_FL_B := REMINDER_FL_TEXT;
      REMINDER_FL_DISPLAY := REMINDER_FL;
      post_message (BCG_RMDR_FL, visual_and_aural);
      set_default (REMINDER_FL);
      set_default (REMINDER_FL_TEXT);
   end_if;
end_if;
-- ----------------------------------------------------------------------------
-- Set up the ETA value to compare to the new FMS prediction.
-- ----------------------------------------------------------------------------
If REMINDER_ENABLE_ETA_CHANGE then
-- Invalidate baseline when waypoint is sequenced
   If FMF_ACTIVE_WPT != LAST_ACTIVE_WPT then
      set_invalid (REMINDER_ETA_BASELINE);
      TIME_AT_WPT_CHG := CURRENT_DATE_TIME;
   end_if;
-- Set baseline if FMS-predicted ETA was previously invalid
--   and more than 5 seconds since waypoint sequenced
   If valid (FMF_ETA) and not valid (REMINDER_ETA_BASELINE) and
      ((CURRENT_DATE_TIME > (TIME_AT_WPT_CHG + 5)) or
        not valid (TIME_AT_WPT_CHG)) then
      If FMF_ETA < CURRENT_TIME then
         REMINDER_ETA_BASELINE := FMF_ETA + 86400 + CURRENT_DATE;
      else
         REMINDER_ETA_BASELINE := FMF_ETA + CURRENT_DATE;
      end_if;
```

255 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
      If not valid (TIME_AT_WPT_CHG) then
         TIME_AT_WPT_CHG := CURRENT_DATE_TIME;
      end_if;
   end_if;
end_if;
```

```
-- ----------------------------------------------------------------------------
-- Set up for the next cycle
-- ----------------------------------------------------------------------------
LAST_ACTIVE_WPT := FMF_ACTIVE_WPT;
```

```
-- ----------------------------------------------------------------------------
```

```
-- Look for the specified change in FMS-predicted ETA
-- ----------------------------------------------------------------------------
If REMINDER_ENABLE_ETA_CHANGE and valid (FMF_ETA)
  and valid (REMINDER_ETA_BASELINE) then
   If FMF_ETA < (CURRENT_TIME - 5) then
      REMINDER_FMF_ETA := FMF_ETA + 86400 + CURRENT_DATE;
   else
      REMINDER_FMF_ETA := FMF_ETA + CURRENT_DATE;
   end_if;
```

```
-- See if near waypoint sequence (before or after)                --
   TIME_SINCE_WPT_CHG := CURRENT_DATE_TIME - TIME_AT_WPT_CHG;
   TIME_TO_WPT_CHG := REMINDER_FMF_ETA - CURRENT_DATE_TIME;
   If (TIME_SINCE_WPT_CHG > 10) and (TIME_TO_WPT_CHG > 10) then
```

```
     ETA_CHANGE := REMINDER_FMF_ETA - REMINDER_ETA_BASELINE;
```

```
     If ETA_CHANGE < 0 then
        ETA_CHANGE := - ETA_CHANGE;
     end_if;
     If ETA_CHANGE >= (REMINDER_ETA_CHANGE*60) then
        REMINDER_SIDELINK_ETA_B := REMINDER_ETA_CHANGE_TEXT;
        REMINDER_ETA_CHANGE_DISPLAY := REMINDER_ETA_CHANGE;
        REMINDER_ETA_BASELINE_DISPLAY := REMINDER_ETA_BASELINE;
        FMF_ETA_DISPLAY := FMF_ETA;
        post_message (BCG_RMDR_WPT_ETA, visual_and_aural);
        set_invalid (REMINDER_ETA_BASELINE);
     end_if;
   end_if;
end_if;
```

```
-- Clear up if pilot has turned ETA change monitoring off
If not REMINDER_ENABLE_ETA_CHANGE then
```

```
      set_default (REMINDER_ETA_CHANGE_TEXT);
```

256 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
      set_default (REMINDER_ETA_BASELINE);
      set_default (REMINDER_ETA_CHANGE);
      set_default (TIME_AT_WPT_CHG);
end_if;
```

```
-------------------------------------------------------------------------------
```

```
--
```

```
-- END
```

## **10.3 Altitude Reminder Display Definition** 

Figure 10-2 shows the Altitude Reminder display definition. 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 10-2  Altitude Reminder Display Definition** 

## **Title** 

The title area contains: 

257 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

- The current time in HHMMz format 

- “REMINDER ALTITUDE” 

## **Main Area** 

The main area contains: 

- A parameter displaying the reminder altitude 

- The message text entered when setting the reminder 

Table 10-4 describes the Altitude Reminder display parameters. 

**Table 10-4  Altitude Reminder Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|ALTITUDE|1-5|NNNNN|0-49000|REMINDER_ALTITUDE_DISPLAY|
|Reminder text|1-24|XXX…||REMINDER_SIDELINK_ALT_B|



## **Command Buttons** 

Table 10-5 describes the Altitude Reminder display command buttons.  If neither condition is satisfied, then the button is not displayed. 

**Table 10-5  Altitude Reminder Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **10.4 Flight Level Reminder Display Definition** 

Figure 10-3 shows the Flight Level Reminder display definition. 

258 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 10-3  Flight Level Reminder Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “REMINDER FLIGHT LEVEL” 

## **Main Area** 

The main area contains: 

- A parameter displaying the reminder flight level 

- The message text entered when setting the reminder 

Table 10-6 describes the Flight Level Reminder display parameters. 

259 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 10-6  Flight Level Reminder Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|FLIGHT LEVEL|3|NNN|000-490|REMINDER_FL_DISPLAY|
|Reminder text|1-24|XXX…||REMINDER_SIDELINK_FL_B|



## **Command Buttons** 

Table 10-7 describes the flight level reminder display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 10-7  Flight Level Reminder Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **10.5 Fuel Reminder Display Definition** 

Figure 10-4 shows the Fuel Reminder display definition. 

260 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [245 x 360] intentionally omitted <==**

**Figure 10-4  Fuel Reminder Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “REMINDER FUEL” 

## **Main Area** 

The main area contains: 

- A parameter displaying the reminder fuel on board 

- The message text entered when setting the reminder 

Table 10-8 describes the Fuel Reminder display parameters. 

261 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 10-8  Fuel Reminder Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|FUEL|3-5|NNN.N|0.0-280.0|REMINDER_FUEL_DISPLAY|
|Reminder text|1-24|XXX…||REMINDER_SIDELINK_FUEL_B|



## **Command Buttons** 

Table 10-9 describes the Fuel Reminder display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 10-9  Fuel Reminder Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **10.6 Latitude Reminder Display Definition** 

Figure 10-5 shows the Latitude Reminder display definition. 

262 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 10-5  Latitude Reminder Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “REMINDER LATITUDE” 

## **Main Area** 

The main area contains: 

- A parameter displaying the reminder latitude 

- The message text entered when setting the reminder 

Table 10-10 describes the Latitude Reminder display parameters. 

263 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 10-10  Latitude Reminder Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|LATITUDE|1|A|N or S|REMINDER_LAT_DIR_DISPLAY|
||2|NN|00-90|REMINDER_LAT_DISPLAY|
|Reminder text|1-24|XXX…||REMINDER_SIDELINK_LAT_B|



## **Command Buttons** 

Table 10-11 describes the Latitude Reminder display command buttons. If  neither condition is satisfied, then the button is not displayed. 

**Table 10-11  Latitude Reminder Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **10.7 Longitude Reminder Display Definition** 

Figure 10-6 shows the Longitude Reminder display definition. 

264 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [243 x 360] intentionally omitted <==**

**Figure 10-6  Longitude Reminder Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “REMINDER LONGITUDE” 

## **Main Area** 

The main area contains: 

- A parameter displaying the reminder longitude 

- The message text entered when setting the reminder 

Table 10-12 describes the Longitude Reminder display parameters. 

265 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 10-12  Longitude Reminder Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|LONGITUDE|1|A|E or W|REMINDER_LONG_DIR_DISPLAY|
||3|NNN|000-180|REMINDER_LONG_DISPLAY|
|Reminder text|1-24|XXX…||REMINDER_SIDELINK_LONG_B|



## **Command Buttons** 

Table 10-13 describes the Longitude Reminder display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 10-13  Longitude Reminder Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **10.8 Passing Waypoint Reminder Display Definition** 

Figure 10-7 shows the Passing Waypoint Reminder display definition. 

266 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 10-7  Passing Waypoint Reminder Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “REMINDER PASSING WAYPOINT” 

## **Main Area** 

The main area contains: 

- A parameter displaying the reminder waypoint 

- The message text entered when setting the reminder 

Table 10-14 describes the Passing Waypoint Reminder display parameters. 

267 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 10-14  Passing Waypoint Reminder Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|PASSING WAYPOINT|1-7|XXXXXXX||REMINDER_POSN_DISPLAY|
|Reminder text|1-24|XXX…||REMINDER_SIDELINK_POSN_B|



## **Command Buttons** 

Table 10-15 describes the Passing Waypoint Reminder display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 10-15  Passing Waypoint Reminder Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **10.9 Time Reminder Display Definition** 

Figure 10-8 shows the Time Reminder display definition. 

268 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [242 x 360] intentionally omitted <==**

**Figure 10-8  Time Reminder Display Definition** 

Note:  A total of three reminder times can be set. 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “REMINDER TIME 1 [or 2 or 3]” 

## **Main Area** 

The main area contains: 

- A parameter displaying the reminder time 

- The message text entered when setting the reminder 

269 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

Table 10-16 describes the Time Reminder display parameters. 

**Table 10-16  Time Reminder Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|TIME 1 [or 2 or 3]|5|HH:MM||REMINDER_TIME_[1/2/3]_DISPLAY|
|Reminder text|1-24|XXX…||REMINDER_SIDELINK_TIME[1/2/3]_B|



## **Command Buttons** 

Table 10-17 describes the Time Reminder display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 10-17  Time Reminder Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **10.10 Time to Destination Reminder Display Definition** 

Figure 10-9 shows the Time to Destination Reminder display definition. 

270 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [244 x 360] intentionally omitted <==**

**Figure 10-9  Time to Destination Reminder Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “REMINDER TIME TO DESTINATION” 

## **Main Area** 

The main area contains: 

- A parameter displaying the reminder time to destination 

- The message text entered when setting the reminder 

Table 10-18 describes the Time to Destination Reminder display parameters. 

271 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 10-18  Time to Destination Reminder Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|TIME TO<br>DESTINATION|5|HH+MM||REMINDER_TIME_DEST_DISPLAY|
|Reminder text|1-24|XXX…||REMINDER_SIDELINK_TIME_DEST_B|



## **Command Buttons** 

Table 10-19 describes the Time to Destination Reminder display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 10-19  Time to Destination Reminder Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **10.11 Time to Top of Descent Reminder Display Definition** 

Figure 10-10 shows the Time to Top of Descent Reminder display definition. 

272 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [242 x 360] intentionally omitted <==**

**Figure 10-10  Time to Top of Descent Reminder Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “REMINDER TIME TO TOP OF DESCENT” 

## **Main Area** 

The main area contains: 

- A parameter displaying the reminder time to top of descent 

- The message text entered when setting the reminder 

Table 10-20 describes the Time to Top of Descent Reminder display parameters. 

273 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 10-20  Time to Top of Descent Reminder Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|TIME TO TOP OF<br>DESCENT|5|HH+MM||REMINDER_TIME_TOD_DISPLAY|
|Reminder text|1-24|XXX…||REMINDER_SIDELINK_TIME_TOD_B|



## **Command Buttons** 

Table 10-21 describes the Time to Top of Descent Reminder display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 10-21  Time to Top of Descent Reminder Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



## **10.12 Waypoint ETA Change Reminder Display Definition** 

Figure 10-11 shows the Waypoint ETA Change Reminder display definition. 

274 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**==> picture [242 x 360] intentionally omitted <==**

**Figure 10-11  Waypoint ETA Change Reminder Display Definition** 

## **Title** 

The title area contains: 

- The current time in HHMMz format 

- “REMINDER WAYPOINT ETA CHANGE” 

## **Main Area** 

The main area contains: 

- “WAYPOINT ETA CHANGE” 

- Parameters displaying the original ETA and the reminder ETA 

- The message text entered when setting the reminder 

275 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

Table 10-22 describes the Waypoint ETA Change Reminder display parameters. 

**Table 10-22  Waypoint ETA Change Reminder Display Parameters** 

|**Name**|**Length**|**Format**|**Range**|**Parameter**|
|---|---|---|---|---|
|FROM|5|HH:MM||REMINDER_ETA_BASELINE_DISPLAY|
|TO|5|HH:MM||FMF_ETA_DISPLAY|
|Reminder text|1-24|XXX…||REMINDER_SIDELINK_ETA_B|



## **Command Buttons** 

Table 10-23 describes the Waypoint ETA Change Reminder display command buttons. If neither condition is satisfied, then the button is not displayed. 

**Table 10-23  Waypoint ETA Change Reminder Display Command Buttons** 

|**Position**|**Legend**|**Function**|**Displayed**|**Displayed as Inhibited**|
|---|---|---|---|---|
|1|-|-|-|-|
|2|-|-|-|-|
|3|-|-|-|-|
|4|-|-|-|-|
|5|-|-|-|-|
|6|CANCEL|Cancel|Always|-|



276 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW
