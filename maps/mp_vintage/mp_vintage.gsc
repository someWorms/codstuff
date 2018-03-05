#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main(){

	maps\mp\_load::main();
	
	precacheShader("sonic_metal_head");
	precacheShader("sonic_metal_body");
	precacheShader("sonic_metal_head_n");
	precacheShader("sonic_metal_body_n");
	precacheShader("~sonic_metal_head_s-rgb&$white-l-11");
	precacheShader("~sonic_metal_body_s-rgb&$white-l-11");
	precacheModel("sonic_metal_model");
	
	precacheShader("mtl_skeleton_body_n");
	precacheShader("mtl_skeleton_body_d");
	precacheShader("mtl_skeleton_parts_n");
	precacheShader("mtl_skeleton_parts_d");
	precacheShader("mtl_skeleton_hat");
	precacheShader("mtl_skeleton_hat_n");
	precacheShader("~mtl_skeleton_parts_s-rgb&$white-l-11");
	precacheShader("~mtl_skeleton_body_s-rgb&$white-l-11");
	precacheModel("skeleton_model");
	

	precacheShader("cupid_freddy_wings_3");
  	precacheShader("cupid_freddy_skeleton");
  	precacheShader("cupid_freddy_body");
  	precacheShader("cupid_freddy_head");
   	precacheModel("cupid_freddy_model");
	
   	precacheShader("mtl_harley_eyes");
  	precacheShader("mtl_harley_limbs");
  	precacheShader("mtl_harley_head");
 	precacheShader("mtl_harley_body");
	precacheShader("mtl_harley_hair");
	precacheShader("mtl_harley_limbs_2");   
	precacheModel("harley_model");

	precacheShader ("mtl_captainamerica_eye1");
	precacheShader ("mtl_captainamerica_eye2");
	precacheShader ("mtl_captainamerica_eye3");
	precacheShader ("mtl_captainamerica_face");
	precacheShader ("mtl_captainamerica_helmet");
	precacheShader ("mtl_captainamerica_legs");
	precacheShader ("mtl_captainamerica_mouth");
	precacheShader ("mtl_captainamerica_torso");
	precacheShader ("mtl_captainamerica_shield_front");
	precacheShader ("mtl_captainamerica_shield_back");
	precacheShader ("mtl_captainamerica_viewhands");
	precacheModel ("captainamerica");
	precacheModel ("captainamericaviewhands");
	
	preCacheShader("atlend");
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setdvar( "r_specularcolorscale", ".1" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");

	thread maps\mp\_teleport::main();
	thread maps\mp\_teleport_v2::main();
	thread maps\mp\_rotate::main();
	thread maps\mp\_welcome::main();
	
	thread onPlayerConnect();
	thread lift_1();
	thread spamstuff();
	thread welcomecreator();
	thread atlend();
	

	level.accepted = [];
	level.accepted[1] = "79d9dfe1"; //TIGR
	level.accepted[2] = "7f4fc2fc"; //bus 92b99be78cf6190b5ee6a2757f4fc2fc     6599241b
   	level.accepted[3] = "83591354"; //ME
	level.accepted[4] = "3b6654c0"; //KEN
	//level.accepted[5] = "cc8f1490"; //iznogod  
	//level.accepted[6] = "2e7d4c44"; //alex yar
	//level.accepted[7] = "0ebd971c"; //Boris
	//level.accepted[8] = "ffcabcd2"; //Razzer
}
//////////////////////////////////////////////////////////////////
lift_1() { 
	lift_1 = getent( "lift_1", "targetname" ); 	
	while(true) {   
		lift_1 movez ( 50, 3, 0.5, 0.5); 
		lift_1 waittill ("movedone"); 
		wait 0.05; 
		lift_1 movez ( -50, 3, 0.5, 0.5); 
		lift_1 waittill ("movedone"); 
	} 
}
//////////////////////////////////////////////////////////////////
onPlayerConnect() {
  	for(;;) {
        level waittill("connecting", player);
       	player thread onPlayerSpawned();
	player thread block2rpg();
	player iprintln("Map by Angry Worm & eL tiGre");
	}
}
//////////////////////////////////////////////////////////////////
onPlayerSpawned() {
	self endon("disconnect");
	for(;;) {
		self waittill("spawned_player");
		self thread setPlayerModel();
	}
}
//////////////////////////////////////////////////////////////////
setPlayerModel() {
	for(i=0;i < level.accepted.size; i++) {
		if(!IsDefined(level.accepted[i]))
			continue;
		if( level.accepted[i] == getSubStr(self getGuid(), 24, 32) ) {
			if( i == 1 ) {
				self detachAll();
				self setModel( "harley_model" );
			}
			if( i == 2 ) {
				self detachAll();
				self setModel( "cupid_freddy_model" );
			}
			if( i == 3 ) {
				self detachAll();
				self setModel( "skeleton_model" );
			}
			if( i == 4 ) {
				self detachAll();
				self setModel( "captainamerica" );
			}
		}
	}
}
//////////////////////////////////////////////////////////////////
spamstuff() {
  while(true) {
    wait 300;
    iprintln("^2Map by ^1Angry Worm ^7& ^5eL tiGre");
  }
}
//////////////////////////////////////////////////////////////////

welcomecreator() {
    for(;;) {
        level waittill("connected",who);
		//worm
        if(getsubstr(who getguid(),24,32)=="83591354") { 
			iPrintLnBold( " ^2Creator " + who.name + " ^7has ^7connected" );
        }
		//izno
        if(getsubstr(who getguid(),24,32)=="cc8f1490") {
		    iPrintLnBold( " ^5Boss " + who.name + " ^5has ^5connected" );
		}
		//Tigr
		if(getsubstr(who getguid(),24,32)=="79d9dfe1") {
		    iPrintLnBold( " ^2Father " + who.name + " ^7has connected" );
		}
		// Kenedko
		if(getsubstr(who getguid(),24,32)=="3b6654c0") {
		    iPrintLnBold( " ^5O^7verlord " + who.name + " ^8has ^7connected" );
		}
		// Bushido
		if(getsubstr(who getguid(),24,32)=="7f4fc2fc") {
		    iPrintLnBold( " ^4Friend " + who.name + " ^7has ^7connected" );
		}
		// Alex_Yar
		if(getsubstr(who getguid(),24,32)=="e7d4c44f") {
		    iPrintLnBold( " ^4Friend " + who.name + " ^7has ^7connected" );
		}
		// Boris
		if(getsubstr(who getguid(),24,32)=="0ebd971c") {
		    iPrintLnBold( " Medved " + who.name + " is here" );
            p=getentarray("player","classname");
            for(i=0;i<p.size;i++)
                p[i] playlocalsound("boris");
		}
		// serega
		if(getsubstr(who getguid(),24,32)=="ffcabcd2"){
		    iPrintLnBold( " otec " + who.name + " ^7has ^7connected" );
            p=getentarray("player","classname");
            for(i=0;i<p.size;i++)
                p[i] playlocalsound("razzer");
		}
    }
}

//////////////////////////////////////////////////////////////////
block2rpg() {
	self.firerpg = 0;
	self thread checkdabl();
	self thread antiRpg();
	for(;;) {
		self waittill("weapon_fired");
		if( (self getCurrentWeapon() == "rpg_mp" || self getCurrentWeapon() == "projectile" || self getCurrentWeapon() == "rpggold_mp" ) && !self isOnGround() ) 
		{
			self.firerpg++;
		}
	}
}

antiRpg() {
	self endon("disconnect");
	
	spawn = getentarray("mp_dm_spawn", "classname");
	self.last_save = spawn[0].origin;
	for(;;){
		self waittill("menuresponse", menu, response);

		if( response == "save" ) {
			self.last_save = self.origin;
		}
	}
}

checkdabl() {
	while(1) {
		if( self.firerpg > 1 ) {
			self.firerpg = 0;
			self freezecontrols(true);
			self setOrigin(self.last_save);
			wait 0.1;
			self freezecontrols(false);	
			self iprintln("no double rpg on this map");
			iPrintln(self.name + " tried to use double rpg");
		}
		if( self isOnGround() && self.firerpg > 0 ) {
			self.firerpg = 0;
		}
	wait 0.01;
	}
}
//////////////////////////////////////////////////////////////////

atlend() { 
	atlend    = getent( "pic2", "targetname" ); 
	
	while(true) { 
         atlend waittill("trigger",player);
     
      
          player.atlend = true;
          player thread the_atlend();
          wait (2);

       }

}
the_atlend() {
if(isDefined(self.the_atlend))
	self.the_atlend destroy();

self.the_atlend = newClientHudElem(self);
self.the_atlend.alignX = "center";
self.the_atlend.alignY = "top";
self.the_atlend.horzAlign = "fullscreen";
self.the_atlend.vertAlign = "fullscreen";
self.the_atlend.x = 310;
self.the_atlend.y = -700;
self.the_atlend.alpha = 0;
self.the_atlend.sort = 1;
self.the_atlend.hideWhenInMenu = false;
self.the_atlend setShader("atlend", 300, 400);
self.the_atlend.alpha = 1;
self.the_atlend moveOverTime(15);
self.the_atlend.y = 40;
wait (22);
self.the_atlend moveOverTime(2);
self.the_atlend.y = 1000;
wait (2);
self.the_atlend destroy();

wait 0.05;

}




