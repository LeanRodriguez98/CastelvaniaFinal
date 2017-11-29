package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Theo leyenda
 */
class GrandeVerdeVer extends FlxSprite 
{
private var timer:Int = 0;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		timer += 1;

		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.GrandeVerde__png);
		if(timer < 10)
		{
			x = x + 1;
		}
		if (timer == 10)
		{
			timer = 0;
		}
	}
	
}