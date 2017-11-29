package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class PlataformaDesapareceNaranja extends FlxSprite 
{
	private var TimerDesaparecer:Int=0;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		TimerDesaparecer++;
		
		
	}
	
}