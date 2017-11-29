package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
/**
 * ...
 * @author ...
 */
class Menu extends FlxState 
{
	var texto:FlxText;
	
	override public function create():Void
	{
		texto = new FlxText (30, 20, 0, "Truchi-vania", 25);
		texto.color = 0xff0000;
		add (texto);
		texto = new FlxText (0, 60, 0, "Hecho por:", 14);		
		texto.color = 0xff0000;
		add(texto);
		texto = new FlxText (0, 80, 0, "Leandro Rodriguez", 14);
		texto.color = 0xff0000;
		add(texto);
		texto = new FlxText (0, 100, 0, "Theo Leyenda", 14);
		texto.color = 0xff0000;
		add(texto);
		
		texto = new FlxText (40, 120, 0, "Dale un cabezazo a", 14);
		texto.color = 0xff0000;
		add(texto);
		
		texto = new FlxText (40, 135, 0, "Z para comenzar", 14);
		texto.color = 0xff0000;
		add(texto);
		
		
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.Z)
			FlxG.switchState(new PlayState());
	}
	
}