onPlayerConnected()
{
	self endon("disconnect");
	if(!isDefined(self GetStat(2311) || self GetStat(2311) == 0))
		self SetStat(2311,1);
	for(;;)
	{
		if(isDefined(self GetStat(2311)) && isDefined(self))
			self SetStat(2311,self GetStat(2311) + 1);
		wait 1;
	}
}

OnPlayerKilled(sMeansOfDeath,eAttacker)
{
	kills = eAttacker GetStat(2303); // 2303 = Kills
	deaths = self GetStat(2305); // 2305 = Deaths
	headshots = eAttacker GetStat(2308); // 2308 = Headshots
	score = eAttacker GetStat(2302); // 2302 = Score
	
	if(!isDefined(eAttacker GetStat(2303) || eAttacker GetStat(2303) == 0))
		eAttacker SetStat(2303,1);
	else 
		eAttacker SetStat(2303,kills + 1);
	
	if( !isDefined(self GetStat(2305) || self GetStat(2305) == 0))
		self SetStat(2305,1);
	else 
		self SetStat(2305,deaths + 1);
	
	if(!isDefined(eAttacker GetStat(2302) || eAttacker GetStat(2302) == 0))
		eAttacker SetStat(2302,5);
	else 
		eAttacker SetStat(2302,score + 5);
	
	if(sMeansOfDeath=="MOD_HEAD_SHOT")
	{
		if(!isDefined(eAttacker GetStat(2308) || eAttacker GetStat(2308) == 0))
			eAttacker SetStat(2308,1);
		else 
			eAttacker SetStat(2308,headshots + 1);
	}
	
	
	
}