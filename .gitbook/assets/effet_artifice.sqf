_this spawn {
		//PARAMETRAGE
		_nombre_de_series=5;
		_nombre_artifices_par_serie=10;
		_temps_fumee=2.5;
		_temps_de_tir=1;
		_temps_de_serie=10;
		_temps_fragments=2;
		_vitesse_de_tir_vertical=40;
		_vitesse_de_tir_horizontal=20;
		_vitesse_fragments=20;
		_vitesse_declenchement_explosion=25;
		_vitesse_lecture_son=2;
		_nombre_de_fragments=18;
		_volume_explosion=100;
		_distance_explosion=2000;
		_frequence_rafraichissement_verification_vitesse=0.2;
		_liste_couleurs_fragments=["Red","Blue","Yellow","Purple","Green","Orange"];
		_intensite_lumineuse=20;
		//BOUCLE DES SERIES
		for "_i" from 0 to _nombre_de_series do {
			//BOUCLE DES TIRS
			for "_j" from 0 to _nombre_artifices_par_serie do {
				//CREATION FUSEE
				_fusee="SmokeShell" createVehicle (GetPosASL _this);
				//ATTENTE FUMEE
				sleep (_temps_fumee-0.3);
				//SON LANCEMENT
				playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\skeet_launch1.wss", [], false,GetPosASL _this, _volume_explosion/100, _vitesse_lecture_son, _distance_explosion/10];sleep 0.1;playSound3D ["a3\missions_f_beta\data\sounds\Showcase_Night\flaregun_shoot.wss", [], false,GetPosASL _this, _volume_explosion/75, _vitesse_lecture_son, _distance_explosion/10];sleep 0.2;playSound3D ["a3\missions_f_beta\data\sounds\Showcase_Night\flaregun_4.wss", [], false,GetPosASL _this, _volume_explosion/50,_vitesse_lecture_son, _distance_explosion/10];
				//CREATION LUMIERE
				_light="#lightpoint" createVehicle (GetPosASL _this);_light setLightBrightness (_intensite_lumineuse/2);_light setLightAmbient [1,1,0.5];_light setLightColor [3,0,0];_light lightAttachObject [_fusee, [0,0,0]];
				//PROPULSION FUSEE
				_vitesse_de_tir_horizontal=random(_vitesse_de_tir_horizontal*2)-_vitesse_de_tir_horizontal;
				_fusee SetPosASL GetPosASL _this;_fusee setVelocity [_vitesse_de_tir_horizontal,_vitesse_de_tir_horizontal,_vitesse_de_tir_vertical/1.5 max random (_vitesse_de_tir_vertical*2)];
				//ATTENTE RETOMBEE
				while {velocity _fusee select 2 >random (_vitesse_declenchement_explosion*2)} do {sleep _frequence_rafraichissement_verification_vitesse;};
				//CHOIX COULEUR EXPLOSION
				_couleur=_liste_couleurs_fragments select(round(random(count (_liste_couleurs_fragments)-1)));
				//SON EXPLOSION
				[_this,_volume_explosion,_vitesse_lecture_son,_distance_explosion,_temps_fumee] spawn {_source=_this select 0;_volume_explosion=_this select 1;_vitesse_lecture_son=_this select 2;_distance_explosion=_this select 3;_temps_fumee=_this select 4;
					sleep _temps_fumee;
					playSound3D ["A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions" + str ( round (random 4)) + ".wss", [], false, GetPosASL _source ,_volume_explosion, _vitesse_lecture_son, _distance_explosion];
				};
				//EXPLOSION DES FRAGMENTS
				for "_i" from 1 to _nombre_de_fragments do {[_couleur,_fusee,_i,_temps_fumee,_nombre_de_fragments,_vitesse_fragments,_this,_light,_intensite_lumineuse] spawn {_couleur=_this select 0;_fusee=_this select 1;_i=_this select 2;_temps_fumee=_this select 3;_nombre_de_fragments=_this select 4;_vitesse_fragments=_this select 5;_source=_this select 6;_light=_this select 7;_intensite_lumineuse =_this select 8;
						//CREATION FRAGMENT
						_frag=("SmokeShell" + _couleur) createVehicle ([0,0,0]); 
						_source setVariable["frament_" + str _i,_frag,true];
						//ATTENTE FUMEE
						sleep _temps_fumee;
						//SUPPRESSION LUMIERE FUSEE
						deleteVehicle _light;
						//PROPULSION FRAGMENT
						_angle=_i/_nombre_de_fragments*360;
						_frag SetPosASL GetPosASL _fusee;
						_frag setVelocity [cos _angle * _vitesse_fragments,sin _angle * _vitesse_fragments,_vitesse_fragments/10];	
						//CREATION LUMIERE
						_frag_light="#lightpoint" createVehicle GetPosASL _fusee;_frag_light setLightBrightness (_intensite_lumineuse);_frag_light setLightAmbient [1,1,0.5];_frag_light setLightColor [3,0,0];_frag_light lightAttachObject [_frag, [0,0,0]];
						_source setVariable["frag_light_" + str _i,_frag_light,true];
					};
				sleep 0.001;
				};
				sleep _temps_fumee;
				sleep _temps_fragments;
				//SUPPRESSION FUSEE
				deleteVehicle _fusee;
				//SUPPRESSION FRAGMENT
				for "_i" from 1 to _nombre_de_fragments do {
					deleteVehicle (_this getVariable["frament_" + str _i,ObjNull]);
					deleteVehicle (_this getVariable["frag_light_" + str _i,ObjNull]);
				};
				//ATTENTE ENTRE DEUX TIRS
				sleep random(_temps_de_tir*2);
			};
			//ATTENTE ENTRE DEUX SERIES
			sleep random(_temps_de_serie*2);
		};
};