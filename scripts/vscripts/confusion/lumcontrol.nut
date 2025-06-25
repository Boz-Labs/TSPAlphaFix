coord_p <- Vector(0, 0, 0);
coord_s <- Vector(0, 0, 0);
dist <- 0;

function Gather()
{
	coord_p = GetPlayer().GetOrigin();
	coord_s = self.GetOrigin();
	dist = sqrt(pow(coord_p.x-coord_s.x,2)+pow(coord_p.y-coord_s.y,2));
}

function Think()
{
	Gather();
	if(dist>96 && dist<256)
		EntFire("hole_textoggle","SetTextureIndex",""+(16-floor((dist-96)/10))+"",0.00);
	else
	{
		if(dist<=96)
			EntFire("hole_textoggle","SetTextureIndex","16",0.00);
		if(dist>=256)
			EntFire("hole_textoggle","SetTextureIndex","0",0.00);
	}
}

/*
function ThinkLight()
{
	Gather();
	if(dist>64 && dist<256)
	{
		EntFireByHandle(self,"SetColor",floor(dist-64)+" "+floor(dist-64)+" "+floor(dist-64),0.00,null,null);
		EntFireByHandle(tonemap,"SetAutoExposureMin",""+floor((dist-32)/32)+"",0.00,null,null);
	}
	else
	{
		if(dist<=64)
		{
			EntFireByHandle(self,"SetColor","0 0 0",0.00,null,null);
			EntFireByHandle(tonemap,"SetAutoExposureMin","1",0.00,null,null);
		}
		if(dist>=256)
		{
			EntFireByHandle(self,"SetColor","255 255 255",0.00,null,null);
			EntFireByHandle(tonemap,"SetAutoExposureMin","7",0.00,null,null);
		}
	}
}
*/