package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/CastelvaniaOgmo.oel", "assets/data/CastelvaniaOgmo.oel");
			type.set ("assets/data/CastelvaniaOgmo.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/CastelvaniaOgmo.oep", "assets/data/CastelvaniaOgmo.oep");
			type.set ("assets/data/CastelvaniaOgmo.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/animations.png", "assets/images/animations.png");
			type.set ("assets/images/animations.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Arco.png", "assets/images/Arco.png");
			type.set ("assets/images/Arco.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bossCastelvania.png", "assets/images/bossCastelvania.png");
			type.set ("assets/images/bossCastelvania.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ChicoNaranja.png", "assets/images/ChicoNaranja.png");
			type.set ("assets/images/ChicoNaranja.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ChicoRojo.png", "assets/images/ChicoRojo.png");
			type.set ("assets/images/ChicoRojo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ChicoVerde.png", "assets/images/ChicoVerde.png");
			type.set ("assets/images/ChicoVerde.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ChicoVioleta.png", "assets/images/ChicoVioleta.png");
			type.set ("assets/images/ChicoVioleta.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Corazon.png", "assets/images/Corazon.png");
			type.set ("assets/images/Corazon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemigo1.png", "assets/images/enemigo1.png");
			type.set ("assets/images/enemigo1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemigo2.png", "assets/images/enemigo2.png");
			type.set ("assets/images/enemigo2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemigo3.png", "assets/images/enemigo3.png");
			type.set ("assets/images/enemigo3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Flcha.png", "assets/images/Flcha.png");
			type.set ("assets/images/Flcha.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/FlechaRetroseso.png", "assets/images/FlechaRetroseso.png");
			type.set ("assets/images/FlechaRetroseso.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/GrandeNaranja.png", "assets/images/GrandeNaranja.png");
			type.set ("assets/images/GrandeNaranja.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/GrandeRojo.png", "assets/images/GrandeRojo.png");
			type.set ("assets/images/GrandeRojo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/GrandeVerde.png", "assets/images/GrandeVerde.png");
			type.set ("assets/images/GrandeVerde.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/GrandeVioleta.png", "assets/images/GrandeVioleta.png");
			type.set ("assets/images/GrandeVioleta.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Hacha.png", "assets/images/Hacha.png");
			type.set ("assets/images/Hacha.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/HachaChica.png", "assets/images/HachaChica.png");
			type.set ("assets/images/HachaChica.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/jugador.png", "assets/images/jugador.png");
			type.set ("assets/images/jugador.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/MedianoNaranja.png", "assets/images/MedianoNaranja.png");
			type.set ("assets/images/MedianoNaranja.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/MedianoRojo.png", "assets/images/MedianoRojo.png");
			type.set ("assets/images/MedianoRojo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/MedianoVerde.png", "assets/images/MedianoVerde.png");
			type.set ("assets/images/MedianoVerde.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/MedianoVioleta.png", "assets/images/MedianoVioleta.png");
			type.set ("assets/images/MedianoVioleta.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Municion.png", "assets/images/Municion.png");
			type.set ("assets/images/Municion.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Naranja.png", "assets/images/Naranja.png");
			type.set ("assets/images/Naranja.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Pinchos.png", "assets/images/Pinchos.png");
			type.set ("assets/images/Pinchos.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Reloj.png", "assets/images/Reloj.png");
			type.set ("assets/images/Reloj.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Rojo.png", "assets/images/Rojo.png");
			type.set ("assets/images/Rojo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tilesCastelvania.png", "assets/images/tilesCastelvania.png");
			type.set ("assets/images/tilesCastelvania.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Verde.png", "assets/images/Verde.png");
			type.set ("assets/images/Verde.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Violeta.png", "assets/images/Violeta.png");
			type.set ("assets/images/Violeta.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/VampireKiller.wav", "assets/music/VampireKiller.wav");
			type.set ("assets/music/VampireKiller.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
