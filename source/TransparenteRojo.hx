package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class TransparenteRojo extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Rojo__png);
		
	}
	override public function update(elapsed:Float):Void
	{
		//FlxTween.tween(this, {y:this.y + 150}, 10, {type: FlxTween.PINGPONG});
	}
}