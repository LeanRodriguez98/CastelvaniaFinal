package;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Theo leyenda
 */
class Raton extends Enemigo 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.enemigo3__png,true,32,32);
		animation.add("Raton", [0, 1, 2, 3], 8, true);
		animation.play("Raton");
		
		width = 24;
		height = 14;
		//centrar la caja de colicion en el medio de todo el sprite
		centerOrigin();
		centerOffsets();
		//--------------------------------------------------------
		acceleration.y = 1500;
	}
	override public function update(elapsed:Float):Void
	{
		
		super.update(elapsed);
	}
}