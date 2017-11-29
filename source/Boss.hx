package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Theo leyenda
 */
class Boss extends FlxSprite 
{
	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
			
		loadGraphic(AssetPaths.bossCastelvania__png, true, 108, 49);
		animation.add("Boss", [0, 1], 8, true);
		animation.play("Boss");
	}
		override public function update(elapsed:Float):Void
	{		
		super.update(elapsed);
		
	}
	/*
	public function RestarVida(b:Int):Void
	{
		vida = vida - b;
	}
	public function getVidaBoss()
	{
		return vidaBoss;
	}
	public function SumarVida(b:Int):Void
	{
		vida = vida + b;
	}*/
}