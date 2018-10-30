temps_prochain_artifice=0;
[] spawn {
	_periode_min=600;
	_periode_max=3600;
	_heure_debut=22;
	_heure_fin=5;
	while {true} do{
		if (daytime<_heure_fin || daytime>_heure_debut) then {
			_i=1;
			while {not(isNil ("lancement_feu_artifice_" + str _i))}do{
				(call compile ("lancement_feu_artifice_" + str _i) ) execVM "Effets\Effet_Artifice.sqf";
				_i=_i+1;
			};
			temps_prochain_artifice=_periode_min max random _periode_max;
			sleep temps_prochain_artifice;
		};
		sleep 1;
	};
};