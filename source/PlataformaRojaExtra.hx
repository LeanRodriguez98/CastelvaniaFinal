package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Theo leyenda
 */
class PlataformaRojaExtra extends FlxSprite 
{
	private var timer:Int = 0;
	private var habilitarMov:Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
	}
		override public function update(elapsed:Float):Void
	{
		getHabilitarMov();
		if (y >= 448)
		{
			y = 448;
		}
		if (y <= 352)
		{
			y = 352;
		}
		if (habilitarMov)
		{			
			y = y - 1;			
		}
		else
		{
			y = y + 1;			
		}
		
		immovable = true;
	}
	public function getHabilitarMov():Bool
	{
		return habilitarMov;
	}
	public function setHabilitarMov(a:Bool):Void
	{
		habilitarMov = a;
	}
}