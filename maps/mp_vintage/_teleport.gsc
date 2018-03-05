main()
{
	thread onPlayerConnect();
	entTransporter = getentarray( "enter", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}

onPlayerConnect()
{

  	for(;;)
        {
                level waittill("connecting", player);
	}
}


transporter()
{
	for(;;)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		
		
                player.enter = newClientHudElem(player);
		player.enter.x = 0;
		player.enter.y = 0;
		player.enter.alignX = "left";		
		player.enter.alignY = "top";
		player.enter.horzAlign = "fullscreen";
		player.enter.vertAlign = "fullscreen";
		player.enter.alpha = 0;
		player.enter.color = (0,0,0);
		player.enter setshader("black", 640, 480);
		
		wait 0.01;
		player.enter.alpha = 0.1;
		wait 0.01;
		player.enter.alpha = 0.2;
		wait 0.01;
		player.enter.alpha = 0.3;
		wait 0.01;
		player.enter.alpha = 0.4;
		wait 0.01;
		player.enter.alpha = 0.5;
		wait 0.01;
		player.enter.alpha = 0.6;
		wait 0.01;
		player.enter.alpha = 0.7;
		wait 0.01;
		player.enter.alpha = 0.8;
		wait 0.01;
		player.enter.alpha = 0.9;
		wait 0.01;
		player.enter.alpha = 1;

              
		               
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );		  
                                                           
		wait 2;
		
		player.enter.alpha = 0.9;
		wait 0.01;           
		player.enter.alpha = 0.8;
		wait 0.01;           
		player.enter.alpha = 0.7;
		wait 0.01;           
		player.enter.alpha = 0.6;
		wait 0.01;           
		player.enter.alpha = 0.5;
		wait 0.01;           
		player.enter.alpha = 0.4;
		wait 0.01;           
		player.enter.alpha = 0.3;
		wait 0.01;           
		player.enter.alpha = 0.2;
		wait 0.01;           
		player.enter.alpha = 0.1;
		wait 0.01;           
		player.enter.alpha = 0;
		wait 0.01;

		

		player.enter destroy();

	}

}
