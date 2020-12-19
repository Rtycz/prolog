nation(t100_lt,1).
nation(object_140,1).
nation(object_430u,1).
nation(t62a,1).
nation(object_907,1).
nation(is_4,1).
nation(is_7,1).
nation(object_277,1).
nation(object_705a,1).
nation(object_260,1).
nation(object_268_4,1).
nation(object_268,1).
nation(object_261,1).

nation(rheinmetall_panzerwagen,2).
nation(leopard_1,2).
nation(grille_15,2).

nation(m48a5_patton,3).
nation(t110e5,3).
nation(t110e4,3).

nation(amx13_105,4).
nation(panhard_ebr_105,4).
nation(amx_30_b,4).
nation(bat_chatillon_25t,4).
nation(amx_50_b,4).
nation(amx_m4_mle_54,4).
nation(amx_50_foch_b,4).
nation(amx_50_foch_155,4).
nation(bat_chatillon_155_58,4).

nation(manticore,5).
nation(centurion_action_x,5).
nation(super_conqueror,5).
nation(fv_215_b,5).
nation(t95_fv201_chieftain,5).
nation(fv217_badger,5).
nation(fv_215_b183,5).

nation(b121,7).

nation(kranvagn,10).
nation(strv_103b,10).

nation(progetto_m40_mod65,11).





type(t100_lt,1).
type(rheinmetall_panzerwagen,1).
type(amx13_105,1).
type(panhard_ebr_105,1).
type(manticore,1).

type(object_140,2).
type(object_430u,2).
type(t62a,2).
type(object_907,2).
type(leopard_1,2).
type(m48a5_patton,2).
type(amx_30_b,2).
type(bat_chatillon_25t,2).
type(centurion_action_x,2).
type(b121,2).
type(progetto_m40_mod65,2).

type(is_4,3).
type(is_7,3).
type(object_277,3).
type(object_705a,3).
type(object_260,3).
type(t110e5,3).
type(amx_50_b,3).
type(amx_m4_mle_54,3).
type(super_conqueror,3).
type(fv_215_b,3).
type(t95_fv201_chieftain,3).
type(kranvagn,3).

type(object_268_4,4).
type(object_268,4).
type(grille_15,4).
type(t110e4,4).
type(amx_50_foch_b,4).
type(amx_50_foch_155,4).
type(fv217_badger,4).
type(fv_215_b183,4).
type(strv_103b,4).

type(object_261,5).
type(bat_chatillon_155_58,5).





receiving(t100_lt,1).
receiving(rheinmetall_panzerwagen,1).
receiving(amx13_105,1).
receiving(panhard_ebr_105,1).
receiving(manticore,1).
receiving(object_140,1).
receiving(object_430u,1).
receiving(leopard_1,1).
receiving(m48a5_patton,1).
receiving(bat_chatillon_25t,1).
receiving(centurion_action_x,1).
receiving(progetto_m40_mod65,1).
receiving(is_4,1).
receiving(is_7,1).
receiving(object_277,1).
receiving(object_705a,1).
receiving(t110e5,1).
receiving(amx_50_b,1).
receiving(amx_m4_mle_54,1).
receiving(super_conqueror,1).
receiving(kranvagn,1).
receiving(object_268_4,1).
receiving(object_268,1).
receiving(grille_15,1).
receiving(t110e4,1).
receiving(amx_50_foch_b,1).
receiving(fv217_badger,1).
receiving(strv_103b,1).
receiving(object_261,1).
receiving(bat_chatillon_155_58,1).

receiving(object_907,2).
receiving(b121,2).
receiving(t95_fv201_chieftain,2).
receiving(object_260,2).
receiving(fv_215_b,2).
receiving(fv_215_b183,2).
receiving(amx_50_foch_155,2).

receiving(t62a,3).
receiving(amx_30_b,3).





role(object_268_4,1).
role(object_268,1).
role(t110e4,1).
role(amx_50_b,1).
role(amx_50_foch_b,1).
role(fv217_badger,1).
role(kranvagn,1).
role(amx_50_foch_155,1).

role(object_430u,2).
role(m48a5_patton,2).
role(object_907,2).

role(object_140,3).
role(t62a,3).
role(centurion_action_x,3).
role(b121,3).

role(is_7,4).
role(object_277,4).
role(t110e5,4).
role(super_conqueror,4).
role(object_260,4).
role(t95_fv201_chieftain,4).
role(fv_215_b,4).

role(is_4,5).
role(object_705a,5).
role(amx_m4_mle_54,5).

role(leopard_1,6).
role(amx_30_b,6).
role(bat_chatillon_25t,6).
role(progetto_m40_mod65,6).

role(fv_215_b183,7).

role(grille_15,8).
role(strv_103b,8).

role(t100_lt,9).
role(rheinmetall_panzerwagen,9).
role(amx13_105,9).
role(manticore,9).

role(panhard_ebr_105,10).

role(object_261,11).
role(bat_chatillon_155_58,11).





question1(X1):-	write("Nation of tank"),nl,
				write("1. USSR"),nl,
				write("2. Germany"),nl,
				write("3. USA"),nl,
				write("4. France"),nl,
				write("5. Britain"),nl,
				write("6. Czech"),nl,
				write("7. China"),nl,
				write("8. Japan"),nl,
				write("9. Poland"),nl,
				write("10. Sweden"),nl,
				write("11. Italian"),nl,
				read(X1).

question2(X2):-	write("Type of tank"),nl,
				write("1. Light tank"),nl,
				write("2. Medium tank"),nl,
				write("3. Heavy tank"),nl,
				write("4. Anti-tank self-propelled artillery mount"),nl,
				write("5. Self-propelled artillery unit"),nl,
				read(X2).

question3(X3):-	write("Receiving of tank"),nl,
				write("1. Passing"),nl,
				write("2. Action"),nl,
				write("3. Collection"),nl,
				read(X3).

question4(X4):-	write("Nation of tank"),nl,
				write("1. Heavy stormtrooper"),nl,
				write("2. Medium stormtrooper"),nl,
				write("3. Light stormtrooper"),nl,
				write("4. Breakthrough tank"),nl,
				write("5. Defender"),nl,
				write("6. Fire support"),nl,
				write("7. High-caliber fire support"),nl,
				write("8. Sniper"),nl,
				write("9. Tracked scout"),nl,
				write("10. Wheel scout"),nl,
				write("11. Artillery"),nl,
				read(X4).





pr:-	question1(X1), question2(X2), question3(X3), question4(X4),
		nation(X,X1), type(X,X2), receiving(X,X3), role(X,X4),
		write(X).