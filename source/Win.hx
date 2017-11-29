package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxStrip;
import flixel.FlxSprite;
import flixel.text.FlxText;

import flixel.util.FlxColor;
/**
 * ...
 * @author G
 */
class Win extends FlxState 
{
	var texto:FlxText;
	

	override public function create():Void 
	{
		texto = new FlxText (40, 20, 0, "Ganaste pibe", 50);
		texto.color = 0xff0000;
		add (texto);
		
		texto = new FlxText (10, 100, 0, "Dale un cabezazo a", 14);
		texto.color = 0xff0000;
		add(texto);
		texto = new FlxText (10, 120, 0, "Z para reiniciar", 14);		
		texto.color = 0xff0000;
		add(texto);
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.Z)
			FlxG.switchState(new PlayState());
	}
}