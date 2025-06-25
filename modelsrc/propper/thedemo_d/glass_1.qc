$modelname "emotbooth/glass_1"
$staticprop
$casttextureshadows
$origin 0 0 0 -90
$model mesh "glass_1.smd"
$surfaceprop "glass"
$mostlyopaque
$cdmaterials "models/emotbooth/glass/GLASS"
$collisionmodel "glass_1_phys.smd"
{
	$automass
	$concave
	$remove2d
	$maxconvexpieces 1000000
}
$sequence ref "glass_1.smd"
