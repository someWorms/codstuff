main()
{
	thread onPlayerConnect();
	entTransporter = getentarray( "roflenter", "targetname" );
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
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );	
		player iPrintLnBold("^1Try ^2WD");
		//player.enter destroy();

	}

}
