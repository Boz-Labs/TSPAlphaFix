rmcr <- 1;
rmtr <- 4;
a <- [0,0,0,0];
b <- 0;

function RandomPerm()
{
	while(1)
	{
		a[0] = RandomInt(1,4);
		if(a[0]!=rmcr)
			break;
	}
	while(1)
	{
		a[1] = RandomInt(1,4);
		if(a[1]!=a[0])
			break;
	}
	while(1)
	{
		a[2] = RandomInt(1,4);
		if((a[2]!=a[1])&&(a[2]!=a[0]))
			break;
	}
	while(1)
	{
		a[3] = RandomInt(1,4);
		if((a[3]!=a[2])&&(a[3]!=a[1])&&(a[3]!=a[0]))
			break;
	}
}

function CurrentRoom(arg)
{
	rmcr = arg;
}

function Trigger()
{
	rmtr+=1;
	Evaluate();
}
	
function Evaluate()
{
	if(rmtr>=3)
	{
		RandomPerm();
		EntFire("prtl_a*","Close","",0);
		EntFire("prtl_b*","Close","",0);
		EntFire("prtl_a"+a[0]+"","SetPartner","prtl_b"+a[1]+"",0);
		EntFire("prtl_b"+a[1]+"","SetPartner","prtl_a"+a[0]+"",0);
		EntFire("prtl_a"+a[1]+"","SetPartner","prtl_b"+a[2]+"",0);
		EntFire("prtl_b"+a[2]+"","SetPartner","prtl_a"+a[1]+"",0);
		EntFire("prtl_a"+a[2]+"","SetPartner","prtl_b"+a[3]+"",0);
		EntFire("prtl_b"+a[3]+"","SetPartner","prtl_a"+a[2]+"",0);
		EntFire("prtl_a"+a[3]+"","SetPartner","prtl_b"+a[0]+"",0);
		EntFire("prtl_b"+a[0]+"","SetPartner","prtl_a"+a[3]+"",0);
		EntFire("prtl_a*","Open","",0);
		EntFire("prtl_b*","Open","",0);
		EntFire("tr_a*","Enable","",0);
		EntFire("tr_b*","Enable","",0);
		EntFire("dr_a*","Open","",0);
		EntFire("dr_b*","Open","",0);
		EntFire("dr_a"+rmcr+"","Close","",0);
		rmtr = 0;
	}
}

function SpecialRoom()
{
	//Fade in!
	EntFire("prop_drm","TurnOff","",0.3);
	EntFire("brush-s_drm","Enable","",0.3);
	EntFire("brush_drm","Disable","",0.3);
	EntFire("light_drm","LightOff","",0.3);
	EntFire("sprite_drm","HideSprite","",0.3);
	EntFire("ovt_p","IncrementTextureIndex","",0);
	EntFire("ovt_t","IncrementTextureIndex","",0);
	EntFire("ovt_t","IncrementTextureIndex","",0.04);
	EntFire("ovt_t","IncrementTextureIndex","",0.08);
	EntFire("ovt_t","IncrementTextureIndex","",0.12);
	EntFire("ovt_t","IncrementTextureIndex","",0.16);
	EntFire("ovt_t","IncrementTextureIndex","",0.2);
	EntFire("ovt_t","IncrementTextureIndex","",0.24);
	EntFire("ovt_t","IncrementTextureIndex","",0.28);
	EntFire("ovt_t","IncrementTextureIndex","",0.32);
	EntFire("ovt_t","IncrementTextureIndex","",0.36);
	EntFire("ovt_t","IncrementTextureIndex","",0.4);
	EntFire("ovt_t","IncrementTextureIndex","",0.44);
	EntFire("ovt_t","IncrementTextureIndex","",0.48);
	EntFire("ovt_t","IncrementTextureIndex","",0.52);
	EntFire("ovt_t","IncrementTextureIndex","",0.56);

	//Fade out!
	EntFire("prop_drm","TurnOn","",6.3);
	EntFire("brush-s_drm","Disable","",6.3);
	EntFire("brush_drm","Enable","",6.3);
	EntFire("light_drm","LightOn","",6.3);
	EntFire("sprite_drm","ShowSprite","",6.3);
	EntFire("ovt_p","SetTextureIndex","0",6);
	EntFire("ovt_t","SetTextureIndex","14",6);
	EntFire("ovt_t","SetTextureIndex","13",6.04);
	EntFire("ovt_t","SetTextureIndex","12",6.08);
	EntFire("ovt_t","SetTextureIndex","11",6.12);
	EntFire("ovt_t","SetTextureIndex","10",6.16);
	EntFire("ovt_t","SetTextureIndex","9",6.2);
	EntFire("ovt_t","SetTextureIndex","8",6.24);
	EntFire("ovt_t","SetTextureIndex","7",6.28);
	EntFire("ovt_t","SetTextureIndex","6",6.32);
	EntFire("ovt_t","SetTextureIndex","5",6.36);
	EntFire("ovt_t","SetTextureIndex","4",6.4);
	EntFire("ovt_t","SetTextureIndex","3",6.44);
	EntFire("ovt_t","SetTextureIndex","2",6.48);
	EntFire("ovt_t","SetTextureIndex","1",6.52);
	EntFire("ovt_t","SetTextureIndex","0",6.56);
}

Evaluate();
EntFire("dr_a1","Open","",0);
EntFire("prtl_startb","SetPartner","prtl_a"+a[0]+"",0);
EntFire("prtl_a"+a[0]+"","SetPartner","prtl_startb",0);
printl("Initialized portal sequence controller");