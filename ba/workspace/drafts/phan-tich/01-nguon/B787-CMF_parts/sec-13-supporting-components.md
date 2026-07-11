## **13 Supporting Components** 

The AMI implements several supporting (background) components that do not directly provide any operational functions. 

## **13.1 Customer Parameter Database** 

The Customer Parameter Database component defines the aircraft parameters (ACPs) and user-defined parameters (UDPs) that are available for other components to reference.  It also defines certain attributes of each parameter, including whether CMF should set the parameter to its default value when CMF resets, whether CMF should store the parameter’s value in NVM, and the initial value of the parameter.  Table 13-1 describes the customer parameter database that the CMF baseline AMI implements. 

**Table 13-1  Customer Parameter Database** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`ACP`|`ACARS_FLIGHT_IDENTIFIER`|`String`|`<n/a>`|`<n/a>`|`<ACARS_FLIGHT_IDENTIFIER>`|
|`ACP`|`ACARS_FLIGHT_NUMBER`|`String`|`<n/a>`|`<n/a>`|`<ACARS_FLIGHT_NUMBER>`|
|`ACP`|`ACTIVE_DATA_FREQUENCY`|`Real`|`<n/a>`|`<n/a>`|`<ACTIVE_DATA_FREQUENCY>`|
|`ACP`|`ADRF_ALTRATE_VOTED`|`Real`|`<n/a>`|`<n/a>`|`<ADRF_ALTRATE_VOTED>`|
|`ACP`|`ADRF_CAS_VOTED`|`Real`|`<n/a>`|`<n/a>`|`<ADRF_CAS_VOTED>`|
|`ACP`|`ADRF_MACH_VOTED`|`Real`|`<n/a>`|`<n/a>`|`<ADRF_MACH_VOTED>`|
|`ACP`|`ADRF_PRESSALT_VOTED`|`Real`|`<n/a>`|`<n/a>`|`<ADRF_PRESSALT_VOTED>`|
|`ACP`|`ADRF_SAT_VOTED`|`Real`|`<n/a>`|`<n/a>`|`<ADRF_SAT_VOTED>`|
|`ACP`|`ADRF_TAS_VOTED`|`Real`|`<n/a>`|`<n/a>`|`<ADRF_TAS_VOTED>`|
|`ACP`|`ADRF_TAT_VOTED`|`Real`|`<n/a>`|`<n/a>`|`<ADRF_TAT_VOTED>`|
|`ACP`|`ADS_MIN_REPORTING_INTERVAL`|`Real`|`<n/a>`|`<n/a>`|`<ADS_MIN_REPORTING_INTERVAL>`|
|`UDP`|`AGM_ADDR`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`AGM_TEXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`AGM_TEXT_2 `|`String`|`Yes`|`No`|`Invalid`|



333 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`AGM_TEXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`AGM_TEXT_4 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`AGM_TEXT_5 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`AGM_TEXT_6 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`AGM_TEXT_7 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`AGM_TEXT_8 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`AHM_DVRT_FLAG`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`AHM_DVRT_PREV_DEST`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`AHM_FLIGHT_PHASE_ENABLE`|`Boolean`|`No`|`Yes`|`TRUE`|
|`UDP`|`AHM_FLIGHT_PHASE_IDENT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`AHM_INIT_FLAG`|`Boolean`|`No`|`Yes`|`FALSE`|
|`ACP`|`AIRBORNE`|`Boolean`|`<n/a>`|`<n/a>`|`<AIRBORNE>`|
|`UDP`|`AIRCRAFT_IN_AIR`|`Boolean`|`Yes`|`No`|`Invalid`|
|`ACP`|`AIRCRAFT_POSITION`|`String`|`<n/a>`|`<n/a>`|`<AIRCRAFT_POSITION>`|
|`ACP`|`AIRCRAFT_REGISTRATION_MARK`|`String`|`<n/a>`|`<n/a>`|`<AIRCRAFT_REGISTRATION_MARK>`|
|`ACP`|`AIRCRAFT_TYPE`|`String`|`<n/a>`|`<n/a>`|`<AIRCRAFT_TYPE>`|
|`ACP`|`AIRLINE_IDENTIFIER`|`String`|`<n/a>`|`<n/a>`|`<AIRLINE_IDENTIFIER>`|
|`ACP`|`ALL_ENTRY_DOORS_CLOSED`|`Boolean`|`<n/a>`|`<n/a>`|`<ALL_ENTRY_DOORS_CLOSED>`|
|`ACP`|`AMI_DF_FILE_PART_NUMBER`|`String`|`<n/a>`|`<n/a>`|`<AMI_DF_FILE_PART_NUMBER>`|
|`ACP`|`AMI_PART_NUMBER`|`String`|`<n/a>`|`<n/a>`|`<AMI_PART_NUMBER>`|
|`ACP`|`ANTI_ICE_SW_POS`|`Integer`|`<n/a>`|`<n/a>`|`<ANTI_ICE_SW_POS>`|
|`UDP`|`AOIP_LINK_ADV_ENABLE`|`Boolean`|`No`|`Yes`|`FALSE`|
|`UDP`|`AOIP_LINK_ADV_STATUS`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`AOIP_LINK_ADV_TIME`|`Integer`|`Yes`|`No`|`Invalid`|
|`ACP`|`AOIP_LINK_STATUS`|`Integer`|`<n/a>`|`<n/a>`|`<AOIP_LINK_STATUS>`|
|`UDP`|`ARR_AUTOLAND`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`ARR_AUTOLND_QUAL`|`Integer`|`Yes`|`No`|`Invalid`|



334 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`ARR_FOB`|`Real`|`Yes`|`No`|`<IN_FOB>`|
|`UDP`|`ARR_IN_TIME`|`Integer`|`Yes`|`No`|`<IN_TIME>`|
|`UDP`|`ARR_LAND_CAT_CND`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`ARR_LNDG_PILOT`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`ARR_ON_TIME`|`Integer`|`Yes`|`No`|`<ON_TIME>`|
|`UDP`|`ARR_SUPLMT_TXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`ARR_SUPLMT_TXT_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`ARR_SUPLMT_TXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`ACP`|`ATN_ENABLED`|`Boolean`|`<n/a>`|`<n/a>`|`<ATN_BASELINE_1>`|
|`ACP`|`ATS_DF_FILE_PART_NUMBER`|`String`|`<n/a>`|`<n/a>`|`<ATS_DF_FILE_PART_NUMBER>`|
|`ACP`|`ATS_SOFTWARE_PART_NUMBER`|`String`|`<n/a>`|`<n/a>`|`<SOFTWARE_PART_NUMBER>`|
|`ACP`|`AUTOTUNE_FREQUENCY`|`Real`|`<n/a>`|`<n/a>`|`<AUTOTUNE_FREQUENCY>`|
|`UDP`|`BLOCK_FUEL`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`BLOCK_TIME`|`Integer`|`No`|`Yes`|`Invalid`|
|`UDP`|`BRAKE_TIME`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`CAA_CHK_ITEM_NO`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`CAA_CHK_LINE_NO`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`CAA_OTHER`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`CAA_REASON`|`Integer`|`Yes`|`No`|`Invalid`|
|`ACP`|`CENTER_FUEL_DENSITY`|`Real`|`<n/a>`|`<n/a>`|`<CENTER_FUEL_DENSITY>`|
|`ACP`|`CMCF_A664_FLIGHT_LEG_NUMBER`|`Integer`|`<n/a>`|`<n/a>`|`<CMCF_FLIGHT_LEG_NUMBER>`|
|`ACP`|`CMCF_FLIGHT_PHASE`|`Integer`|`<n/a>`|`<n/a>`|`<CMCF_FLIGHT_PHASE>`|
|`UDP`|`CMCF_FLIGHT_PHASE_CURRENT`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`CMCF_FLT_PHASE_TEXT`|`String`|`Yes`|`No`||
|`ACP`|`CMF_CABINET_POSITION`|`Integer`|`<n/a>`|`<n/a>`|`<CMF_CABINET_POSITION>`|
|`ACP`|`CMF_LINK_STATUS`|`Integer`|`<n/a>`|`<n/a>`|`<CMU_LINK_STATUS>`|
|`UDP`|`CMF_LINK_STRENGTH`|`Integer`|`Yes`|`No`|`0`|



335 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`ACP`|`CURRENT_DATE`|`Integer`|`<n/a>`|`<n/a>`|`<CURRENT_DATE>`|
|`ACP`|`CURRENT_DATE_TIME`|`Integer`|`<n/a>`|`<n/a>`|`<CURRENT_DATE_TIME>`|
|`ACP`|`CURRENT_DAY`|`Integer`|`<n/a>`|`<n/a>`|`<CURRENT_DAY>`|
|`ACP`|`CURRENT_REGION`|`Integer`|`<n/a>`|`<n/a>`|`<CURRENT_REGION>`|
|`ACP`|`CURRENT_TIME`|`Integer`|`<n/a>`|`<n/a>`|`<CURRENT_TIME>`|
|`UDP`|`CUR_EMERGENCY_STATE`|`Boolean`|`Yes`|`No`|`FALSE`|
|`ACP`|`DEFAULT_CHARACTERS_PER_LINE`|`Integer`|`<n/a>`|`<n/a>`|`<DEFAULT_CHARACTERS_PER_LINE>`|
|`UDP`|`DEPT_TIME`|`Integer`|`Yes`|`No`|`<OUT_TIME>`|
|`UDP`|`DISP_MSG_TITLE`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DIV_AUTO_FLAG`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`DIV_DEST`|`String`|`Yes`|`No`|`<FMF_ACTRTEDEST>`|
|`UDP`|`DIV_DEST_ETA`|`Integer`|`Yes`|`No`|`<FMF_DEST_ETA>`|
|`UDP`|`DIV_DEST_FUEL`|`Real`|`Yes`|`No`|`<FMF_FUEL_AT_DEST>`|
|`UDP`|`DIV_FUEL_ON_BOARD`|`Real`|`Yes`|`No`|`<FUEL_ON_BOARD>`|
|`UDP`|`DIV_PREV_DEST`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DIV_REASON`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`DIV_REASON_OTHER`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DIV_TXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DIV_TXT_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DIV_TXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DLY_ARRIVAL_RESN`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`DLY_ARRIVAL_TEXT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DLY_DEPT_RESN`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`DLY_DEPT_TEXT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DLY_ENROUTE_RESN`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`DLY_ENROUTE_TEXT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DLY_FUEL_ON_BD`|`Real`|`Yes`|`No`|`<FUEL_ON_BOARD>`|



336 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`DLY_SELECT`|`Integer`|`No`|`No`|`Invalid`|
|`UDP`|`DLY_SUPLMT_TXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DLY_SUPLMT_TXT_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DLY_SUPLMT_TXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DLY_TAKEOFF_RESN`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`DLY_TAKEOFF_TEXT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`DOORS_ALL_CLOSED`|`Boolean`|`Yes`|`No`|`Invalid`|
|`ACP`|`DOOR_AFT_CARGO_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_AFT_CARGO_OPEN>`|
|`ACP`|`DOOR_AFT_EE_ACCESS_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_AFT_EE_ACCESS_OPEN>`|
|`ACP`|`DOOR_BULK_CARGO_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_BULK_CARGO_OPEN>`|
|`ACP`|`DOOR_ENTRY_1L_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_ENTRY_1L_OPEN>`|
|`ACP`|`DOOR_ENTRY_1R_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_ENTRY_1R_OPEN>`|
|`ACP`|`DOOR_ENTRY_2L_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_ENTRY_2L_OPEN>`|
|`ACP`|`DOOR_ENTRY_2R_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_ENTRY_2R_OPEN>`|
|`ACP`|`DOOR_ENTRY_3L_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_ENTRY_3L_OPEN>`|
|`ACP`|`DOOR_ENTRY_3R_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_ENTRY_3R_OPEN>`|
|`ACP`|`DOOR_ENTRY_4L_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_ENTRY_4L_OPEN>`|
|`ACP`|`DOOR_ENTRY_4R_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_ENTRY_4R_OPEN>`|
|`ACP`|`DOOR_FWD_ACCESS_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_FWD_ACCESS_OPEN>`|
|`ACP`|`DOOR_FWD_CARGO_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_FWD_CARGO_OPEN>`|
|`ACP`|`DOOR_FWD_EE_ACCESS_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_FWD_EE_ACCESS_OPEN>`|
|`ACP`|`DOOR_FWD_OVERHEAD_OPEN`|`Boolean`|`<n/a>`|`<n/a>`|`<DOOR_FWD_OVERHEAD_OPEN>`|
|`ACP`|`ECS_APU_RUNNING`|`Boolean`|`<n/a>`|`<n/a>`|`<ECS_APU_RUNNING>`|
|`ACP`|`EEC_ENG_OIL_P_L `|`Real`|`<n/a>`|`<n/a>`|`<EEC_ENG_OIL_P_L>`|
|`ACP`|`EEC_ENG_OIL_P_R `|`Real`|`<n/a>`|`<n/a>`|`<EEC_ENG_OIL_P_R>`|
|`ACP`|`EEC_ENG_OIL_T_L `|`Real`|`<n/a>`|`<n/a>`|`<EEC_ENG_OIL_T_L>`|
|`ACP`|`EEC_ENG_OIL_T_R `|`Real`|`<n/a>`|`<n/a>`|`<EEC_ENG_OIL_T_R>`|



337 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`ACP`|`EICAS_ENG_N1_SPD_L `|`Real`|`<n/a>`|`<n/a>`|`<EICAS_ENG_N1_SPD_L>`|
|`ACP`|`EICAS_ENG_N1_SPD_R `|`Real`|`<n/a>`|`<n/a>`|`<EICAS_ENG_N1_SPD_R>`|
|`UDP`|`EMAIL_DL_CC_1_DOMAIN`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_CC_1_LOCAL`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_CC_2_DOMAIN`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_CC_2_LOCAL`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_CC_3_DOMAIN`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_CC_3_LOCAL`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_REPLY_SUBJECT`|`String`|`Yes`|`No`|`<EMAIL_UL_SUBJECT>`|
|`UDP`|`EMAIL_DL_REPLY_TO_DOMAIN`|`String`|`Yes`|`No`|`<EMAIL_UL_FROM_DOMAIN>`|
|`UDP`|`EMAIL_DL_REPLY_TO_LOCAL`|`String`|`Yes`|`No`|`<EMAIL_UL_FROM_LOCAL>`|
|`UDP`|`EMAIL_DL_REPLY_TXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_REPLY_TXT_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_REPLY_TXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_REPLY_TXT_4 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_REPLY_TXT_5 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_REPLY_TXT_6 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_REPLY_TXT_7 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_REPLY_TXT_8 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_REPLY_TXT_9 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_SUBJECT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_TO_DOMAIN`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_TO_LOCAL`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_TXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_TXT_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_TXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_TXT_4 `|`String`|`Yes`|`No`|`Invalid`|



338 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`EMAIL_DL_TXT_5 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_TXT_6 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_TXT_7 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_TXT_8 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_DL_TXT_9 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_UL_FROM_DOMAIN`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_UL_FROM_LOCAL`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMAIL_UL_SUBJECT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMERGENCY_CLBRATE_THRESHOLD`|`Integer`|`No`|`Yes`|`7500`|
|`UDP`|`EMERGENCY_COUNTER`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMERGENCY_DESRATE_THRESHOLD`|`Integer`|`No`|`Yes`|`7500`|
|`UDP`|`EMERGENCY_ENABLED`|`Boolean`|`Yes`|`Yes`|`FALSE`|
|`UDP`|`EMERGENCY_FREQUENCY`|`Integer`|`No`|`Yes`|`60`|
|`UDP`|`EMERGENCY_FUEL_THRESHOLD`|`Integer`|`No`|`Yes`|`5500`|
|`UDP`|`EMERGENCY_LOW_SPEED_THRESHOLD`|`Integer`|`No`|`Yes`|`100`|
|`UDP`|`EMERGENCY_MIN_ALTITUDE`|`Integer`|`No`|`Yes`|`10000`|
|`UDP`|`EMERGENCY_MMO_THRESHOLD`|`Real`|`No`|`Yes`|`0.05`|
|`UDP`|`EMERGENCY_N1_THRESHOLD`|`Integer`|`No`|`Yes`|`5`|
|`UDP`|`EMERGENCY_PITCH_RATE_THRESHOLD`|`Real`|`No`|`Yes`|`10`|
|`UDP`|`EMERGENCY_PITCH_THRESHOLD`|`Real`|`No`|`Yes`|`20`|
|`UDP`|`EMERGENCY_SELECTION`|`Integer`|`Yes`|`No`|`2`|
|`UDP`|`EMERGENCY_STATE_ATTITUDE`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`EMERGENCY_STATE_CLB`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`EMERGENCY_STATE_DES`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`EMERGENCY_STATE_EO`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`EMERGENCY_STATE_FUEL`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`EMERGENCY_STATE_SPD`|`Boolean`|`Yes`|`No`|`FALSE`|



339 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`EMERGENCY_STATE_VERT_RATE`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`EMERGENCY_TPR_THRESHOLD`|`Real`|`No`|`Yes`|`5`|
|`UDP`|`EMERGENCY_VERT_ACCEL_THRESHOLD`|`Real`|`No`|`Yes`|`2.5`|
|`UDP`|`EMERGENCY_VMO_THRESHOLD`|`Integer`|`No`|`Yes`|`30`|
|`UDP`|`EMERGENCY_YAW_RATE_THRESHOLD`|`Real`|`No`|`Yes`|`10`|
|`UDP`|`EMER_SITU_TXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMER_SITU_TXT_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`EMER_SITU_TXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`END_EMERGENCY`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`ENGINE_OUT_LEFT`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`ENGINE_OUT_RIGHT`|`Boolean`|`Yes`|`No`|`FALSE`|
|`ACP`|`ENGINE_TYPE`|`Integer`|`<n/a>`|`<n/a>`|`<ENGINE_TYPE>`|
|`ACP`|`ENG_L_START_SW`|`Integer`|`<n/a>`|`<n/a>`|`<ENG_L_START_SW>`|
|`ACP`|`ENG_R_START_SW`|`Integer`|`<n/a>`|`<n/a>`|`<ENG_R_START_SW>`|
|`ACP`|`ENG_TPR_ACTUAL_L `|`Real`|`<n/a>`|`<n/a>`|`<ENG_TPR_ACTUAL_L>`|
|`ACP`|`ENG_TPR_ACTUAL_R `|`Real`|`<n/a>`|`<n/a>`|`<ENG_TPR_ACTUAL_R>`|
|`UDP`|`ENTERED_FLTNO`|`String`|`Yes`|`No`|`<FMF_CMF_FLIGHT_NUMBER>`|
|`UDP`|`EOF_TIMER`|`Integer`|`No`|`Yes`|`Invalid`|
|`UDP`|`EST_IN_TIME`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`EST_OFF_TIME`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`EST_ON_TIME`|`Integer`|`Yes`|`No`|`<FMF_DEST_ETA>`|
|`UDP`|`EST_OUT_TIME`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`ETA_CHANGE`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`ETA_ETA`|`Integer`|`Yes`|`No`|`<FMF_DEST_ETA>`|
|`UDP`|`ETA_FUEL_ON_BD`|`Real`|`Yes`|`No`|`<FUEL_ON_BOARD>`|
|`UDP`|`ETA_SUPLMT_TXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`ETA_SUPLMT_TXT_2 `|`String`|`Yes`|`No`|`Invalid`|



340 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`ETA_SUPLMT_TXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`ACP`|`EXTERNAL_UPLINK_LABEL`|`String`|`<n/a>`|`<n/a>`|`<EXTERNAL_UPLINK_LABEL>`|
|`ACP`|`EXTERNAL_UPLINK_TEXT`|`Text Block`|`<n/a>`|`<n/a>`|`<EXTERNAL_UPLINK_TEXT>`|
|`ACP`|`FCM_AP_ENGD`|`Boolean`|`<n/a>`|`<n/a>`|`<FCM_AP_ENGD>`|
|`ACP`|`FCM_FLAPS_SLATS_NORM`|`Real`|`<n/a>`|`<n/a>`|`<FCM_FLAPS_SLATS_NORM>`|
|`ACP`|`FCM_FLAP_LVR_POSN`|`Real`|`<n/a>`|`<n/a>`|`<FCM_FLAP_LVR_POSN>`|
|`ACP`|`FCM_LAND_2_ASA`|`Boolean`|`<n/a>`|`<n/a>`|`<FCM_LAND_2_ASA>`|
|`ACP`|`FCM_LAND_3_ASA`|`Boolean`|`<n/a>`|`<n/a>`|`<FCM_LAND_3_ASA>`|
|`ACP`|`FCM_NO_AUTOLAND_ASA`|`Boolean`|`<n/a>`|`<n/a>`|`<FCM_NO_AUTOLAND_ASA>`|
|`ACP`|`FCM_TOGA_SW_VOTED`|`Boolean`|`<n/a>`|`<n/a>`|`<FCM_TOGA_SW_VOTED>`|
|`UDP`|`FLIGHT_FUEL`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`FLIGHT_TIME`|`Integer`|`No`|`Yes`|`Invalid`|
|`ACP`|`FMF_ACTIVE_WPT`|`String`|`<n/a>`|`<n/a>`|`<FMF_ACTIVE_WPT>`|
|`ACP`|`FMF_ACTRTEDEST`|`String`|`<n/a>`|`<n/a>`|`<FMF_ACTRTEDEST>`|
|`ACP`|`FMF_ACTRTEORIGIN`|`String`|`<n/a>`|`<n/a>`|`<FMF_ACTRTEORIGIN>`|
|`ACP`|`FMF_ALT_AT_LAST_WYPT`|`Real`|`<n/a>`|`<n/a>`|`<FMF_ALT_AT_LAST_WYPT>`|
|`ACP`|`FMF_ATA_LAST_WYPT`|`Integer`|`<n/a>`|`<n/a>`|`<FMF_ATA_LAST_WYPT>`|
|`ACP`|`FMF_CG`|`Real`|`<n/a>`|`<n/a>`|`<FMF_CG>`|
|`ACP`|`FMF_CMF_FLIGHT_NUMBER`|`String`|`<n/a>`|`<n/a>`|`<ACARS_10_CHAR_FLIGHT_NUMBER>`|
|`ACP`|`FMF_COST_INDEX`|`Real`|`<n/a>`|`<n/a>`|`<FMF_COST_INDEX>`|
|`UDP`|`FMF_DEST_ETA`|`Integer`|`Yes`|`No`|`Invalid`|
|`ACP`|`FMF_DEST_RNWYID`|`String`|`<n/a>`|`<n/a>`|`<FMF_DEST_RNWYID>`|
|`ACP`|`FMF_DIST_TO_DEST`|`Real`|`<n/a>`|`<n/a>`|`<FMF_DIST_TO_DEST>`|
|`ACP`|`FMF_DIST_TO_GO`|`Real`|`<n/a>`|`<n/a>`|`<FMF_DIST_TO_GO>`|
|`ACP`|`FMF_ENG_OUT_MAX_ALT`|`Real`|`<n/a>`|`<n/a>`|`<FMF_ENG_OUT_MAX_ALT>`|
|`ACP`|`FMF_ETA`|`Integer`|`<n/a>`|`<n/a>`|`<ETA_ACTIVE_WAYPOINT>`|
|`UDP`|`FMF_ETA_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|



341 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`ACP`|`FMF_ETA_TOP_OF_DESC`|`Integer`|`<n/a>`|`<n/a>`|`<ETA_TOP_OF_DESCENT>`|
|`ACP`|`FMF_FIRST_ATC_COMPULSORY_WPT`|`String`|`<n/a>`|`<n/a>`|`<FMF_FIRST_ATC_COMPULSORY_WPT>`|
|`ACP`|`FMF_FIRST_ATC_COMPULS_WPT_ETA`|`Integer`|`<n/a>`|`<n/a>`|`<ETA_FIRST_ATC_COMPULS_WPT>`|
|`ACP`|`FMF_FLIGHT_PHASE`|`Integer`|`<n/a>`|`<n/a>`|`<FMF_FLIGHT_PHASE>`|
|`ACP`|`FMF_FUEL_AT_DEST`|`Real`|`<n/a>`|`<n/a>`|`<FUEL_AT_DESTINATION>`|
|`ACP`|`FMF_FUEL_REMAINING_WEIGHT`|`Real`|`<n/a>`|`<n/a>`|`<CUR_FUELREMAIN_WT>`|
|`ACP`|`FMF_FUEL_USED_L `|`Real`|`<n/a>`|`<n/a>`|`<FUEL_USED_L>`|
|`ACP`|`FMF_FUEL_USED_R `|`Real`|`<n/a>`|`<n/a>`|`<FUEL_USED_R>`|
|`ACP`|`FMF_GROSS_WEIGHT`|`Real`|`<n/a>`|`<n/a>`|`<GROSS_WEIGHT>`|
|`ACP`|`FMF_LAST_WPT`|`String`|`<n/a>`|`<n/a>`|`<FMF_LAST_WPT>`|
|`ACP`|`FMF_NEXT_WPT`|`String`|`<n/a>`|`<n/a>`|`<FMF_NEXT_WPT>`|
|`ACP`|`FMF_ORIGIN_RWY_ID`|`String`|`<n/a>`|`<n/a>`|`<FMF_ORG_RWY_ID>`|
|`ACP`|`FMF_SECOND_ATC_COMPULS_WPT`|`String`|`<n/a>`|`<n/a>`|`<FMF_SECOND_ATC_COMPULS_WPT>`|
|`ACP`|`FMF_TIME_FOR_CLIMB`|`Integer`|`<n/a>`|`<n/a>`|`<TIME_FOR_CLIMB>`|
|`ACP`|`FMF_TIME_TO_DEST`|`Integer`|`<n/a>`|`<n/a>`|`<TIME_TO_DESTINATION>`|
|`ACP`|`FMF_TRANSITION_ALT`|`Real`|`<n/a>`|`<n/a>`|`<FMF_TRANSITION_ALT>`|
|`ACP`|`FMF_ZERO_FUEL_WT`|`Real`|`<n/a>`|`<n/a>`|`<ZERO_FUEL_WEIGHT>`|
|`UDP`|`FRL_CHK_ITEM_NO`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`FRL_CHK_LINE_NO`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`FRL_OTHER`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`FRL_REASON`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`FTREL_CO_RTE`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`FTREL_FLT_LVL`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`FTREL_REQST_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`FTREL_REQST_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`FTREL_REQST_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`FTREL_ROUTE`|`Boolean`|`Yes`|`No`|`Invalid`|



342 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`FTREL_RTE_WIND`|`Boolean`|`Yes`|`No`|`Invalid`|
|`UDP`|`FTREL_WIND`|`Boolean`|`Yes`|`No`|`Invalid`|
|`UDP`|`FUEL_ON_BOARD`|`Real`|`No`|`No`|`Invalid`|
|`UDP`|`FUEL_ON_BOARD_CHECK`|`Real`|`Yes`|`No`|`Invalid`|
|`ACP`|`FUEL_SW_L_CUTOFF`|`Boolean`|`<n/a>`|`<n/a>`|`<FUEL_SW_L_CUTOFF>`|
|`ACP`|`FUEL_SW_R_CUTOFF`|`Boolean`|`<n/a>`|`<n/a>`|`<FUEL_SW_R_CUTOFF>`|
|`UDP`|`GATE_REQUEST_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`GATE_REQUEST_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`GATE_REQUEST_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`GATE_RQST_FLTNO`|`String`|`Yes`|`No`|`<ENTERED_FLTNO>`|
|`UDP`|`GTA_OTHER`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`GTA_REASON`|`Integer`|`Yes`|`No`|`Invalid`|
|`ACP`|`HFDR_DATA_CHANNEL_AVAILABLE`|`Boolean`|`<n/a>`|`<n/a>`|`<HFDR_DATA_CHANNEL_AVAILABLE>`|
|`ACP`|`HF_LINK_STATUS`|`Integer`|`<n/a>`|`<n/a>`|`<HF_LINK_STATUS>`|
|`UDP`|`HF_STRENGTH`|`Integer`|`Yes`|`No`|`0`|
|`ACP`|`HF_VOICE_MODE`|`Boolean`|`<n/a>`|`<n/a>`|`<HF_VOICE_MODE>`|
|`ACP`|`ICAO_AIRCRAFT_ADDRESS`|`Integer`|`<n/a>`|`<n/a>`|`<ICAO_AIRCRAFT_ADDRESS>`|
|`UDP`|`IN`|`Integer`|`Yes`|`No`|`4`|
|`UDP`|`INIT_ALTN_STA_1 `|`String`|`No`|`Yes`|`Invalid`|
|`UDP`|`INIT_ALTN_STA_2 `|`String`|`No`|`Yes`|`Invalid`|
|`UDP`|`INIT_BOARDED_FUEL`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`INIT_DEST_STA`|`String`|`Yes`|`No`|`<FMF_ACTRTEDEST>`|
|`UDP`|`INIT_FLIGHT_PLAN_TIME`|`Integer`|`No`|`Yes`|`Invalid`|
|`UDP`|`INIT_FOB`|`Real`|`Yes`|`No`|`<FUEL_ON_BOARD>`|
|`UDP`|`INIT_ORIG_STA`|`String`|`Yes`|`No`|`<FMF_ACTRTEORIGIN>`|
|`UDP`|`INIT_PAY_CAPT`|`String`|`No`|`Yes`|`Invalid`|
|`UDP`|`INIT_PAY_FO_1 `|`String`|`No`|`Yes`|`Invalid`|



343 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`INIT_PAY_FO_2 `|`String`|`No`|`Yes`|`Invalid`|
|`UDP`|`INIT_PAY_FO_3 `|`String`|`No`|`Yes`|`Invalid`|
|`UDP`|`INIT_SKED_DATE`|`Integer`|`No`|`Yes`|`Invalid`|
|`UDP`|`IN_FOB`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`IN_TIME`|`Integer`|`No`|`Yes`|`Invalid`|
|`ACP`|`IRU_RDC_BODY_PITCH_RATE`|`Real`|`<n/a>`|`<n/a>`|`<IRU_RDC_BODY_PITCH_RATE>`|
|`ACP`|`IRU_RDC_BODY_YAW_RATE`|`Real`|`<n/a>`|`<n/a>`|`<IRU_RDC_BODY_YAW_RATE>`|
|`ACP`|`IRU_RDC_INERTIAL_VERT_SPEED`|`Real`|`<n/a>`|`<n/a>`|`<IRU_RDC_INERTIAL_VERT_SPEED>`|
|`ACP`|`IRU_RDC_PITCH_ANGLE`|`Real`|`<n/a>`|`<n/a>`|`<IRU_RDC_PITCH_ANGLE>`|
|`ACP`|`IRU_RDC_VERT_ACCELERATION`|`Real`|`<n/a>`|`<n/a>`|`<IRU_RDC_VERT_ACCELERATION>`|
|`ACP`|`LANDING_GEAR`|`Integer`|`<n/a>`|`<n/a>`|`<LANDING_GEAR>`|
|`UDP`|`LAST_ACTIVE_WPT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`LAST_EMERGENCY_SELECTION`|`Integer`|`Yes`|`No`|`2`|
|`UDP`|`LAST_EMERGENCY_STATE`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`LAST_NAV_POS_LAT`|`Real`|`Yes`|`No`|`Invalid`|
|`UDP`|`LAST_NAV_POS_LONG`|`Real`|`Yes`|`No`|`Invalid`|
|`UDP`|`LDS_CAPTAIN_CODE`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`LDS_CAPTAIN_ID`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`LDS_CONFIRM_REVIEW`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`LDS_DATE`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`LDS_EDNO`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`LDS_FLIGHTNO`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`LDS_TYPE`|`String`|`Yes`|`No`|`Invalid`|
|`ACP`|`LEFT_MAIN_FUEL_DENSITY`|`Real`|`<n/a>`|`<n/a>`|`<LEFT_MAIN_FUEL_DENSITY>`|
|`ACP`|`LOGIC_UNIT_MESSAGES_ENABLED`|`Boolean`|`<n/a>`|`<n/a>`|`<LOGIC_UNIT_MESSAGES_ENABLED>`|
|`ACP`|`LRRA_RADIO_HEIGHT`|`Real`|`<n/a>`|`<n/a>`|`<LRRA_RADIO_HEIGHT>`|
|`ACP`|`L_ENG_OIL_QTY`|`Real`|`<n/a>`|`<n/a>`|`<L_ENG_OIL_QTY>`|



344 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`ACP`|`MAINT_CONFIG_ADM_AIRLINE`|`String`|`<n/a>`|`<n/a>`|`<MAINT_CONFIG_ADM_AIRLINE>`|
|`ACP`|`MAINT_CONFIG_ADM_NONAIRLINE`|`Integer`|`<n/a>`|`<n/a>`|`<MAINT_CONFIG_ADM_NONAIRLINE>`|
|`ACP`|`MAINT_CONFIG_VER_ID`|`Integer`|`<n/a>`|`<n/a>`|`<MAINT_CONFIG_VER_ID>`|
|`UDP`|`MAINT_TEXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MAINT_TEXT_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MAINT_TEXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MAINT_TEXT_4 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MAINT_TEXT_5 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MAINT_TEXT_6 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MANUAL_EMERGENCY`|`Boolean`|`Yes`|`No`|`Invalid`|
|`ACP`|`MASTER_HFDR`|`Integer`|`<n/a>`|`<n/a>`|`<MASTER_HFDR>`|
|`ACP`|`MASTER_SDU`|`Integer`|`<n/a>`|`<n/a>`|`<MASTER_SDU>`|
|`ACP`|`MASTER_VDR`|`Integer`|`<n/a>`|`<n/a>`|`<MASTER_VDR>`|
|`UDP`|`MAX_EMERGENCY_RPT`|`Integer`|`No`|`Yes`|`60`|
|`ACP`|`METRIC_ENABLE_ON`|`Boolean`|`<n/a>`|`<n/a>`|`<METRIC_ENABLE_ON>`|
|`UDP`|`MISC_CODE`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MISC_TEXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MISC_TEXT_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MISC_TEXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MISC_TEXT_4 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MISC_TEXT_5 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MISC_TEXT_6 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`MMO`|`Real`|`Yes`|`No`|`0.9`|
|`ACP`|`NAV_ALTITUDE`|`Real`|`<n/a>`|`<n/a>`|`<NAV_ALTITUDE>`|
|`ACP`|`NAV_DATE_DAY`|`Integer`|`<n/a>`|`<n/a>`|`<NAV_DATE_DAY>`|
|`ACP`|`NAV_DATE_MONTH`|`Integer`|`<n/a>`|`<n/a>`|`<NAV_DATE_MONTH>`|
|`ACP`|`NAV_DATE_YEAR`|`Integer`|`<n/a>`|`<n/a>`|`<NAV_DATE_YEAR>`|



345 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`ACP`|`NAV_GROUNDSPEED`|`Real`|`<n/a>`|`<n/a>`|`<NAV_GROUNDSPEED>`|
|`ACP`|`NAV_MAG_HDG`|`Real`|`<n/a>`|`<n/a>`|`<NAV_MAG_HDG>`|
|`ACP`|`NAV_MAG_TRACK`|`Real`|`<n/a>`|`<n/a>`|`<NAV_MAG_TRACK>`|
|`ACP`|`NAV_POS_LAT`|`Real`|`<n/a>`|`<n/a>`|`<NAV_POS_LAT>`|
|`ACP`|`NAV_POS_LON`|`Real`|`<n/a>`|`<n/a>`|`<NAV_POS_LON>`|
|`ACP`|`NAV_TRUE_HDG`|`Real`|`<n/a>`|`<n/a>`|`<NAV_TRUE_HDG>`|
|`ACP`|`NAV_TRUE_TRACK`|`Real`|`<n/a>`|`<n/a>`|`<NAV_TRUE_TRACK>`|
|`ACP`|`NAV_UTC_HOURS`|`Integer`|`<n/a>`|`<n/a>`|`<NAV_UTC_HOURS>`|
|`ACP`|`NAV_UTC_MINUTES`|`Integer`|`<n/a>`|`<n/a>`|`<NAV_UTC_MINUTES>`|
|`ACP`|`NAV_UTC_SECONDS`|`Integer`|`<n/a>`|`<n/a>`|`<NAV_UTC_SECONDS>`|
|`ACP`|`NAV_WIND_MAG`|`Real`|`<n/a>`|`<n/a>`|`<NAV_WIND_MAG>`|
|`ACP`|`NAV_WIND_TRUE_BRG`|`Real`|`<n/a>`|`<n/a>`|`<NAV_WIND_TRUE_BRG>`|
|`ACP`|`ND_HEADING_CAPT`|`Real`|`<n/a>`|`<n/a>`|`<ND_HEADING_CAPT>`|
|`ACP`|`ND_HEADING_FO`|`Real`|`<n/a>`|`<n/a>`|`<ND_HEADING_FO>`|
|`UDP`|`NEW_EMERGENCY`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`NOTAM_ENROUTE`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`NOTAM_REQST_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`NOTAM_REQST_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`NOTAM_REQST_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`NOTAM_SEND`|`Boolean`|`Yes`|`No`|`Invalid`|
|`UDP`|`NOTAM_STA_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`NOTAM_STA_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`NOTAM_UL_TITLE`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`OFF`|`Integer`|`Yes`|`No`|`2`|
|`UDP`|`OFF_FOB`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`OFF_STA`|`String`|`No`|`Yes`|`Invalid`|
|`UDP`|`OFF_TIME`|`Integer`|`No`|`Yes`|`Invalid`|



346 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`OLD_REMINDER_TIME_1 `|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`OLD_REMINDER_TIME_2 `|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`OLD_REMINDER_TIME_3 `|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`ON`|`Integer`|`Yes`|`No`|`3`|
|`UDP`|`ON_FOB`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`ON_STA`|`String`|`No`|`Yes`|`Invalid`|
|`UDP`|`ON_TIME`|`Integer`|`No`|`Yes`|`Invalid`|
|`UDP`|`OOOI_ENABLED`|`Boolean`|`No`|`No`|`Invalid`|
|`UDP`|`OOOI_STATE`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`OOOI_STATUS`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`OUT`|`Integer`|`Yes`|`No`|`1`|
|`UDP`|`OUT_FOB`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`OUT_TIME`|`Integer`|`No`|`Yes`|`Invalid`|
|`UDP`|`OVER_ACCEL`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`OVER_CAS`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`OVER_MACH`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`OVER_PITCH`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`OVER_PITCH_RATE`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`OVER_YAW_RATE`|`Boolean`|`Yes`|`No`|`FALSE`|
|`ACP`|`PARKINGBRKLEVERSET`|`Boolean`|`<n/a>`|`<n/a>`|`<PARKING_BRK_LEVER_SET>`|
|`UDP`|`POA_AUTOTUNE_ENABLE_WRITE`|`Boolean`|`Yes`|`No`|`FALSE`|
|`UDP`|`POA_AUTOTUNE_FREQUENCY`|`Real`|`Yes`|`No`|`Invalid`|
|`UDP`|`POS_RPT_COUNTER`|`Integer`|`Yes`|`No`|`0`|
|`UDP`|`POS_RPT_ENABLE`|`Boolean`|`No`|`Yes`|`TRUE`|
|`UDP`|`POS_RPT_INTERVAL`|`Integer`|`No`|`Yes`|`15`|
|`UDP`|`PREV_BLOCK_FUEL`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_BLOCK_TIME`|`Integer`|`No`|`Yes`|`Invalid`|



347 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`PREV_BOARDED_FUEL`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_DEST_STA`|`String`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_FLIGHT_FUEL`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_FLIGHT_NUMBER`|`String`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_FLIGHT_TIME`|`Integer`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_IN_FOB`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_IN_TIME`|`Integer`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_OFF_FOB`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_OFF_TIME`|`Integer`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_ON_FOB`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_ON_TIME`|`Integer`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_ORIG_STA`|`String`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_OUT_FOB`|`Real`|`No`|`Yes`|`Invalid`|
|`UDP`|`PREV_OUT_TIME`|`Integer`|`No`|`Yes`|`Invalid`|
|`ACP`|`PRINTER_STATUS`|`Integer`|`<n/a>`|`<n/a>`|`<PRINTER_STATUS>`|
|`ACP`|`PRINT_QUEUE_FULL`|`Boolean`|`<n/a>`|`<n/a>`|`<PRINT_QUEUE_FULL>`|
|`UDP`|`PRINT_TXT_BLK`|`Text Block`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_ACT_CTR`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_NEXT_CTR`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_ORIGINATOR`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_POSITION`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_10`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_11`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_12`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_13`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_14`|`String`|`Yes`|`No`|`Invalid`|



348 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`PR_TEXT_15`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_16`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_17`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_18`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_4 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_5 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_6 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_7 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_8 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_TEXT_9 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_UTC_DATE`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`PR_UTC_TIME`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`RA1_TITLE`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`RA2_GND_ADDR`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`RA4_GND_ADDR`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`RA4_TXT_BLK`|`Text Block`|`Yes`|`No`|`Invalid`|
|`UDP`|`RADIO_ALT_REACHED`|`Boolean`|`No`|`Yes`|`Invalid`|
|`UDP`|`REGISTRATION_NO`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_ALTITUDE`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_ALTITUDE_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_ALTITUDE_TEXT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_ENABLE_ETA_CHANGE`|`Boolean`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_ETA_BASELINE`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_ETA_BASELINE_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_ETA_CHANGE`|`Integer`|`Yes`|`No`|`3`|



349 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`REMINDER_ETA_CHANGE_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_ETA_CHANGE_TEXT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_FL`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_FL_ALT`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_FL_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_FL_TEXT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_FMF_ETA`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_FMF_LAST_WPT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_FUEL`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_FUEL_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_FUEL_TEXT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_LAT`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_LAT_DIR`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_LAT_DIR_DISPLAY`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_LAT_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_LAT_TEXT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_LONG`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_LONG_DIR`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_LONG_DIR_DISPLAY`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_LONG_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_LONG_TEXT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_POSN`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_POSN_DISPLAY`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_POSN_TEXT`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_SIDELINK_ALT_B `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_SIDELINK_ETA_B `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_SIDELINK_FL_B `|`String`|`Yes`|`No`|`Invalid`|



350 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`REMINDER_SIDELINK_FUEL_B `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_SIDELINK_LAT_B `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_SIDELINK_LONG_B `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_SIDELINK_POSN_B `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_SIDELINK_TIME1_B `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_SIDELINK_TIME2_B `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_SIDELINK_TIME3_B `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_SIDELINK_TIME_DEST_B `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_SIDELINK_TIME_TOD_B `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_1 `|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_1_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_2 `|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_2_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_3 `|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_3_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_DEST`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_DEST_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_TEXT_1 `|`String`|`Yes`|`No`|`CREW CHANGE`|
|`UDP`|`REMINDER_TIME_TEXT_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_TEXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_TEXT_DEST`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_TEXT_TOD`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_TOD`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REMINDER_TIME_TOD_DISPLAY`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`RETURN_TO_GATE`|`Boolean`|`Yes`|`No`|`Invalid`|
|`UDP`|`REVISED_LAT`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REVISED_LONG`|`Integer`|`Yes`|`No`|`Invalid`|



351 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`UDP`|`REVISED_REMINDER_TIME_1 `|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REVISED_REMINDER_TIME_2 `|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`REVISED_REMINDER_TIME_3 `|`Integer`|`Yes`|`No`|`Invalid`|
|`ACP`|`RIGHT_MAIN_FUEL_DENSITY`|`Real`|`<n/a>`|`<n/a>`|`<RIGHT_MAIN_FUEL_DENSITY>`|
|`ACP`|`R_ENG_OIL_QTY`|`Real`|`<n/a>`|`<n/a>`|`<R_ENG_OIL_QTY>`|
|`ACP`|`SATCOM_DATA_CHANNEL_AVAILABLE`|`Boolean`|`<n/a>`|`<n/a>`|`<SATCOM_DATA_CHANNEL_AVAILABLE>`|
|`ACP`|`SATCOM_LINK_STATUS`|`Integer`|`<n/a>`|`<n/a>`|`<SATCOM_LINK_STATUS>`|
|`UDP`|`SATCOM_STRENGTH`|`Integer`|`Yes`|`No`|`0`|
|`UDP`|`TIME_AT_WPT_CHG`|`Integer`|`Yes`|`No`|`Invalid`|
|`ACP`|`TIME_SINCE_POWER_ON`|`Integer`|`<n/a>`|`<n/a>`|`<TIME_SINCE_POWER_ON>`|
|`UDP`|`TIME_SINCE_WPT_CHG`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`TIME_TO_WPT_CHG`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`TKO_FLAP`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`TKO_FUEL`|`Real`|`Yes`|`No`|`<OFF_FOB>`|
|`UDP`|`TKO_N1`|`Real`|`Yes`|`No`|`Invalid`|
|`UDP`|`TKO_PILOT`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`TKO_SUPLMT_TXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`TKO_SUPLMT_TXT_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`TKO_SUPLMT_TXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`TKO_TIME`|`Integer`|`Yes`|`No`|`<OFF_TIME>`|
|`UDP`|`TKO_TPR`|`Integer`|`Yes`|`No`|`Invalid`|
|`ACP`|`TOTAL_FILTERED_FUEL_MASS`|`Integer`|`<n/a>`|`<n/a>`|`<TOTAL_FILTERED_FUEL_MASS>`|
|`UDP`|`TOUCH_AND_GO`|`Boolean`|`Yes`|`No`|`Invalid`|
|`UDP`|`UNDER_CAS`|`Boolean`|`Yes`|`No`|`FALSE`|
|`ACP`|`UPLINK_LABEL`|`String`|`<n/a>`|`<n/a>`|`<UPLINK_LABEL>`|
|`ACP`|`UPLINK_TEXT`|`Text Block`|`<n/a>`|`<n/a>`|`<UPLINK_TEXT>`|
|`UDP`|`UPLINK_TXT_BLK`|`Text Block`|`Yes`|`No`|`Invalid`|



352 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**`Class`**|**`Parameter Name`**|**`Type`**|**`Default`**<br>**`Upon Reset`**|**`Save In NVM`**|**`Default/Aliased Parameter or`**<br>**`Initial Value`**|
|---|---|---|---|---|---|
|`ACP`|`VDR_STATE`|`Integer`|`<n/a>`|`<n/a>`|`<VDR_STATE>`|
|`ACP`|`VDR_SUBSTATE_ACP`|`Integer`|`<n/a>`|`<n/a>`|`<VDR_SUBSTATE>`|
|`UDP`|`VDR_SUBSTATE_UDP`|`Integer`|`Yes`|`No`|`Invalid`|
|`ACP`|`VHF_LINK_STATUS`|`Integer`|`<n/a>`|`<n/a>`|`<VHF_LINK_STATUS>`|
|`UDP`|`VHF_STRENGTH`|`Integer`|`Yes`|`No`|`0`|
|`ACP`|`VHF_SUBNETWORK_TYPE`|`Integer`|`<n/a>`|`<n/a>`|`<VHF_SUBNETWORK_TYPE>`|
|`UDP`|`VHF_VOICE_FREQ`|`Real`|`Yes`|`No`|`Invalid`|
|`ACP`|`VHF_VOICE_MODE`|`Boolean`|`<n/a>`|`<n/a>`|`<VHF_VOICE_MODE>`|
|`UDP`|`VHF_VOICE_TXT_BLK`|`Text Block`|`Yes`|`No`|`Invalid`|
|`UDP`|`VMO`|`Integer`|`Yes`|`No`|`360`|
|`UDP`|`WAB_CHK_ITEM_NO`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`WAB_CHK_LINE_NO`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`WAB_OTHER`|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`WAB_REASON`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`WTBAL_RQST_TXT_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`WTBAL_RQST_TXT_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`WTBAL_RQST_TXT_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`WXR_STA_1 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`WXR_STA_2 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`WXR_STA_3 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`WXR_STA_4 `|`String`|`Yes`|`No`|`Invalid`|
|`UDP`|`WXR_TYPE_RQST`|`Integer`|`Yes`|`No`|`Invalid`|
|`UDP`|`WX_TITLE`|`String`|`Yes`|`No`|`Invalid`|



353 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **13.2 Datalink Options** 

This section describes the various datalink options selected for the CMF baseline AMI in the Datalink Options component. 

## **13.2.1 VHF Region Tables** 

The VHF Region Tables control the VHF radio tuning function in CMF and contain data for up to 20 user-defined regions, plus Other (used when the airplane is outside of a user-defined region) and Default (used when CMF does not know the airplane’s position) regions.  These tables are defined as follows in the CMF baseline AMI: 

```
    Region Name ................................................ "GUAM"
        Frequencies
            1   131.550
            2   131.725
        Areas
            Top Left Corner   Bottom Right Corner
            ---------------   -------------------
            N20.00 E142.00    N18.00 E149.00
            N18.00 E140.00    N11.00 E150.00
            N11.00 E141.00    N 9.00 E149.00
        Preferences
            1   POA
            2   None
            3   None
            4   None
            5   None
            6   None
            7   None
            8   None
        AOA Service Providers
            1   None
            2   None
            3   None
            4   None
    Region Name ................................................ "KYRGYZSTN"
        Frequencies
            1   131.450
            2   131.725
            3   131.825
        Areas
```

354 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
Top Left Corner   Bottom Right Corner
---------------   -------------------
N48.00 E 79.00    N47.00 E 86.00
N47.00 E 79.00    N42.00 E 81.00
N42.00 E 73.00    N36.00 E 81.00
Preferences
1   POA
2   None
3   None
4   None
5   None
6   None
7   None
8   None
AOA Service Providers
1   None
2   None
3   None
4   None
```

```
    Region Name ................................................ "RUSSIA"
Frequencies
1   131.725
2   131.550
Areas
Top Left Corner   Bottom Right Corner
---------------   -------------------
N73.00 E 77.00    N54.00 E166.00
N54.00 E 77.00    N53.00 E115.00
N53.00 E 86.00    N52.00 E115.00
N52.00 E 86.00    N50.50 E 99.00
N54.00 E130.00    N52.00 E166.00
N52.00 E151.00    N49.00 E166.00
Preferences
1   POA
2   None
3   None
4   None
5   None
6   None
7   None
8   None
AOA Service Providers
1   None
2   None
3   None
```

355 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
4   None
```

```
    Region Name ................................................ "ANDAMAN"
Frequencies
1   131.725
2   131.825
3   131.450
4   131.550
Areas
Top Left Corner   Bottom Right Corner
---------------   -------------------
N15.00 E 93.00    N14.00 E 95.00
N14.00 E 93.00    N 9.00 E 96.00
N 9.00 E 93.00    N 8.00 E 95.00
 Preferences
1   POA
2   None
3   None
4   None
5   None
6   None
7   None
8   None
AOA Service Providers
1   None
2   None
3   None
4   None
```

```
    Region Name ................................................ "ASIA/AUST"
Frequencies
1   131.450
2   131.550
3   131.725
Areas
Top Left Corner   Bottom Right Corner
---------------   -------------------
N54.00 E115.00    N52.00 E130.00
N52.00 E 99.00    N50.50 E151.00
N50.50 E 86.00    N47.00 E151.00
N47.00 E 81.00    N32.00 E151.00
N32.00 E 96.00    N28.00 E151.00
N28.00 E 96.00    N22.50 E135.00
N22.50 E 92.00    N 3.00 E135.00
N 3.00 E 92.00    S 5.00 E153.00
S 5.00 E101.00    S15.00 W145.00
```

356 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
            S15.00 E109.00    S50.00 W145.00
        Preferences
            1   AOA
            2   POA
            3   None
            4   None
            5   None
            6   None
            7   None
            8   None
        AOA Service Providers
            1   SITA 2
            2   ARINC 1
            3   AVICOM JAPAN 960
            4   None
    Region Name ................................................ "MIDL EAST"
        Frequencies
            1   131.725
            2   131.475
        Areas
            Top Left Corner   Bottom Right Corner
            ---------------   -------------------
            N37.00 E 42.00    N35.00 E 48.00
            N35.00 E 40.00    N34.00 E 48.00
            N34.00 E 40.00    N28.00 E 69.00
            N28.00 E 37.00    N25.00 E 69.00
            N25.00 E 36.00    N21.00 E 69.00
            N21.00 E 36.00    N17.00 E 63.00
            N17.00 E 43.00    N15.00 E 63.00
            N15.00 E 46.00    N13.50 E 63.00
        Preferences
            1   AOA
            2   POA
            3   None
            4   None
            5   None
            6   None
            7   None
            8   None
        AOA Service Providers
            1   SITA 2
            2   ARINC 1
            3   None
            4   None
```

357 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
    Region Name ................................................ "EUR/AFRIC"
Frequencies
1   131.725
2   131.825
Areas
Top Left Corner   Bottom Right Corner
---------------   -------------------
N83.00 W 11.00    N60.00 E 77.00
N60.00 W 17.00    N53.00 E 77.00
N53.00 W 17.00    N47.00 E 86.00
N47.00 W 17.00    N43.00 E 81.00
N43.00 W 36.00    N32.00 E 81.00
      N32.00 W 28.00    N22.50 E 96.00
N22.50 W 28.00    N15.00 E 92.00
N15.00 W 28.00    N 8.00 E 93.00
N 8.00 W 28.00    N 0.00 E 92.00
N 0.00 E  2.00    S38.00 E 62.00
Preferences
1   AOA
2   POA
3   None
4   None
5   None
6   None
7   None
8   None
AOA Service Providers
1   SITA 2
2   ARINC 1
3   None
4   None
```

```
    Region Name ................................................ "N.ATLANTC"
Frequencies
1   131.550
2   131.725
Areas
Top Left Corner   Bottom Right Corner
---------------   -------------------
N71.00 W 59.00    N70.00 W 44.00
N70.00 W 59.00    N68.00 W 28.00
N68.00 W 59.00    N60.00 W 11.00
N60.00 W 53.00    N59.00 W 17.00
N59.00 W 53.00    N56.00 W 36.00
  Preferences
1   AOA
```

358 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
            2   POA
            3   None
            4   None
            5   None
            6   None
            7   None
            8   None
        AOA Service Providers
            1   ARINC 1
            2   SITA 2
            3   None
            4   None
    Region Name ................................................ "AMERICAS"
        Frequencies
            1   131.550
            2   131.725
        Areas
            Top Left Corner   Bottom Right Corner
            ---------------   -------------------
            N76.00 E166.00    N60.00 W 59.00
            N60.00 E166.00    N56.00 W 53.00
            N56.00 E166.00    N47.00 W 46.00
            N47.00 W131.00    N41.00 W 46.00
            N41.00 W131.00    N30.00 W 55.00
            N30.00 W121.00    N11.00 W 55.00
            N11.00 W 95.00    N 5.00 W 48.00
            N 5.00 W 95.00    S 5.00 W 28.00
            S 5.00 W 85.00    S28.00 W 28.00
            S28.00 W 85.00    S59.00 W 45.00
        Preferences
            1   AOA
            2   POA
            3   None
            4   None
            5   None
            6   None
            7   None
            8   None
        AOA Service Providers
            1   ARINC 1
            2   SITA 2
            3   BRAZIL 961
            4   None
    Region Name ................................................ "HAWAII"
```

359 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

```
        Frequencies
            1   131.550
            2   131.725
        Areas
            Top Left Corner   Bottom Right Corner
            ---------------   -------------------
            N26.00 W164.00    N24.00 W153.00
            N24.00 W164.00    N17.00 W150.00
            N17.00 W160.00    N15.00 W151.00
        Preferences
            1   AOA
            2   POA
            3   None
            4   None
            5   None
            6   None
            7   None
            8   None
        AOA Service Providers
            1   ARINC 1
            2   SITA 2
            3   None
            4   None
    Region Name ................................................ "Other"
        Frequencies
            No Frequencies
        Preferences
            1   None
            2   None
            3   None
            4   None
            5   None
            6   None
            7   None
            8   None
        AOA Service Providers
            1   None
            2   None
            3   None
            4   None
    Region Name ................................................ "Default"
        Frequencies
            1   131.550
            2   131.725
```

360 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

```
            3   131.450
            4   131.825
            5   131.475
        Preferences
            1   AOA
            2   POA
            3   None
            4   None
            5   None
            6   None
            7   None
            8   None
        AOA Service Providers
            1   AVICOM JAPAN 960
            2   SITA 2
            3   ARINC 1
            4   BRAZIL 961
```

Figure 13-1 graphically depicts the user-defined VHF region tables that are defined in the CMF baseline AMI. 

**==> picture [468 x 323] intentionally omitted <==**

**Figure 13-1  User-Defined VHF Region Tables Graphical Depiction** 

D613Z019-06 361 of 378 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **13.2.2 Timers** 

Table 13-2 describes the Datalink Options component timers and their values in the CMF baseline AMI. 

**Table 13-2  Datalink Options Timers** 

|**Timer**|**Value**|
|---|---|
|Normal Scan Timer [seconds]|126|
|Fast Scan Timer [seconds]|15|
|Mode A Prekey Length [milliseconds]|50|
|POA Contact Timer (VAT1) [seconds]|126|
|POA Tracker Timer (VAT3) [seconds]|600|
|SATCOM Tracker Timer (SAT3) [minutes]|240|
|AoIP Message Lifetime [minutes]|9|



## **13.2.3 Counters** 

Table 13-3 describes the Datalink Options component counters and their values in the CMF baseline AMI. 

**Table 13-3  Datalink Options Counters** 

|**Counter**|**Value**|
|---|---|
|Logical Channel Counter Expiration|3|
|POA Transmission Counter Expiration|3|
|SATCOM Transmission Counter Expiration|2|
|HF Transmission Counter Expiration|2|
|ACARS over Aviation VHF Link Control (AVLC)<br>(AOA) Transmission Counter Expiration|2|



Note: The transmission counter values defined in the CMF AMI apply only to non-ATS downlink messages; CMF operational software defines the transmission counter values for ATS downlink messages. 

## **13.2.4 Enables** 

Table 13-4 describes the Datalink Options component enables and their values in the CMF baseline AMI. 

**Table 13-4  Datalink Options Enables** 

|**Enable**|**Value**|
|---|---|
|POA Tracker Timer Enabled|Yes|
|SATCOM Tracker Timer Enabled|Yes|



362 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Enable**|**Value**|
|---|---|
|Media Advisory Enabled|Yes|



## **13.2.4.1 POA Tracker Timer** 

When enabled, CMF sends the POA tracker message (label Q0 link test downlink) whenever the POA tracker timer (VAT3) expires.  This enables the service provider to track the location of the aircraft so that uplinks can be sent by the aircraft operator without prior knowledge of its general location. 

In the CMF baseline AMI this option is set to enable POA tracker messages. 

## **13.2.4.2 SATCOM Tracker Timer** 

When enabled, CMF sends the SATCOM tracker message (label Q0 link test downlink) whenever the SATCOM tracker timer (SAT3) expires. This informs the service provider that the CMF still has a SATCOM connection. 

In the CMF baseline AMI this option is set to enable SATCOM tracker timer messages. 

## **13.2.4.3 Media Advisory Enable** 

Media advisory messages are downlink messages that CMF automatically transmits when VHF, HF, or SATCOM communications are lost or become established.  These messages provide an indication to the recipient on the ground of which subnetworks are available to CMF and are used by some DSPs as a means of routing some types of uplink messages (in particular, ATC uplink messages). 

This option enables operators to prevent CMF from sending media advisory messages, except that CMF operational software always sends them when it has a FANS CPDLC connection. 

In the CMF baseline AMI this option is set to enable the transmission of media advisory messages. 

## **13.2.5 Subnetwork Preference Table** 

The Subnetwork Preferences Table in the Datalink Options component enables aircraft operators to determine the relative preference of each subnetwork from among VHF, HF data link (HFDL), SATCOM, and AoIP choices for each type of downlink.  This affects CMF’s choice of subnetwork for delivery of the downlinks, subject to the definition of allowable subnetworks for each downlink type. 

Table 13-5 describes the subnetwork preferences defined in the CMF baseline AMI. 

363 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

**Table 13-5  Subnetwork Preferences** 

|**Message Type/Source**|**First**<br>**Preference**|**Second**<br>**Preference**|**Third**<br>**Preference**|**Fourth**<br>**Preference**|
|---|---|---|---|---|
|AOC (“Company”)|VHF|SATCOM|HFDL|NONE|
|ATC|VHF|SATCOM|HFDL|NONE|
|FIS|VHF|SATCOM|HFDL|NONE|
|FMF|VHF|SATCOM|HFDL|NONE|
|Electronic Flight Bag (EFB)|VHF|SATCOM|HFDL|NONE|
|Central Maintenance Computing<br>Function (CMCF)|VHF|SATCOM|HFDL|NONE|
|Airplane Condition Monitoring<br>Function (ACMF)|VHF|SATCOM|HFDL|NONE|
|CDS (Common Display System),<br>including Displays and Crew<br>Alerting (DCA) maintenance<br>displays|VHF|SATCOM|HFDL|NONE|
|Cabin Systems|VHF|SATCOM|HFDL|NONE|



Note: On 787, Cabin Systems are In-Flight Entertainment (IFE), Engine Monitoring Unit (EMU), Cabin Air Conditioning and Temperature Control System (CACTCS), and Controller Server Module (CSM) systems. 

## **13.3 Downlink Buffers** 

The Downlink Buffers component defines the different buffers (queues) in which CMF stores downlink encodings before sending them.  CMF is capable of buffering up to 50 total downlink encodings in up to 10 total downlink buffers.  Table 13-6 describes the Downlink Buffers component that the CMF baseline AMI implements and Table A-2 lists the buffer to which each downlink encoding is assigned. 

**Table 13-6  Downlink Buffers** 

|**Identifier**|**Size (Encodings)**|
|---|---|
|MESSAGE|6|
|REPORT_AUTO|10|
|REPORT_CREW|8|
|REPORT_OOOI|8|
|REQUEST|6|
|RESPONSE_AUTO|6|
|RESPONSE_CREW|6|



## **13.4 LRU Messaging Tables** 

This section describes the Line-Replaceable Unit (LRU, i.e., datalink end system) Messaging Tables component that the CMF baseline AMI implements. 

364 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **13.4.1 Default Uplink Routing Table** 

The Default Uplink Routing Table shows the datalink end systems to which CMF operational software routes uplink messages containing specified labels and sublabels.  Table 13-7 describes the Default Uplink Routing Table that is visible in the CMF baseline AMI. 

**Table 13-7  Default Uplink Routing Table** 

|**Uplink Label**|**Uplink**<br>**Sublabel**|**Uplink SMI**|**Destination System**|
|---|---|---|---|
|C1|none|AGM|Printer|
|H1|CF|CFD|CMCF|
|H1|DF|DFD|ACMF|
|H1|EI|ENG|Displays (DCA)|
|H1|F1|EF1|EFB-L|
|H1|F2|EF2|EFB-R|
|H1|M1|FML|FMF (master)|
|H1|M2|FMR|FMF (master)|
|H1|M3|FM3|FMF (master)|
|H1|MD|FMD|FMF (master)|
|H1|T1|TT1|Cabin System 1 (IFE-1)|
|H1|T2|TT2|Cabin System 2 (IFE-2)|
|H1|T3|TT3|Cabin System 3 (IFE-3)|
|H1|T4|TT4|Cabin System 4 (IFE-4)|
|H1|T5|TT5|Cabin System 5 (EMU-L)|
|H1|T6|TT6|Cabin System 6 (EMU-R)|
|H1|T7|TT7|Cabin System 7 (CACTCS)|
|H1|T8|TT8|Cabin System 8 (CSM)|



## **13.4.2 Customizable Uplink Routing Table** 

The Customizable Uplink Routing Table defines the datalink end systems to which CMF routes uplink messages containing specified labels and sublabels in addition to those defined by CMF operational software and visible in the default uplink routing table.  The CMF baseline AMI does not contain any entries in the Customizable Uplink Routing Table. 

## **13.4.3 Downlink Label Table** 

The Downlink Label Table defines which labels and sublabels CMF applies to downlink messages from specified datalink end systems.  Table 13-8 describes the Downlink Label Table defined in the CMF baseline AMI, including the SMI applicable to each entry. 

365 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 13-8  Downlink Label Table** 

|**Downlink**<br>**Label**|**Downlink**<br>**Sublabel**|**Downlink SMI**|**Source System**|
|---|---|---|---|
|H1|CF|CFD|CMCF|
|H1|DF|DFD|ACMF|
|H1|EI|ENG|Displays (DCA)|
|H1|F1|EF1|EFB-L|
|H1|F2|EF2|EFB-R|
|H1|M1|FML|FMF-L|
|H1|M2|FMR|FMF-R|
|H1|M3|FM3|FMF-C|
|H1|T1|TT1|Cabin System 1 (IFE-1)|
|H1|T2|TT2|Cabin System 2 (IFE-2)|
|H1|T3|TT3|Cabin System 3 (IFE-3)|
|H1|T4|TT4|Cabin System 4 (IFE-4)|
|H1|T5|TT5|Cabin System 5 (EMU-L)|
|H1|T6|TT6|Cabin System 6 (EMU-R)|
|H1|T7|TT7|Cabin System 7 (CACTCS)|
|H1|T8|TT8|Cabin System 8 (CSM)|



## **13.5 Review Logs** 

The Review Logs component defines up to eight REVIEW menu categories into which CMF places a display associated with a message after the flight crew has displayed (and if necessary, responded to) or sent the message.  Table 13-9 describes the REVIEW menu categories that the CMF baseline AMI implements. 

**Table 13-9  REVIEW Menu Categories** 

|**Identifier**|**Title**|
|---|---|
|REVIEW_RECEIVED|COMPANY<br>UPLINKS…|
|REVIEW_SENT|COMPANY<br>DOWNLINKS…|
|REVIEW_WX_NOTAM|WEATHER &<br>NOTAMS…|
|REVIEW_LDS|LOADSHEETS…|



Table 13-10 lists the REVIEW menu category assignments for each display component in the CMF baseline AMI. 

366 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

**Table 13-10  REVIEW Menu Category Display Assignments** 

|**Display**|**REVIEW Menu**<br>**Category**|
|---|---|
|ADRF and IRU Parameters|None|
|Aircraft Parameters Menu|None|
|Altitude Reminder|None|
|Arrival Report|COMPANY<br>DOWNLINKS…|
|ATC Datalink Problem Report|COMPANY<br>DOWNLINKS…|
|Automatic Emergency Report Parameters|None|
|Automatic Flight Initialization Request|COMPANY<br>DOWNLINKS…|
|Automatic Flight Initialization Uplink|COMPANY<br>UPLINKS…|
|CMF Parameters|None|
|Company Menu|None|
|Crew Advisory Uplink|COMPANY<br>UPLINKS…|
|Crew Requests Menu|None|
|Delay Report|COMPANY<br>DOWNLINKS…|
|Departure Report|COMPANY<br>DOWNLINKS…|
|Diversion Report|COMPANY<br>DOWNLINKS…|
|Display Command Uplink|COMPANY<br>UPLINKS…|
|Engine and FQMS Parameters|None|
|ETA Report|COMPANY<br>DOWNLINKS…|
|E-Mail Downlink|COMPANY<br>DOWNLINKS…|
|E-Mail Reply|COMPANY<br>DOWNLINKS…|
|E-Mail Uplink|COMPANY<br>UPLINKS…|
|FCM Parameters|None|
|Flight Level Reminder|None|
|Flight Release Request|COMPANY<br>DOWNLINKS…|
|Flight Release Uplink|COMPANY<br>UPLINKS…|
|FMF and Navigation Parameters|None|
|Free-Text Uplink|COMPANY<br>UPLINKS…|



367 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

|**Display**|**REVIEW Menu**<br>**Category**|
|---|---|
|Fuel Reminder|None|
|Gate Assignment Request|COMPANY<br>DOWNLINKS…|
|Gate Assignment Uplink|COMPANY<br>UPLINKS…|
|Latitude Reminder|None|
|Loadsheet Uplink|LOADSHEETS…|
|Longitude Reminder|None|
|Maintenance Report|COMPANY<br>DOWNLINKS…|
|Manual Flight Initialization|None|
|Message to Ground|COMPANY<br>DOWNLINKS…|
|Miscellaneous Code Report|COMPANY<br>DOWNLINKS…|
|Miscellaneous Parameters|None|
|NOTAMs Request|WEATHER &<br>NOTAMS…|
|NOTAMs Uplink|WEATHER &<br>NOTAMS…|
|OOOI Test Page|None|
|Passing Waypoint Reminder|None|
|PSS Parameters|None|
|Reminders|None|
|Sensor Status|None|
|Situation Report|COMPANY<br>DOWNLINKS…|
|Time Reminder|None|
|Time to Destination Reminder|None|
|Time to Top of Descent Reminder|None|
|Times and Fuels|None|
|VHF Voice Contact Request|COMPANY<br>UPLINKS…|
|Waypoint ETA Change Reminder|None|
|Weather Request|WEATHER &<br>NOTAMS…|
|Weather Uplink|WEATHER &<br>NOTAMS…|
|Weight and Balance Request|COMPANY<br>DOWNLINKS…|
|Weight and Balance Uplink|COMPANY<br>UPLINKS…|



368 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

## **Appendix A Message Attributes** 

This appendix describes certain attributes of the messages defined in the baseline AMI. 

## **A.1 Uplink Decoding Definition Attributes** 

Table A-1 lists certain attributes of the baseline AMI uplink decoding definitions. Of note: 

- “SMI” and “Label” respectively indicate the Standard Message Identifier (SMI) and label defined by ARINC Specification 620 Appendix C for each uplink decoding. 

- Pre-defined element delimiters are <CR>, <CR><LF>, and <ETX>.  Many uplink decoding definitions also have optional element delimiters. 

**Table A-1  Uplink Decoding Definition Attributes** 

|**Uplink Decoding**|**SMI**|**Label**|**Message**<br>**Identifier**|**Alert Level**|**Optional Element**<br>**Delimiter**|**Notes**|
|---|---|---|---|---|---|---|
|**_Flight Initialization_**|||||||
|Automatic Flight Initialization Uplink|CMD|RA|~1INI|Medium|“/” (forward slash)||
|**_Weather and NOTAMs_**|||||||
|Weather Uplink|CMD|RA|~1WXR|Medium|“,” (comma)|Text block limited to 3486 characters|
|NOTAMs Uplink|CMD|RA|~1NTM|Medium|“,” (comma)|Text block limited to 3486 characters|
|**_Messaging_**|||||||
|Display Command Uplink|CMD|RA|~1RA1|Medium|“,” (comma)|Text block limited to 3480 characters|
|E-Mail Uplink|CMD|RA|~1EML|Medium|“,” (comma)|Text block limited to 3432 characters|
|Free-Text Uplink|CMD|RA|~1DIS|Medium|“,” (comma)|Text block limited to 3480 characters|
|Printer Uplink|AGM|C1|None|Medium|“,” (comma)|Text block limited to 3503 characters;<br>Printer Uplink print definition printed upon<br>receipt|
|VHF Voice Contact Request|GVR|54|None|Medium|“,” (comma)|Text block limited to 200 characters|
|**_Request-Response Exchanges_**|||||||



369 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**Uplink Decoding**|**SMI**|**Label**|**Message**<br>**Identifier**|**Alert Level**|**Optional Element**<br>**Delimiter**|**Notes**|
|---|---|---|---|---|---|---|
|Crew Advisory Uplink|CMD|RA|~1CAA|Medium|“,” (comma)|Text block limited to 3496 characters|
|Flight Release Uplink|CMD|RA|~1FRL|Medium|“,” (comma)|Text block limited to 3496 characters|
|Gate Assignment Uplink|CMD|RA|~1GTA|Medium|“,” (comma)|Text block limited to 3496 characters|
|Loadsheet Uplink|M1L|1L|LDS|Medium|“/” (forward slash)|Text block limited to 3481 characters|
|Weight and Balance Uplink|CMD|RA|~1WAB|Medium|“,” (comma)|Text block limited to 3496 characters|
|**_Automatic Reports_**|||||||
|AHM Flight Phase Report Configuration<br>Uplink|CMD|RA|~1AHM|None|“,” (comma)||
|AoIP Link Advisory Configuration Uplink|CMD|RA|~AOI|None|“,” (comma)||
|Automatic Emergency Report<br>Configuration Uplink|CMD|RA|~1DEF|None|“,” (comma)||
|Automatic Position Report Configuration<br>Uplink|CMD|RA|~1POS|None|“,” (comma)||
|**_Loop Back Messages_**|||||||
|Automatic Emergency Report Status<br>Loop Back Uplink|CMD|RA|~4EMG|None|none|Automatic Emergency Report Status Loop<br>Back Downlink sent upon receipt|
|OOOI Data Loop Back Uplink|CMD|RA|~2OOI|None|none|OOOI Data Loop Back Downlink sent upon<br>receipt|
|Position Report Loop Back Uplink|CMD|RA|~4POS|None|none|Position Report Loop Back Downlink sent<br>upon receipt|
|Software Configuration Loop Back<br>Uplink|CMD|RA|~4CFG|None|none|Software Configuration Loop Back Downlink<br>sent upon receipt|
|Subnetwork Status Loop Back Uplink|CMD|RA|~4SUB|None|none|Subnetwork Status Loop Back Downlink<br>sent upon receipt|
|Test Loop Back Uplink|CMD|RA|~4LBK|None|none|Text block limited to 200 characters; Test<br>Loop Back Downlink sent upon receipt|
|**_Miscellaneous Functions_**|||||||
|POA Autotune Uplink|M4;|4;|None|None|None||



Note: The Medium alert level provides a “●COMM” visual alert and a high-low chime aural alert.  The Low alert level provides no visual alert but provides a high-low chime aural alert.  The None alert level provides no visual alert and no aural alert. 

370 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

## **A.2 Downlink Encoding Definition Attributes** 

Table A-2 lists certain attributes of the baseline AMI downlink encoding definitions.  Of note: 

- “SMI” and “Label” respectively indicate the SMI and label described by ARINC Specification 620 Appendix C for each downlink encoding. 

- “Downlink Priority” indicates the downlink priority for each downlink encoding, which CMF uses to prioritize any queued downlink encodings.  The highest priority is 1 Emergency and the lowest priority is 9 Low Priority Administrative.  If two or more queued downlink encodings have the same downlink priority, then CMF prioritizes the oldest encoding. 

- “Downlink Buffer” indicates the downlink buffer for each downlink encoding, which is the buffer in which CMF queues the downlink encoding.  Table 13-6 describes the baseline AMI downlink buffers. 

- “Delete on Reset” indicates whether CMF deletes each queued downlink encoding from the relevant downlink buffer when a CMF system reset occurs.  If this value is “Yes”, then CMF deletes the queued downlink encoding when a CMF system reset occurs.  If this value is “No”, then CMF retains the queued downlink encoding when a CMF system reset occurs. 

- “Delete on Full” indicates whether CMF deletes each queued downlink encoding from the relevant downlink buffer when a new downlink encoding is queued.  If this value is “Yes”, then CMF deletes the oldest queued downlink encoding in order to accept the new downlink encoding.  If this value is “No”, then CMF deletes the newest queued downlink encoding in order to retain the oldest queued downlink encoding. 

**Table A-2  Downlink Encoding Definition Attributes** 

|**Downlink Encoding**|**SMI**|**Label**|**Message Identifier**<br>**and Version**|**Downlink Priority**|**Downlink Buffer**|**Delete**<br>**on Reset**|**Delete**<br>**on Full**|
|---|---|---|---|---|---|---|---|
|**_Flight Initialization_**||||||||
|Automatic Flight Initialization Request|M20|20|INI01|4 Flight Regularity|REQUEST|Yes|Yes|
|**_Weather and NOTAMs_**||||||||
|Weather Request|WXR|5U|none|4 Flight Regularity|REQUEST|Yes|Yes|
|NOTAMs Request|M38|38|NTM01|4 Flight Regularity|REQUEST|Yes|Yes|
|**_Messaging_**||||||||
|E-Mail Downlink|EML|E1|EML02|4 Flight Regularity|MESSAGE|Yes|Yes|



371 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|**Downlink Encoding**|**SMI**|**Label**|**Message Identifier**<br>**and Version**|**Downlink Priority**|**Downlink Buffer**|**Delete**<br>**on Reset**|**Delete**<br>**on Full**|
|---|---|---|---|---|---|---|---|
|E-Mail Reply|EML|E1|EML02|4 Flight Regularity|MESSAGE|Yes|Yes|
|Message to Ground|A81|81|none|4 Flight Regularity|MESSAGE|Yes|Yes|
|**_Request-Response Exchanges_**||||||||
|Crew Advisory Accept|M40|40|CAA01|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|Crew Advisory Reject|M40|40|CAA01|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|Crew Advisory Reject with Reason|M40|40|CAA01|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|Flight Release Request|M35|35|FRL01|4 Flight Regularity|REQUEST|Yes|Yes|
|Flight Release Accept|M45|45|FRL01|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|Flight Release Reject|M45|45|FRL01|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|Flight Release Reject with Reason|M45|45|FRL01|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|Gate Assignment Request|M36|36|GTA01|4 Flight Regularity|REQUEST|Yes|Yes|
|Gate Assignment Accept|M46|46|GTA01|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|Gate Assignment Reject|M46|46|GTA01|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|Gate Assignment Reject with Reason|M46|46|GTA01|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|Loadsheet Response|M1L|1L|none|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|Weight and Balance Request|M31|31|WAB01|4 Flight Regularity|REQUEST|Yes|Yes|
|Weight and Balance Accept|M41|41|WAB01|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|Weight and Balance Reject|M41|41|WAB01|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|Weight and Balance Reject with Reason|M41|41|WAB01|4 Flight Regularity|RESPONSE_CREW|Yes|Yes|
|**_Manual Reports_**||||||||
|Arrival Report|M28|28|LND02|4 Flight Regularity|REPORT_CREW|Yes|Yes|
|ATC Datalink Problem Report|A82|82|CRA02|4 Flight Regularity|REPORT_CREW|Yes|Yes|
|Delay Report|M21|21|Identifier DPD,<br>DTO, DNR, or DAR;<br>version 02|4 Flight Regularity|REPORT_CREW|Yes|Yes|
|Departure Report|M24|24|TKO01|4 Flight Regularity|REPORT_CREW|Yes|Yes|
|Manual Diversion Report|M25|25|DIV02|4 Flight Regularity|REPORT_CREW|Yes|Yes|
|ETA Report|M26|26|ETA01|4 Flight Regularity|REPORT_CREW|Yes|Yes|
|Maintenance Report|M2A|2A|MNT01|4 Flight Regularity|REPORT_CREW|Yes|Yes|



D613Z019-06 

372 of 378 

NEW 

ECCN: 7E994 

**BOEING PROPRIETARY** 

|**Downlink Encoding**|**SMI**|**Label**|**Message Identifier**<br>**and Version**|**Downlink Priority**|**Downlink Buffer**|**Delete**<br>**on Reset**|**Delete**<br>**on Full**|
|---|---|---|---|---|---|---|---|
|Miscellaneous Code Report|M29|29|MSC01|4 Flight Regularity|REPORT_CREW|Yes|Yes|
|Situation Report|HJK|00|SIT02|1 Emergency|REPORT_CREW|No|No|
|**_Automatic Reports_**||||||||
|AHM Flight Phase Report|M49|49|Identifier variable<br>per Section 9.1.2;<br>version 01|4 Flight Regularity|REPORT_AUTO|No|Yes|
|AoIP Link Advisory|M19|19|AOI02|4 Flight Regularity|REPORT_AUTO|Yes|Yes|
|Automatic Diversion Report|M25|25|DIV02|4 Flight Regularity|REPORT_AUTO|Yes|Yes|
|Automatic Emergency Report|SIT|99|EMR06|1 Emergency|REPORT_AUTO|No|No|
|Automatic Position Report|M16|16|POS02|4 Flight Regularity|REPORT_AUTO|No|Yes|
|Out Report|M11|11|OUT01|4 Flight Regularity|REPORT_OOOI|No|Yes|
|Off Report|M12|12|OFF01|4 Flight Regularity|REPORT_OOOI|No|Yes|
|On Report|M13|13|ONN01|4 Flight Regularity|REPORT_OOOI|No|Yes|
|In Report|M14|14|INN01|4 Flight Regularity|REPORT_OOOI|No|Yes|
|Return to Gate Report|M15|15|RTG01|4 Flight Regularity|REPORT_OOOI|No|Yes|
|**_Loop Back Messages_**||||||||
|Automatic Emergency Report Status<br>Loop Back Downlink|RDO|RB|~4EMG|4 Flight Regularity|RESPONSE_AUTO|No|Yes|
|OOOI Data Loop Back Downlink|RDO|RB|~2OOI|4 Flight Regularity|RESPONSE_AUTO|No|Yes|
|Position Report Loop Back Downlink|RDO|RB|~4POS|4 Flight Regularity|RESPONSE_AUTO|No|Yes|
|Software Configuration Loop Back<br>Downlink|RDO|RB|~4CFG|4 Flight Regularity|RESPONSE_AUTO|No|Yes|
|Subnetwork Status Loop Back Downlink|RDO|RB|~4SUB|4 Flight Regularity|RESPONSE_AUTO|No|Yes|
|Test Loop Back Downlink|RDO|RB|~4LBK|4 Flight Regularity|RESPONSE_AUTO|No|Yes|
|**_Miscellaneous Functions_**||||||||
|Invalid Reject|A8X|8X|none|4 Flight Regularity|RESPONSE_AUTO|No|Yes|
|Unable to Deliver Reject|REJ|HX|none|4 Flight Regularity|RESPONSE_AUTO|No|Yes|
|Unable to Process Reject|A8X|8X|none|4 Flight Regularity|RESPONSE_AUTO|No|Yes|



373 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

## **Abbreviations and Acronyms** 

AAC Aeronautical Administrative Communications ACARS Aircraft Communications Addressing and Reporting System ACMF Airplane Condition Monitoring Function ADRF Air Data Reference Function ADS-C Automatic Dependent Surveillance – Contract AHM Airplane Health Management AMI Airline Modifiable Information AOA ACARS over AVLC AOC Aeronautical Operational Communications AoIP ACARS-over-IP ATC Air Traffic Control ATN Aeronautical Telecommunications Network ATS Air Traffic Services AVLC Aviation VHF Link Control BPv Block Point version B1 Baseline 1 CACTCS Cabin Air Conditioning and Temperature Control System CAS calibrated airspeed CCR Common Computing Resource CCS Common Computing System CDS Common Display System CMCF Central Maintenance Computing Function 

374 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|CMF|Communications Management Function|
|---|---|
|CMU|Communications Management Unit|
|CPDLC|Controller-Pilot Data Link Communications|
|CSM|Controller Server Module|
|DCA|Displays and Crew Alerting|
|DSP|datalink service provider|
|D-ATIS|Digital Automated Terminal Information Service|
|EFB|Electronic Flight Bag|
|EICAS|Engine Indicating and Crew Alerting System|
|EMU|Engine Monitoring Unit|
|ESB|exclusive selector button|
|ETA|estimated time of arrival|
|EUROCAE|European Organisation for Civil Aviation Equipment|
|FANS|Future Air Navigation System|
|FCM|Flight Control Module|
|FIS|Flight Information Services|
|FMF|Flight Management Function|
|FQMS|Fuel Quantity Monitoring System|
|FWT|folding wingtip (777X)|
|GBST|Ground-Based Software Tool|
|GE|General Electric|
|GGM|Graphics Generator Module|
|HF|high frequency|
|HFDL|HF data link|



375 of 378 

D613Z019-06 ECCN: 7E994 

NEW 

**BOEING PROPRIETARY** 

|IATA|International Air Transport Association|
|---|---|
|ICAO|International Civil Aviation Organization|
|IFE|In-Flight Entertainment|
|IP|Internet Protocol|
|IPDB|Input Parameter Database|
|IRU|Inertial Reference Unit|
|LSAP|loadable software application part|
|MFD|Multi-Function Display|
|MMO|Mach, maximum operating|
|MSN|message sequence number|
|NESB|non-exclusive selector button|
|NOTAM|Notices to Airmen|
|NVM|non-volatile memory|
|OOOI|Out, Off, On, In|
|OPS|operational software|
|OSS|Option Selection Software|
|POA|“Plain Old” ACARS|
|PSS|Proximity Sensing System|
|SAT|static air temperature|
|SATCOM|satellite communications|
|SMI|Standard Message Identifier|
|TAS|true airspeed|
|TAT|total air temperature|
|TWIP|Terminal Weather Information for Pilots|



376 of 378 

NEW D613Z019-06 ECCN: 7E994 

**BOEING PROPRIETARY** 

UADF User Application Definition File VDR VHF Data Radio VHF very high frequency VMO Speed, maximum operating 

377 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW 

## **Revision Record** 

## **Release/Revision NEW** 

|**Limitations**<br>**Description of**<br>**Change**<br>**Authorization for**<br>**Release**<br>AUTHOR:<br>REVIEWER:<br>APPROVER:<br>DOCUMENT RELEASE:|None additional.<br>Based on D613Z019-01 Rev H to describe 787 CMF baseline AMI version F001<br>(part number BCG45-8CMF-A013).  Notable AMI changes are those described<br>in Section 1.3.  Added Section 1.1.1 to describe execution order of logic units,<br>Section 2.1 to describe start display, and Section 2.8 to describe special<br>encodings.  Added note that if AoIP is not enabled then the AMI does not<br>generate AoIP link advisories in Section 2.8.2.  Added descriptions of the<br>conditions under which the AMI enables and disables the automatic emergency<br>report function and begins sending automatic emergency reports in Section 9.4.<br>Corrected description of automatic emergency report selections in Section<br>11.1.1.  Added SMIs to Table 13-8 and 13-9.  Added alert levels to Table A-1.<br>Added message versions to Table A-2.  Corrected text block lengths in uplink<br>decoding definitions throughout.  Enhanced element descriptions in uplink<br>decoding definitions and downlink encoding definitions throughout.  Made<br>editorial clarifications throughout.<br>Michael Matyas<br>1929359<br>Name<br>BEMSID<br>66-CB-E135<br>30 September 2020<br>Organization Number<br>Date<br>Kareem Shabaik<br>1442009<br>Name<br>BEMSID<br>66-CB-E135<br>30 September 2020<br>Organization Number<br>Date<br>Siamak Behroozian<br>152656<br>Name<br>BEMSID<br>66-CB-E133<br>30 September 2020<br>Organization Number<br>Date<br>Organization Number<br>Date<br>Angela Davidson<br>3315818<br>9M-ST-EUA0<br>October 7, 2020|None additional.<br>Based on D613Z019-01 Rev H to describe 787 CMF baseline AMI version F001<br>(part number BCG45-8CMF-A013).  Notable AMI changes are those described<br>in Section 1.3.  Added Section 1.1.1 to describe execution order of logic units,<br>Section 2.1 to describe start display, and Section 2.8 to describe special<br>encodings.  Added note that if AoIP is not enabled then the AMI does not<br>generate AoIP link advisories in Section 2.8.2.  Added descriptions of the<br>conditions under which the AMI enables and disables the automatic emergency<br>report function and begins sending automatic emergency reports in Section 9.4.<br>Corrected description of automatic emergency report selections in Section<br>11.1.1.  Added SMIs to Table 13-8 and 13-9.  Added alert levels to Table A-1.<br>Added message versions to Table A-2.  Corrected text block lengths in uplink<br>decoding definitions throughout.  Enhanced element descriptions in uplink<br>decoding definitions and downlink encoding definitions throughout.  Made<br>editorial clarifications throughout.<br>Michael Matyas<br>1929359<br>Name<br>BEMSID<br>66-CB-E135<br>30 September 2020<br>Organization Number<br>Date<br>Kareem Shabaik<br>1442009<br>Name<br>BEMSID<br>66-CB-E135<br>30 September 2020<br>Organization Number<br>Date<br>Siamak Behroozian<br>152656<br>Name<br>BEMSID<br>66-CB-E133<br>30 September 2020<br>Organization Number<br>Date<br>Organization Number<br>Date<br>Angela Davidson<br>3315818<br>9M-ST-EUA0<br>October 7, 2020|
|---|---|---|
|||BEMSID<br>30 September 2020|
|||Date<br>1442009|
|||BEMSID<br>30 September 2020|
|||Date<br>152656|
|||BEMSID<br>30 September 2020|
|||Date<br>3315818|
|||October 7, 2020|
|||Date|



378 of 378 

D613Z019-06 ECCN: 7E994 **BOEING PROPRIETARY** 

NEW
