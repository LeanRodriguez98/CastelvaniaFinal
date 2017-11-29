package;

import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Theo leyenda
 */
class Murcielago extends Enemigo 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.enemigo1__png, true, 32, 32);
		animation.add("volar", [0, 1], 8, true);
		animation.play("volar");
		
		width = 28;
		height = 18;
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