select * from models where model_id = '0f83d974-cf5e-4b66-8823-109d0aba612d'

select * from model_statistics ms where model_id = '0f83d974-cf5e-4b66-8823-109d0aba612d'

select count(*) from ts_0f83d974cf5e4b668823109d0aba612d_pairs_calc where add_constant_gain='-infinity'

-- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- 


select * from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
where independent_variable = 'ti8916'
and dependent_variable = 'fc1018'
and episode_end  >= '2020-09-30 06:00:00.000'
and episode_end  <= '2020-09-30 07:00:00.000'

select * from ts_c2cf325e58e24078ab90408868a0530d_pairs_calc
where independent_variable = 'ti8916'
and dependent_variable = 'fc1018'
and episode_end  >= '2020-09-30 06:00:00.000'
and episode_end  <= '2020-09-30 07:00:00.000'
and add_constant_gain not in ('infinity', '-infinity', 'NaN')



-- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- 


select * from model_statistics ms where model_id = '2feb9b8f-9f3e-4d65-8d2a-2c2494ad957a'

SELECT * FROM "ts_00000000000000001113000000000002_pairs_calc" WHERE "independent_variable" = 'x' AND "dependent_variable" = 'y'

-- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- 



select independent_variable , dependent_variable, count(*) 
from ts_0f83d974cf5e4b668823109d0aba612d_pairs_calc 
where add_constant_gain='-infinity'
group by independent_variable , dependent_variable

select *
from ts_0f83d974cf5e4b668823109d0aba612d_pairs_calc 
where add_constant_gain='-infinity' and independent_variable != 'i_16ti0827' and dependent_variable != 'i_16fi022'
limit 30


-- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- 
-- TagsToCols

 {"i_81c999": "col2", "i_10ts105": "col5", "i_16c0102": "col3", "i_16di226": "col9", "i_16fc234": "col12", "i_16fc240": "col13", "i_16fi022": "col16", "i_16tc106": "col7", "i_16tc108": "col8", "i_122fc170": "col17", "i_122fi279": "col18", "i_16ti0827": "col1", "i_16fi443_vv": "col6", "volume_swell": "col25", "c3_prod_flow2": "col15", "jetlco_correct": "col14", "lcnhcn_correct": "col19", "olefins_stream": "col10", "slurry_correct": "col11", "hcn_in_jetlco_av": "col21", "lco_in_slurry_av": "col22", "slurry_in_lco_av": "col20", "debut_vol_balance": "col23", "avg_dec4_control_temp_sp": "col4", "static_obj_fun_combined_streams": "col24"}

 
-- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- 
-- Metadata 
 {"id": "0f83d974-cf5e-4b66-8823-109d0aba612d", "cvs": ["i_16di226", "olefins_stream", "slurry_correct", "i_16fc234", "i_16fc240", "jetlco_correct", "c3_prod_flow2", "i_16fi022", "i_122fc170", "i_122fi279", "lcnhcn_correct"], "dvs": ["i_16ti0827", "i_81c999", "i_16c0102", "avg_dec4_control_temp_sp", "i_10ts105", "i_16fi443_vv", "i_16tc106"], "mvs": ["i_16tc108"], "vvs": {"lcn_total": "${i_122fi281_vv} + ${i_16fi023}", "hcn_correct": "${i_16fc135_vv} +  ${delta_hcn_in_jetlco}", "lco_correct": "${i_16lcotot} + ${delta_lco_in_slurry_slurlabs} - ${delta_slurry_in_lco}", "i_16fc135_vv": "dlpc.if_(${i_16fv135}>0, dlpc.if_(${i_16fc135}<2.5,2.5,${i_16fc135}),0)", "i_16fi443_vv": "dlpc.math.nanmax(${i_16fi443},0)", "c3_prod_flow2": "${i_10fi209} - ${i_10fi205}", "i_122fi281_vv": "dlpc.math.nanmax(${i_122fc170} -${i_122fi279},0)", "i_16fc1476_vv": "dlpc.math.nanmax(${i_16fc1476},0)", "jetlco_correct": "${i_16fc1476_vv} +  ${lco_correct} - ${delta_hcn_in_jetlco}", "lcnhcn_correct": "${hcn_correct} +  ${lcn_total}", "olefins_stream": "${c3_prod_flow2} + ${i_122fi279} + ${i_122fi281_vv}", "slurry_correct": "${i_16fi226} - ${delta_lco_in_slurry_slurlabs} + ${delta_slurry_in_lco}", "delta_hcn_in_jetlco": "dlpc.math.nanmax((${hcn_in_jetlco_av}) * dlpc.if_(${i_16fc1476_vv}>0,${i_16fc1476_vv},${i_16lcotot}),0)", "delta_slurry_in_lco": "dlpc.math.nanmax((${slurry_in_lco_av} * ${i_16lcotot}),0)", "avg_dec4_control_temp_sp": "dlpc.math.nanmean(${i_16ts145},${i_16ts151})", "delta_lco_in_slurry_slurlabs": "dlpc.math.nanmax((${lco_in_slurry_av} * ${i_16fi226}),0)"}, "name": "chevron_pg_fcc_dlp", "pids": [], "unit": "pg_fcc", "author": "Auto Training", "customer": "chevron", "data_ref": "352b59de-9d53-4941-bebc-4e707ea4f1d1", "win_size": 75, "full_site": "pascagoula", "variables": {"i_16c060": {"id": "i_16c060", "description": "Cat Circ Rate", "engineering_units": "TONS/MIN"}, "i_81c200": {"id": "i_81c200", "description": "R8120 CAT AVG", "engineering_units": "DEGF"}, "i_81c210": {"id": "i_81c210", "description": "R8121 CAT AVG", "engineering_units": "DEGF"}, "i_81c300": {"id": "i_81c300", "description": "R8130 CAT AVG", "engineering_units": "DEGF"}, "i_81c310": {"id": "i_81c310", "description": "R8131 CAT AVG", "engineering_units": "DEGF"}, "i_81c999": {"id": "i_81c999", "description": "PERCENT CRACKED STOCK FEED", "engineering_units": "DEG F"}, "price_c3": {"id": "price_c3", "description": "C3 price (FI209)", "engineering_units": "$/bbl"}, "price_c4": {"id": "price_c4", "description": "C4 price (FI279)", "engineering_units": "$/bbl"}, "i_10fc114": {"id": "i_10fc114", "description": "C-1000 Reflux Flow", "engineering_units": "MBPD"}, "i_10fc119": {"id": "i_10fc119", "description": "Olefins to C-1000", "engineering_units": "MBPD"}, "i_10fi205": {"id": "i_10fi205", "description": "C3 Product Flow to dryer regen", "engineering_units": "MBPD"}, "i_10fi209": {"id": "i_10fi209", "description": "C3 Product Flow", "engineering_units": "MBPD"}, "i_10tc105": {"id": "i_10tc105", "description": "C-1000 reboiler inlet temp", "engineering_units": "DEG F"}, "i_10ts105": {"id": "i_10ts105", "description": "C-1000 reboiler inlet temp setpoint", "engineering_units": "DEG F"}, "i_16ai201": {"id": "i_16ai201", "description": "Regen Excess O2", "engineering_units": "PCT"}, "i_16c0005": {"id": "i_16c0005", "description": "COLD FEED", "engineering_units": "MBPD"}, "i_16c0010": {"id": "i_16c0010", "description": "Average Regen Dense Bed Temp", "engineering_units": "DEGF"}, "i_16c0102": {"id": "i_16c0102", "description": "CORRECTED FCC FEED", "engineering_units": "MBPD"}, "i_16c2353": {"id": "i_16c2353", "description": "cat/oil ratio", "engineering_units": "DEGF"}, "i_16di226": {"id": "i_16di226", "description": "Slurry API", "engineering_units": ""}, "i_16fc018": {"id": "i_16fc018", "description": "C1609 Debutanizer Inlet Flow", "engineering_units": "MBPD"}, "i_16fc019": {"id": "i_16fc019", "description": "C1607 Debutanizer Inlet Flow", "engineering_units": "MBPD"}, "i_16fc020": {"id": "i_16fc020", "description": "C1605 Lean Oil Reflux", "engineering_units": "MBPD"}, "i_16fc101": {"id": "i_16fc101", "description": "HOT FCC FEED", "engineering_units": "MBPD"}, "i_16fc102": {"id": "i_16fc102", "description": "TOTAL FCC FEED", "engineering_units": "MBPD"}, "i_16fc116": {"id": "i_16fc116", "description": "CAB Flow SPT/CAT RSR", "engineering_units": "MMSCFH"}, "i_16fc125": {"id": "i_16fc125", "description": "HCO/Slurry Reflux", "engineering_units": "MBPD"}, "i_16fc135": {"id": "i_16fc135", "description": "HEAVY GAS DRAW", "engineering_units": "MBPD"}, "i_16fc146": {"id": "i_16fc146", "description": "C-1609 REFLUX", "engineering_units": "MBPD"}, "i_16fc153": {"id": "i_16fc153", "description": "C1607 REFLUX", "engineering_units": "MBPD"}, "i_16fc179": {"id": "i_16fc179", "description": "HCN Pump Around/Reflux", "engineering_units": "KBPD"}, "i_16fc180": {"id": "i_16fc180", "description": "LCO Pump Around/Reflux", "engineering_units": "KBPD"}, "i_16fc223": {"id": "i_16fc223", "description": "C1601 O/H REFLX", "engineering_units": "MBPD"}, "i_16fc234": {"id": "i_16fc234", "description": "C1607 Debutanizer OVHD flow", "engineering_units": "MBPD"}, "i_16fc240": {"id": "i_16fc240", "description": "C1609 Debutanizer OVHD flow", "engineering_units": "MBPD"}, "i_16fc271": {"id": "i_16fc271", "description": "Lift Steam to Riser", "engineering_units": "MPPH"}, "i_16fc402": {"id": "i_16fc402", "description": "150 PSIG INJ STEAM", "engineering_units": "MPPH"}, "i_16fc428": {"id": "i_16fc428", "description": "LCO Product Flow", "engineering_units": "MBPD"}, "i_16fi010": {"id": "i_16fi010", "description": "C2/C3/C4 Olefins Retreat Stream", "engineering_units": "MBPD"}, "i_16fi022": {"id": "i_16fi022", "description": "C1606 OH VAPOR", "engineering_units": "MSCFH"}, "i_16fi023": {"id": "i_16fi023", "description": "LT GS TO STRG", "engineering_units": "MBPD"}, "i_16fi226": {"id": "i_16fi226", "description": "C1601 BTMS TO STG", "engineering_units": "MBPD"}, "i_16fi238": {"id": "i_16fi238", "description": "TTL C3/C4", "engineering_units": "MBPD"}, "i_16fi443": {"id": "i_16fi443", "description": "C3/C4 Olefins Retreat Stream", "engineering_units": "MBPD"}, "i_16fv126": {"id": "i_16fv126", "description": "BTMS Reflux Valve Position", "engineering_units": "PCT"}, "i_16fv135": {"id": "i_16fv135", "description": "HCN Prod Flow Valve OP", "engineering_units": "PCT"}, "i_16lc128": {"id": "i_16lc128", "description": "C1601 LEVEL", "engineering_units": "%"}, "i_16pc208": {"id": "i_16pc208", "description": "Regen Pressure", "engineering_units": "PSIG"}, "i_16pi162": {"id": "i_16pi162", "description": "F-1601 Burner Tip Pressure", "engineering_units": "PSIG"}, "i_16pi207": {"id": "i_16pi207", "description": "Reactor Pressure", "engineering_units": "PSIG"}, "i_16pt140": {"id": "i_16pt140", "description": "WGC Suction Pressure", "engineering_units": "PSIG"}, "i_16tc029": {"id": "i_16tc029", "description": "C1609 OVHD Temp", "engineering_units": "DEG F"}, "i_16tc043": {"id": "i_16tc043", "description": "C1607 OVHD Temp", "engineering_units": "DEG F"}, "i_16tc106": {"id": "i_16tc106", "description": "F1601 OUT TEMP", "engineering_units": "DEGF"}, "i_16tc108": {"id": "i_16tc108", "description": "RX TEMP CTRL", "engineering_units": "DEGF"}, "i_16tc133": {"id": "i_16tc133", "description": "FRACT O/H TEMP", "engineering_units": "DEGF"}, "i_16ti082": {"id": "i_16ti082", "description": "HCN Draw Temp", "engineering_units": "DEG F"}, "i_16ti084": {"id": "i_16ti084", "description": "LCO Draw Temp", "engineering_units": "DEG F"}, "i_16ti085": {"id": "i_16ti085", "description": "Slurry Draw Temp", "engineering_units": "DEG F"}, "i_16ti089": {"id": "i_16ti089", "description": "BTMS C1601", "engineering_units": "DEGF"}, "i_16ti182": {"id": "i_16ti182", "description": "LCO Reflux Temp", "engineering_units": "DEG F"}, "i_16ti864": {"id": "i_16ti864", "description": "MAB outlet temperature", "engineering_units": "DEG F"}, "i_16ti877": {"id": "i_16ti877", "description": "C-1601 INLET", "engineering_units": "DEGF"}, "i_16ts108": {"id": "i_16ts108", "description": "F1601 OUT TEMP", "engineering_units": "DEGF"}, "i_16ts145": {"id": "i_16ts145", "description": "C1609 TEMP CONT", "engineering_units": "DEGF"}, "i_16ts151": {"id": "i_16ts151", "description": "C1607 TRAY 2", "engineering_units": "DEGF"}, "i_16zi204": {"id": "i_16zi204", "description": "REGEN SL VLV POS", "engineering_units": "%"}, "i_16zi245": {"id": "i_16zi245", "description": "SPN SL VLV POS", "engineering_units": "%"}, "lcn_total": {"id": "lcn_total", "description": "total LCN flow", "engineering_units": "MBPD"}, "price_hcn": {"id": "price_hcn", "description": "hcn price (FC135)", "engineering_units": "$/bbl"}, "price_jet": {"id": "price_jet", "description": "jet price (FC1476)", "engineering_units": "$/bbl"}, "price_lcn": {"id": "price_lcn", "description": "lcn price (fi023 + i_122fi281_vv)", "engineering_units": "$/bbl"}, "price_lco": {"id": "price_lco", "description": "lco price (LCOTOT)", "engineering_units": "$/bbl"}, "i_10ti8017": {"id": "i_10ti8017", "description": "C12260 OVHD Temp", "engineering_units": "DEG F"}, "i_122fc155": {"id": "i_122fc155", "description": "C-12260 Reflux Flow", "engineering_units": "MBPD"}, "i_122fc170": {"id": "i_122fc170", "description": "C12260 Feed/C-1000 BTMS", "engineering_units": "MBPD"}, "i_122fi279": {"id": "i_122fi279", "description": "C4 Product Flow", "engineering_units": "MBPD"}, "i_122fi281": {"id": "i_122fi281", "description": "LCN Prod Flow from C4/C5 Splitter", "engineering_units": "MBPD"}, "i_122ti853": {"id": "i_122ti853", "description": "C12260 OVHD Temp", "engineering_units": "DEG F"}, "i_16fc1270": {"id": "i_16fc1270", "description": "Jet Pump Around/Reflux", "engineering_units": "KBPD"}, "i_16fc1476": {"id": "i_16fc1476", "description": "JET PRODUCT TO 18 PLT", "engineering_units": "KBPD"}, "i_16fi0086": {"id": "i_16fi0086", "description": "LT GAS TO D1693", "engineering_units": "KBPD"}, "i_16lcotot": {"id": "i_16lcotot", "description": "LCO TOTAL FLOW", "engineering_units": "MBPD"}, "i_16pdc109": {"id": "i_16pdc109", "description": "Reactor/Regen dP - D-1602/01 DP Value A/B", "engineering_units": "PSIG"}, "i_16pdi212": {"id": "i_16pdi212", "description": "SPN SL VLV D/P", "engineering_units": "PSIG"}, "i_16sc1380": {"id": "i_16sc1380", "description": "MABTK1601 SPEED", "engineering_units": "RPM"}, "i_16sv1380": {"id": "i_16sv1380", "description": "MAB/TK1601 OP", "engineering_units": "PERC"}, "i_16ti0827": {"id": "i_16ti0827", "description": "C-1601 INLET", "engineering_units": "DEGF"}, "i_16ti8065": {"id": "i_16ti8065", "description": "Jet Draw Temp", "engineering_units": "DEG F"}, "i_16ti8135": {"id": "i_16ti8135", "description": "E1643 HC OUTLET", "engineering_units": "DEGF"}, "i_16ti8147": {"id": "i_16ti8147", "description": "E1621 HC OUTLET", "engineering_units": "DEGF"}, "i_16ti8398": {"id": "i_16ti8398", "description": "ambient temperature", "engineering_units": "DEG F"}, "i_16ti8415": {"id": "i_16ti8415", "description": "C1605 Deethanizer Reboiler Outlet Temp", "engineering_units": "DEG F"}, "price_feed": {"id": "price_feed", "description": "slurry price (FI226)", "engineering_units": "$/bbl"}, "avg_rxr_cat": {"id": "avg_rxr_cat", "description": "avg_rxr_cat", "engineering_units": "DEGF"}, "hcn_correct": {"id": "hcn_correct", "description": "hcn_correct", "engineering_units": ""}, "i_16ti08037": {"id": "i_16ti08037", "description": "C1601 Bed 8 Draw Temp - pre-TA Proxy HCN Draw Temp", "engineering_units": "DEG F"}, "i_34ambient": {"id": "i_34ambient", "description": "ambient temperature", "engineering_units": "DEG F"}, "lco_correct": {"id": "lco_correct", "description": "lco_correct", "engineering_units": ""}, "i_16fc135_vv": {"id": "i_16fc135_vv", "description": "i_16fc135_vv", "engineering_units": "MBPD"}, "i_16fi010_vv": {"id": "i_16fi010_vv", "description": "C2/C3/C4 Olefins Retreat Stream with no negative values", "engineering_units": "MBPD"}, "i_16fi443_vv": {"id": "i_16fi443_vv", "description": "C3/C4 Olefins Retreat Stream with no negative values", "engineering_units": "MBPD"}, "price_slurry": {"id": "price_slurry", "description": "slurry price (FI226)", "engineering_units": "$/bbl"}, "rot_cot_diff": {"id": "rot_cot_diff", "description": "ROT - COT", "engineering_units": "DEGF"}, "volume_swell": {"id": "volume_swell", "description": "volume swell", "engineering_units": "KBPD"}, "c3_prod_flow2": {"id": "c3_prod_flow2", "description": "C3 product flow", "engineering_units": "MBPD"}, "fi281_vol_bal": {"id": "fi281_vol_bal", "description": "fi281_vol_bal = 122fc170 - fi279", "engineering_units": "MBPD"}, "i_122fi281_vv": {"id": "i_122fi281_vv", "description": "LCN Prod Flow from C4/C5 Splitter with no negative values", "engineering_units": "MBPD"}, "i_16fc1476_vv": {"id": "i_16fc1476_vv", "description": "JET PRODUCT TO 18 PLT with no negative values", "engineering_units": "KBPD"}, "jet_lco_t10_lv": {"id": "jet_lco_t10_lv", "description": "Jet or LCO T10", "engineering_units": ""}, "jet_lco_t30_lv": {"id": "jet_lco_t30_lv", "description": "Jet or LCO T30", "engineering_units": ""}, "jetlco_correct": {"id": "jetlco_correct", "description": "jetlco_correct", "engineering_units": ""}, "lcnhcn_correct": {"id": "lcnhcn_correct", "description": "lcnhcn_correct", "engineering_units": ""}, "olefins_stream": {"id": "olefins_stream", "description": "olefins_stream", "engineering_units": "MBPD"}, "slurry_correct": {"id": "slurry_correct", "description": "lco_correct", "engineering_units": ""}, "static_price_c3": {"id": "static_price_c3", "description": "C3 price (FI209)", "engineering_units": "$/bbl"}, "static_price_c4": {"id": "static_price_c4", "description": "C4 price (FI279)", "engineering_units": "$/bbl"}, "fcc_fccbtm_10_ht": {"id": "fcc_fccbtm_10_ht", "description": "Slurry T10 Lab", "engineering_units": ""}, "fcc_fccbtm_30_ht": {"id": "fcc_fccbtm_30_ht", "description": "Slurry T30 Lab", "engineering_units": ""}, "hcn_in_jetlco_av": {"id": "hcn_in_jetlco_av", "description": "hcn_in_jetlco_av", "engineering_units": null}, "i_16ci226_lowlim": {"id": "i_16ci226_lowlim", "description": "Slurry API DMC Target", "engineering_units": ""}, "jetlco_in_hcn_av": {"id": "jetlco_in_hcn_av", "description": "jetlco_in_hcn_av", "engineering_units": null}, "lco_in_slurry_av": {"id": "lco_in_slurry_av", "description": "lco_in_slurry_av", "engineering_units": null}, "pre_post_ta_flag": {"id": "pre_post_ta_flag", "description": "JET flow <= 0 is 0 else 1", "engineering_units": "KBPD"}, "slurry_in_lco_av": {"id": "slurry_in_lco_av", "description": "slurry_in_lco_av", "engineering_units": null}, "static_price_hcn": {"id": "static_price_hcn", "description": "static_hcn price (FC135)", "engineering_units": "$/bbl"}, "static_price_jet": {"id": "static_price_jet", "description": "static_jet price (FC1476)", "engineering_units": "$/bbl"}, "static_price_lcn": {"id": "static_price_lcn", "description": "static_lcn price (fi023 + i_122fi281_vv)", "engineering_units": "$/bbl"}, "static_price_lco": {"id": "static_price_lco", "description": "static_lco price (LCOTOT)", "engineering_units": "$/bbl"}, "fcc_hvyfcc_90_d87": {"id": "fcc_hvyfcc_90_d87", "description": "HCN T90 Lab", "engineering_units": ""}, "fcc_hvyfcc_95_d87": {"id": "fcc_hvyfcc_95_d87", "description": "HCN T95 Lab", "engineering_units": ""}, "fcc_ltcoil_90_d87": {"id": "fcc_ltcoil_90_d87", "description": "LCO T90 Lab", "engineering_units": ""}, "fcc_ltcoil_95_d87": {"id": "fcc_ltcoil_95_d87", "description": "LCO T95 Lab", "engineering_units": ""}, "jet_and_lco_flows": {"id": "jet_and_lco_flows", "description": "jet_and_lco_flows", "engineering_units": "MBPD"}, "jetlco_draw_temps": {"id": "jetlco_draw_temps", "description": "jetlco_draw_temps", "engineering_units": ""}, "lcn_and_hcn_flows": {"id": "lcn_and_hcn_flows", "description": "lcn_and_hcn_flows", "engineering_units": "MBPD"}, "price_jet_and_lco": {"id": "price_jet_and_lco", "description": "lco price (LCOTOT)", "engineering_units": "$/bbl"}, "price_lcn_and_hcn": {"id": "price_lcn_and_hcn", "description": "hcn price (FC135)", "engineering_units": "$/bbl"}, "cat_circ_prepost_ta": {"id": "cat_circ_prepost_ta", "description": "COLD FEED", "engineering_units": "TONS/MIN"}, "delta_hcn_in_jetlco": {"id": "delta_hcn_in_jetlco", "description": "delta_hcn_in_jetlco inferential for DLP", "engineering_units": ""}, "delta_jetlco_in_hcn": {"id": "delta_jetlco_in_hcn", "description": "delta_jetlco_in_hcn inferential for DLP", "engineering_units": ""}, "delta_lco_in_slurry": {"id": "delta_lco_in_slurry", "description": "delta_lco_in_slurry simplified technique inferential for DLP", "engineering_units": ""}, "delta_slurry_in_lco": {"id": "delta_slurry_in_lco", "description": "delta_hcn_in_jetlco inferential for DLP", "engineering_units": ""}, "hot_cold_feed_ratio": {"id": "hot_cold_feed_ratio", "description": "hot feed / total feed", "engineering_units": "KBPD"}, "static_price_slurry": {"id": "static_price_slurry", "description": "slurry price (FI226)", "engineering_units": "$/bbl"}, "temp_delta_hcn_draw": {"id": "temp_delta_hcn_draw", "description": "temp_delta_hcn_draw", "engineering_units": ""}, "temp_delta_lco_draw": {"id": "temp_delta_lco_draw", "description": "temp_delta_hcn_draw", "engineering_units": ""}, "avg_dec4_reboiler_temp": {"id": "avg_dec4_reboiler_temp", "description": "avg_dec4_reboiler_temp", "engineering_units": "DEGF"}, "delta_hcn_in_jetlco_lv": {"id": "delta_hcn_in_jetlco_lv", "description": "delta_hcn_in_jetlco_lv", "engineering_units": ""}, "delta_jetlco_in_hcn_lv": {"id": "delta_jetlco_in_hcn_lv", "description": "delta_jetlco_in_hcn_lv", "engineering_units": ""}, "delta_lco_in_slurry_lv": {"id": "delta_lco_in_slurry_lv", "description": "delta_lco_in_slurry_lv", "engineering_units": ""}, "delta_slurry_in_lco_lv": {"id": "delta_slurry_in_lco_lv", "description": "delta_slurry_in_lco_lv", "engineering_units": ""}, "i_16c0102pv_cv_ophilim": {"id": "i_16c0102pv_cv_ophilim", "description": "F1601 OUT TEMP", "engineering_units": "DEGF"}, "i_16tc108sp_mv_ophilim": {"id": "i_16tc108sp_mv_ophilim", "description": "RX TEMP CTRL DMC hi lim", "engineering_units": "DEGF"}, "jetlco_for_inferential": {"id": "jetlco_for_inferential", "description": "lco_correct_only", "engineering_units": ""}, "i_16hgs95qpv_cv_ophilim": {"id": "i_16hgs95qpv_cv_ophilim", "description": "HCN T95 DMC Moving Target", "engineering_units": ""}, "i_16tc106sp_mv_oplowlim": {"id": "i_16tc106sp_mv_oplowlim", "description": "F1601 OUT TEMP", "engineering_units": "DEGF"}, "jetlco_delta_draw_temps": {"id": "jetlco_delta_draw_temps", "description": "jetlco_delta_draw_temps", "engineering_units": ""}, "avg_dec4_control_temp_sp": {"id": "avg_dec4_control_temp_sp", "description": "avg_dec4_control_temp_sp", "engineering_units": "DEGF"}, "i_16lco90qpv_cv_sstarget": {"id": "i_16lco90qpv_cv_sstarget", "description": "LCO T90 Target", "engineering_units": ""}, "obj_fun_combined_streams": {"id": "obj_fun_combined_streams", "description": "obj fcn with prices from manips", "engineering_units": "$/day"}, "obj_fun_jet_lco_combined": {"id": "obj_fun_jet_lco_combined", "description": "obj fcn with prices from manips", "engineering_units": "$/day"}, "obj_fun_separate_streams": {"id": "obj_fun_separate_streams", "description": "obj fcn with prices from manips", "engineering_units": "$/day"}, "i_16hgs95qpv_cv_ophilim_vv": {"id": "i_16hgs95qpv_cv_ophilim_vv", "description": "HCN T95 DMC Moving Target without -9999 values", "engineering_units": "DEGF"}, "delta_lco_in_slurry_slurlabs": {"id": "delta_lco_in_slurry_slurlabs", "description": "delta_lco_in_slurry using slurry lab values", "engineering_units": ""}, "static_obj_fun_combined_streams": {"id": "static_obj_fun_combined_streams", "description": "obj fcn with prices from manips", "engineering_units": "$/day"}, "static_obj_fun_jet_lco_combined": {"id": "static_obj_fun_jet_lco_combined", "description": "obj fcn with prices from manips", "engineering_units": "$/day"}, "static_obj_fun_separate_streams": {"id": "static_obj_fun_separate_streams", "description": "obj fcn with prices from manips", "engineering_units": "$/day"}}, "created_at": "2023-12-20 16:45:55.426801", "implements": "chevron_pg_fcc_dlp", "issue_data": {"issue_url": "https://jira-implementation-modeling.app.imubit.in//browse/P26701-4", "submitted": true, "subtask_url": "https://jira-implementation-modeling.app.imubit.in//browse/P26701-570", "unitdef_url": "s3://customer-data-chevron-pascagoula/algolib-unitdefs/unit/pg_fcc/unitdef_chevron-pg_fcc2023-12-20T16-36-02-.yml", "workflow_version": 1, "params_explanation": "None", "time_spent_in_hours": 0, "definition_explanation": "None", "custom_code_explanation": "None"}, "episode_len": 75, "force_gains": [{"type": "negative", "input": "i_16tc106", "output": "lcnhcn_correct"}, {"input": "i_16tc108", "output": "lcnhcn_correct", "magnitude_range": {"max": 0.061, "min": 0.033}}, {"input": "i_16tc108", "output": "slurry_correct", "magnitude_range": {"max": -0.01414, "min": -0.02495}}, {"input": "i_16tc108", "output": "jetlco_correct", "magnitude_range": {"max": -0.04383, "min": -0.0558}}, {"input": "i_16tc108", "output": "i_122fi279", "magnitude_range": {"max": 0.03088, "min": 0.02243}}, {"type": "zero", "input": "lcnhcn_correct", "output": "lcnhcn_correct"}, {"type": "zero", "input": "slurry_correct", "output": "slurry_correct"}, {"type": "zero", "input": "jetlco_correct", "output": "jetlco_correct"}, {"type": "zero", "input": "i_122fi279", "output": "i_122fi279"}], "var_renames": {}, "episode_size": 600, "gain_outputs": ["c3_prod_flow2", "i_122fc170", "i_122fi279", "i_16di226", "i_16fc234", "i_16fc240", "i_16fi022", "jetlco_correct", "lcnhcn_correct", "olefins_stream", "slurry_correct", "debut_vol_balance", "static_obj_fun_combined_streams", "volume_swell"], "inferentials": [{"id": "3ff35687-ce9c-4f78-a99d-5e4699265ba7", "name": "hcn_in_jetlco_inf", "inputs": ["i_16ti08037", "i_16fc135_vv", "jetlco_for_inferential", "jetlco_draw_temps"], "outputs": ["hcn_in_jetlco_av"], "issue_data": {"submitted": true}, "output_to_measurement_mapping": {"hcn_in_jetlco_av": "delta_hcn_in_jetlco_lv"}}, {"id": "61851878-24bb-4a17-848f-82a8ba7b629a", "name": "lco_in_slurry_inf", "inputs": ["i_16fi226", "i_16ci226_lowlim", "i_16ti084", "i_16ti089", "avg_rxr_cat", "i_16lcotot"], "outputs": ["lco_in_slurry_av"], "issue_data": {"submitted": true}, "output_to_measurement_mapping": {"lco_in_slurry_av": "delta_lco_in_slurry_lv"}}, {"id": "dfc9fb04-de5b-45f3-adbc-f7a02164c2d7", "name": "slurry_in_lco_inf", "inputs": ["i_16ti182", "i_16fi226", "i_16ci226_lowlim", "i_16ti084", "i_16ti089", "avg_rxr_cat", "i_16tc108", "i_16lcotot"], "outputs": ["slurry_in_lco_av"], "issue_data": {"submitted": true}, "output_to_measurement_mapping": {"slurry_in_lco_av": "delta_slurry_in_lco_lv"}}], "required_vvs": ["avg_dec4_control_temp_sp", "olefins_stream", "slurry_correct", "i_16fi443_vv", "jetlco_correct", "c3_prod_flow2", "lcnhcn_correct"], "typical_moves": {"i_81c999": 0.15541315078735352, "i_10ts105": 0.00772857666015625, "i_16c0102": 0.008358001708984375, "i_16tc106": 0.320159912109375, "i_16tc108": 0.085357666015625, "i_16ti0827": 1.0, "i_16fi443_vv": 0.004553136825561524, "avg_dec4_control_temp_sp": 0.12677764892578125}, "bad_data_rules": [{"rule": "(${c3_prod_flow2} < 5.0)"}, {"rule": "(${i_122fi279} < 9.0)"}, {"rule": "(${i_16c0010} < -10.0)"}, {"rule": "(${i_16c0102pv_cv_ophilim} < -10.0)"}, {"rule": "(${i_16c0102} < 59.0)"}, {"rule": "(${i_16c2353} < -10.0)"}, {"rule": "(${i_16fi022} < 300.0)"}, {"rule": "(${i_16fi226} < 0.5)"}, {"rule": "(${i_16lcotot} < 5.0)"}, {"rule": "(${i_16tc106sp_mv_oplowlim} < -11.0)"}, {"rule": "(${i_16tc106} < 550.0)"}, {"rule": "(${i_16tc108} < 945.0)"}, {"rule": "(${i_16ts108} < -10.0)"}], "component_type": "dlp", "replicated_from": "c57a23e2-7a54-45be-96db-2acb13a50f26", "full_episode_len": 150, "step_size_seconds": 480, "training_duration": "1:41:18.807285", "excluded_data_periods": [{"end": "2021-01-03 00:00", "start": "2021-01-01 00:00"}, {"end": "2021-01-18 00:00", "start": "2021-01-07 00:00"}, {"end": "2022-03-11 00:00", "start": "2022-01-01 00:00"}, {"end": "2023-02-01 00:00", "start": "2023-01-13 00:00"}], "algolib_define_version": "2.12.1", "calculated_output_vars": ["debut_vol_balance", "static_obj_fun_combined_streams", "volume_swell"], "physical_relationships": {"debut_vol_balance": {"vvs": {"debut_vol_balance": "relation_vv"}, "type": "relation_tolerance"}}, "algolib_finalize_version": "2.12.1", "physical_relationships_all_vvs": {"debut_vol_balance": "${c3_prod_flow2} + ${i_122fc170} - (${i_16fc240}+${i_16fc234} + ${i_16fi443_vv})"}, "gains_for_calculated_vars_all_vvs": {"lcn_total": "${i_122fi281_vv} + ${i_16fi023}", "hcn_correct": "${i_16fc135_vv} +  ${delta_hcn_in_jetlco}", "lco_correct": "${i_16lcotot} + ${delta_lco_in_slurry_slurlabs} - ${delta_slurry_in_lco}", "i_16fc135_vv": "dlpc.if_(${i_16fv135}>0, dlpc.if_(${i_16fc135}<2.5,2.5,${i_16fc135}),0)", "volume_swell": "(${lcnhcn_correct} + ${jetlco_correct} + ${slurry_correct} + ${c3_prod_flow2} + ${i_122fi279} - ${i_16fi443_vv}) / ${i_16c0102}", "i_122fi281_vv": "dlpc.math.nanmax(${i_122fc170} -${i_122fi279},0)", "i_16fc1476_vv": "dlpc.math.nanmax(${i_16fc1476},0)", "delta_hcn_in_jetlco": "dlpc.math.nanmax((${hcn_in_jetlco_av}) * dlpc.if_(${i_16fc1476_vv}>0,${i_16fc1476_vv},${i_16lcotot}),0)", "delta_slurry_in_lco": "dlpc.math.nanmax((${slurry_in_lco_av} * ${i_16lcotot}),0)", "delta_lco_in_slurry_slurlabs": "dlpc.math.nanmax((${lco_in_slurry_av} * ${i_16fi226}),0)", "static_obj_fun_combined_streams": "(${lcnhcn_correct} * 90.65 + ${jetlco_correct} * 82.03 + ${slurry_correct} * 81 + ${c3_prod_flow2}* 46.47 + ${i_122fi279}* 62.19) * 1000"}, "physical_relationships_requested_vvs": ["debut_vol_balance"], "gains_for_calculated_vars_requested_vvs": ["static_obj_fun_combined_streams", "volume_swell"]}
-- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- 

select episode_start, episode_end , add_constant_gain 
from ts_0f83d974cf5e4b668823109d0aba612d_pairs_calc 
where independent_variable = 'i_16ti0827' and dependent_variable = 'i_16fi022'
and episode_end ='2022-03-16 06:40:00.00'
limit 10

2022-03-15 10:48:00.000 +0000	2022-03-16 06:40:00.000 +0000	-Infinity



-- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- 

select "timestamp", col1 as i_16ti0827, col16 as i_16fi022 from ts_0f83d974cf5e4b668823109d0aba612d 
where "timestamp" >= '2022-03-15 10:48'
and "timestamp" <= '2022-03-16 06:40'
limit 5000

2022-03-15 10:48:00.000	1	534.1094970703125
2022-03-15 10:56:00.000	1	518.1007080078125
2022-03-15 11:04:00.000	1	507.86529541015625
2022-03-15 11:12:00.000	1	511.54339599609375
2022-03-15 11:20:00.000	1	515.296875
2022-03-15 11:28:00.000	1	576.8448486328125
2022-03-15 11:36:00.000	1	578.0809326171875
2022-03-15 11:44:00.000	1	511.5283203125
2022-03-15 11:52:00.000	1	496.61993408203125
2022-03-15 12:00:00.000	1	541.3450927734375
2022-03-15 12:08:00.000	1	544.450439453125
2022-03-15 12:16:00.000	1	512.1312866210938
2022-03-15 12:24:00.000	1	458.8590087890625
2022-03-15 12:32:00.000	1	477.4907531738281
2022-03-15 12:40:00.000	1	549.9373779296875
2022-03-15 12:48:00.000	1	549.862060546875
2022-03-15 12:56:00.000	1	487.6960144042969
2022-03-15 13:04:00.000	1	443.1969299316406
2022-03-15 13:12:00.000	1	492.037353515625
2022-03-15 13:20:00.000	1	539.9130249023438
2022-03-15 13:28:00.000	1	537.968505859375
2022-03-15 13:36:00.000	1	496.3335266113281
2022-03-15 13:44:00.000	1	490.51483154296875
2022-03-15 13:52:00.000	1	528.6978759765625
2022-03-15 14:00:00.000	1	552.4547729492188
2022-03-15 14:08:00.000	1	499.22772216796875
2022-03-15 14:16:00.000	1	446.4529724121094
2022-03-15 14:24:00.000	1	499.83074951171875
2022-03-15 14:32:00.000	1	553.1331176757812
2022-03-15 14:40:00.000	1	559.0723876953125
2022-03-15 14:48:00.000	1	546.1236572265625
2022-03-15 14:56:00.000	1	550.0731201171875
2022-03-15 15:04:00.000	1	536.189697265625
2022-03-15 15:12:00.000	1	473.9634094238281
2022-03-15 15:20:00.000	1	448.98541259765625
2022-03-15 15:28:00.000	1	509.9907531738281
2022-03-15 15:36:00.000	1	546.5909423828125
2022-03-15 15:44:00.000	1	536.02392578125
2022-03-15 15:52:00.000	1	528.712890625
2022-03-15 16:00:00.000	1	565.8557739257812
2022-03-15 16:08:00.000	1	576.4227905273438
2022-03-15 16:16:00.000	1	536.732421875
2022-03-15 16:24:00.000	1	476.842529296875
2022-03-15 16:32:00.000	1	458.90423583984375
2022-03-15 16:40:00.000	1	456.9596862792969
2022-03-15 16:48:00.000	1	480.4754333496094
2022-03-15 16:56:00.000	1	502.2576904296875
2022-03-15 17:04:00.000	1	499.5443115234375
2022-03-15 17:12:00.000	1	506.7196350097656
2022-03-15 17:20:00.000	1	547.0733032226562
2022-03-15 17:28:00.000	1	561.8309326171875
2022-03-15 17:36:00.000	1	532.7076416015625
2022-03-15 17:44:00.000	1	517.708740234375
2022-03-15 17:52:00.000	1	531.2906494140625
2022-03-15 18:00:00.000	1	525.0950927734375
2022-03-15 18:08:00.000	1	481.60601806640625
2022-03-15 18:16:00.000	1	461.3613586425781
2022-03-15 18:24:00.000	1	497.5997619628906
2022-03-15 18:32:00.000	1	523.7384033203125
2022-03-15 18:40:00.000	1	524.2207641601562
2022-03-15 18:48:00.000	1	504.1871643066406
2022-03-15 18:56:00.000	1	515.296875
2022-03-15 19:04:00.000	1	545.0985717773438
2022-03-15 19:12:00.000	1	544.73681640625
2022-03-15 19:20:00.000	1	515.86962890625
2022-03-15 19:28:00.000	1	481.3346862792969
2022-03-15 19:36:00.000	1	492.625244140625
2022-03-15 19:44:00.000	1	529.2103881835938
2022-03-15 19:52:00.000	1	562.8560180664062
2022-03-15 20:00:00.000	1	536.792724609375
2022-03-15 20:08:00.000	1	496.34857177734375
2022-03-15 20:16:00.000	1	487.0025939941406
2022-03-15 20:24:00.000	1	515.7490844726562
2022-03-15 20:32:00.000	1	541.2697143554688
2022-03-15 20:40:00.000	1	513.3070678710938
2022-03-15 20:48:00.000	1	498.0670471191406
2022-03-15 20:56:00.000	1	534.486328125
2022-03-15 21:04:00.000	1	557.745849609375
2022-03-15 21:12:00.000	1	521.8541259765625
2022-03-15 21:20:00.000	1	484.66607666015625
2022-03-15 21:28:00.000	1	481.7567443847656
2022-03-15 21:36:00.000	1	518.0404052734375
2022-03-15 21:44:00.000	1	535.149658203125
2022-03-15 21:52:00.000	1	514.302001953125
2022-03-15 22:00:00.000	1	498.4137268066406
2022-03-15 22:08:00.000	1	518.5529174804688
2022-03-15 22:16:00.000	1	554.6104125976562
2022-03-15 22:24:00.000	1	533.009033203125
2022-03-15 22:32:00.000	1	482.81195068359375
2022-03-15 22:40:00.000	1	464.135009765625
2022-03-15 22:48:00.000	1	514.34716796875
2022-03-15 22:56:00.000	1	560.4742431640625
2022-03-15 23:04:00.000	1	553.4346313476562
2022-03-15 23:12:00.000	1	515.7792358398438
2022-03-15 23:20:00.000	1	521.2662353515625
2022-03-15 23:28:00.000	1	549.1987915039062
2022-03-15 23:36:00.000	1	539.7020263671875
2022-03-15 23:44:00.000	1	480.6412658691406
2022-03-15 23:52:00.000	1	448.5633544921875
2022-03-16 00:00:00.000	1	483.7314453125
2022-03-16 00:08:00.000	1	532.195068359375
2022-03-16 00:16:00.000	1	543.21435546875
2022-03-16 00:24:00.000	1	528.9993286132812
2022-03-16 00:32:00.000	1	500.2528076171875
2022-03-16 00:40:00.000	1	520.8140869140625
2022-03-16 00:48:00.000	1	548.7766723632812
2022-03-16 00:56:00.000	1	549.8319091796875
2022-03-16 01:04:00.000	1	511.9654846191406
2022-03-16 01:12:00.000	1	491.208251953125
2022-03-16 01:20:00.000	1	517.2565307617188
2022-03-16 01:28:00.000	1	548.9425048828125
2022-03-16 01:36:00.000	1	533.1749267578125
2022-03-16 01:44:00.000	1	499.4840087890625
2022-03-16 01:52:00.000	1	496.1978454589844
2022-03-16 02:00:00.000	1	503.5238952636719
2022-03-16 02:08:00.000	1	502.09185791015625
2022-03-16 02:16:00.000	1	487.66583251953125
2022-03-16 02:24:00.000	1	513.8346557617188
2022-03-16 02:32:00.000	1	540.8175048828125
2022-03-16 02:40:00.000	1	512.055908203125
2022-03-16 02:48:00.000	1	492.0825500488281
2022-03-16 02:56:00.000	1	517.0454711914062
2022-03-16 03:04:00.000	1	515.7490844726562
2022-03-16 03:12:00.000	1	512.5081787109375
2022-03-16 03:20:00.000	1	492.2785339355469
2022-03-16 03:28:00.000	1	506.6442565917969
2022-03-16 03:36:00.000	1	526.9190673828125
2022-03-16 03:44:00.000	1	521.5526733398438
2022-03-16 03:52:00.000	1	489.9721984863281
2022-03-16 04:00:00.000	1	469.4411315917969
2022-03-16 04:08:00.000	1	520.5125732421875
2022-03-16 04:16:00.000	1	533.732666015625
2022-03-16 04:24:00.000	1	503.463623046875
2022-03-16 04:32:00.000	1	483.97265625
2022-03-16 04:40:00.000	1	505.7247314453125
2022-03-16 04:48:00.000	1	495.4290466308594
2022-03-16 04:56:00.000	1	493.21319580078125
2022-03-16 05:04:00.000	1	502.15216064453125
2022-03-16 05:12:00.000	1	491.99212646484375
2022-03-16 05:20:00.000	1	478.6062316894531
2022-03-16 05:28:00.000	1	510.0812072753906
2022-03-16 05:36:00.000	1	516.532958984375
2022-03-16 05:44:00.000	1	484.3796691894531
2022-03-16 05:52:00.000	1	480.7769470214844
2022-03-16 06:00:00.000	1	522.4872436523438
2022-03-16 06:08:00.000	1	513.9100341796875
2022-03-16 06:16:00.000	1	492.8664245605469
2022-03-16 06:24:00.000	1	527.6275634765625
2022-03-16 06:32:00.000	1	526.1351928710938
2022-03-16 06:40:00.000	1	469.7425842285156

-- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- -- ---- 
