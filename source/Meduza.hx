package;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Theo leyenda
 */
class Meduza extends Enemigo 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.enemigo2__png,true,32,32);
		animation.add("meduza", [0, 1, 0, 2], 8, true);
		animation.play("meduza");
		
		width = 26;
		height = 26;
		//centrar la caja de colicion en el medio de todo el sprite
		centerOrigin();
		centerOffsets();
		//--------------------------------------------------------
	}
	override public function update(elapsed:Float):Void
	{
		
		super.update(elapsed);
	}
}