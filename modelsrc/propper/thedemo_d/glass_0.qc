$modelname "emotbooth/glass_0"
$staticprop
$casttextureshadows
$origin 0 0 0 -90
$model mesh "glass_0.smd"
$surfaceprop "glass"
$mostlyopaque
$cdmaterials "models/emotbooth/glass/GLASS"
$collisionmodel "glass_0_phys.smd"
{
	$automass
	$concave
	$remove2d
	$maxconvexpieces 1000000
}
$sequence ref "glass_0.smd"
