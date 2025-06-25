time <- "a"
locked <- 0

function Think()
{
	locked=locked+1;
}

function In(num)
{
	if(locked<30 || time=="d")
		EntFire("kp_b"+num,"PressOut","",0.00);
	else
	{
		EntFire("dialogue4"+time+""+num,"Start","",0.00);
		if(time=="a")
			time = "b";
		else
		{
			if(time=="b")
				time = "c";
			else
			{
				time = "d";
				EntFire("kp_access","Trigger","",3.00);
			}
		}
		locked = 0;
	}
}

