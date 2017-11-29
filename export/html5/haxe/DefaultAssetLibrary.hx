package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/CastelvaniaOgmo.oel", __ASSET__assets_data_castelvaniaogmo_oel);
		type.set ("assets/data/CastelvaniaOgmo.oel", AssetType.TEXT);
		className.set ("assets/data/CastelvaniaOgmo.oep", __ASSET__assets_data_castelvaniaogmo_oep);
		type.set ("assets/data/CastelvaniaOgmo.oep", AssetType.TEXT);
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/images/animations.png", __ASSET__assets_images_animations_png);
		type.set ("assets/images/animations.png", AssetType.IMAGE);
		className.set ("assets/images/Arco.png", __ASSET__assets_images_arco_png);
		type.set ("assets/images/Arco.png", AssetType.IMAGE);
		className.set ("assets/images/ChicoNaranja.png", __ASSET__assets_images_chiconaranja_png);
		type.set ("assets/images/ChicoNaranja.png", AssetType.IMAGE);
		className.set ("assets/images/ChicoRojo.png", __ASSET__assets_images_chicorojo_png);
		type.set ("assets/images/ChicoRojo.png", AssetType.IMAGE);
		className.set ("assets/images/ChicoVerde.png", __ASSET__assets_images_chicoverde_png);
		type.set ("assets/images/ChicoVerde.png", AssetType.IMAGE);
		className.set ("assets/images/ChicoVioleta.png", __ASSET__assets_images_chicovioleta_png);
		type.set ("assets/images/ChicoVioleta.png", AssetType.IMAGE);
		className.set ("assets/images/Corazon.png", __ASSET__assets_images_corazon_png);
		type.set ("assets/images/Corazon.png", AssetType.IMAGE);
		className.set ("assets/images/enemigo1.png", __ASSET__assets_images_enemigo1_png);
		type.set ("assets/images/enemigo1.png", AssetType.IMAGE);
		className.set ("assets/images/enemigo2.png", __ASSET__assets_images_enemigo2_png);
		type.set ("assets/images/enemigo2.png", AssetType.IMAGE);
		className.set ("assets/images/enemigo3.png", __ASSET__assets_images_enemigo3_png);
		type.set ("assets/images/enemigo3.png", AssetType.IMAGE);
		className.set ("assets/images/Flcha.png", __ASSET__assets_images_flcha_png);
		type.set ("assets/images/Flcha.png", AssetType.IMAGE);
		className.set ("assets/images/GrandeNaranja.png", __ASSET__assets_images_grandenaranja_png);
		type.set ("assets/images/GrandeNaranja.png", AssetType.IMAGE);
		className.set ("assets/images/GrandeRojo.png", __ASSET__assets_images_granderojo_png);
		type.set ("assets/images/GrandeRojo.png", AssetType.IMAGE);
		className.set ("assets/images/GrandeVerde.png", __ASSET__assets_images_grandeverde_png);
		type.set ("assets/images/GrandeVerde.png", AssetType.IMAGE);
		className.set ("assets/images/GrandeVioleta.png", __ASSET__assets_images_grandevioleta_png);
		type.set ("assets/images/GrandeVioleta.png", AssetType.IMAGE);
		className.set ("assets/images/Hacha.png", __ASSET__assets_images_hacha_png);
		type.set ("assets/images/Hacha.png", AssetType.IMAGE);
		className.set ("assets/images/HachaChica.png", __ASSET__assets_images_hachachica_png);
		type.set ("assets/images/HachaChica.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/jugador.png", __ASSET__assets_images_jugador_png);
		type.set ("assets/images/jugador.png", AssetType.IMAGE);
		className.set ("assets/images/MedianoNaranja.png", __ASSET__assets_images_medianonaranja_png);
		type.set ("assets/images/MedianoNaranja.png", AssetType.IMAGE);
		className.set ("assets/images/MedianoRojo.png", __ASSET__assets_images_medianorojo_png);
		type.set ("assets/images/MedianoRojo.png", AssetType.IMAGE);
		className.set ("assets/images/MedianoVerde.png", __ASSET__assets_images_medianoverde_png);
		type.set ("assets/images/MedianoVerde.png", AssetType.IMAGE);
		className.set ("assets/images/MedianoVioleta.png", __ASSET__assets_images_medianovioleta_png);
		type.set ("assets/images/MedianoVioleta.png", AssetType.IMAGE);
		className.set ("assets/images/Municion.png", __ASSET__assets_images_municion_png);
		type.set ("assets/images/Municion.png", AssetType.IMAGE);
		className.set ("assets/images/Naranja.png", __ASSET__assets_images_naranja_png);
		type.set ("assets/images/Naranja.png", AssetType.IMAGE);
		className.set ("assets/images/Pinchos.png", __ASSET__assets_images_pinchos_png);
		type.set ("assets/images/Pinchos.png", AssetType.IMAGE);
		className.set ("assets/images/Reloj.png", __ASSET__assets_images_reloj_png);
		type.set ("assets/images/Reloj.png", AssetType.IMAGE);
		className.set ("assets/images/Rojo.png", __ASSET__assets_images_rojo_png);
		type.set ("assets/images/Rojo.png", AssetType.IMAGE);
		className.set ("assets/images/tilesCastelvania.png", __ASSET__assets_images_tilescastelvania_png);
		type.set ("assets/images/tilesCastelvania.png", AssetType.IMAGE);
		className.set ("assets/images/Verde.png", __ASSET__assets_images_verde_png);
		type.set ("assets/images/Verde.png", AssetType.IMAGE);
		className.set ("assets/images/Violeta.png", __ASSET__assets_images_violeta_png);
		type.set ("assets/images/Violeta.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/CastelvaniaOgmo.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/CastelvaniaOgmo.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/animations.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Arco.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ChicoNaranja.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ChicoRojo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ChicoVerde.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ChicoVioleta.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Corazon.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemigo1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemigo2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemigo3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Flcha.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/GrandeNaranja.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/GrandeRojo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/GrandeVerde.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/GrandeVioleta.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Hacha.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/HachaChica.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/jugador.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/MedianoNaranja.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/MedianoRojo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/MedianoVerde.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/MedianoVioleta.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Municion.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Naranja.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Pinchos.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Reloj.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Rojo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tilesCastelvania.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Verde.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Violeta.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/CastelvaniaOgmo.oel", __ASSET__assets_data_castelvaniaogmo_oel);
		type.set ("assets/data/CastelvaniaOgmo.oel", AssetType.TEXT);
		
		className.set ("assets/data/CastelvaniaOgmo.oep", __ASSET__assets_data_castelvaniaogmo_oep);
		type.set ("assets/data/CastelvaniaOgmo.oep", AssetType.TEXT);
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/animations.png", __ASSET__assets_images_animations_png);
		type.set ("assets/images/animations.png", AssetType.IMAGE);
		
		className.set ("assets/images/Arco.png", __ASSET__assets_images_arco_png);
		type.set ("assets/images/Arco.png", AssetType.IMAGE);
		
		className.set ("assets/images/ChicoNaranja.png", __ASSET__assets_images_chiconaranja_png);
		type.set ("assets/images/ChicoNaranja.png", AssetType.IMAGE);
		
		className.set ("assets/images/ChicoRojo.png", __ASSET__assets_images_chicorojo_png);
		type.set ("assets/images/ChicoRojo.png", AssetType.IMAGE);
		
		className.set ("assets/images/ChicoVerde.png", __ASSET__assets_images_chicoverde_png);
		type.set ("assets/images/ChicoVerde.png", AssetType.IMAGE);
		
		className.set ("assets/images/ChicoVioleta.png", __ASSET__assets_images_chicovioleta_png);
		type.set ("assets/images/ChicoVioleta.png", AssetType.IMAGE);
		
		className.set ("assets/images/Corazon.png", __ASSET__assets_images_corazon_png);
		type.set ("assets/images/Corazon.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemigo1.png", __ASSET__assets_images_enemigo1_png);
		type.set ("assets/images/enemigo1.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemigo2.png", __ASSET__assets_images_enemigo2_png);
		type.set ("assets/images/enemigo2.png", AssetType.IMAGE);
		
		className.set ("assets/images/enemigo3.png", __ASSET__assets_images_enemigo3_png);
		type.set ("assets/images/enemigo3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Flcha.png", __ASSET__assets_images_flcha_png);
		type.set ("assets/images/Flcha.png", AssetType.IMAGE);
		
		className.set ("assets/images/GrandeNaranja.png", __ASSET__assets_images_grandenaranja_png);
		type.set ("assets/images/GrandeNaranja.png", AssetType.IMAGE);
		
		className.set ("assets/images/GrandeRojo.png", __ASSET__assets_images_granderojo_png);
		type.set ("assets/images/GrandeRojo.png", AssetType.IMAGE);
		
		className.set ("assets/images/GrandeVerde.png", __ASSET__assets_images_grandeverde_png);
		type.set ("assets/images/GrandeVerde.png", AssetType.IMAGE);
		
		className.set ("assets/images/GrandeVioleta.png", __ASSET__assets_images_grandevioleta_png);
		type.set ("assets/images/GrandeVioleta.png", AssetType.IMAGE);
		
		className.set ("assets/images/Hacha.png", __ASSET__assets_images_hacha_png);
		type.set ("assets/images/Hacha.png", AssetType.IMAGE);
		
		className.set ("assets/images/HachaChica.png", __ASSET__assets_images_hachachica_png);
		type.set ("assets/images/HachaChica.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/jugador.png", __ASSET__assets_images_jugador_png);
		type.set ("assets/images/jugador.png", AssetType.IMAGE);
		
		className.set ("assets/images/MedianoNaranja.png", __ASSET__assets_images_medianonaranja_png);
		type.set ("assets/images/MedianoNaranja.png", AssetType.IMAGE);
		
		className.set ("assets/images/MedianoRojo.png", __ASSET__assets_images_medianorojo_png);
		type.set ("assets/images/MedianoRojo.png", AssetType.IMAGE);
		
		className.set ("assets/images/MedianoVerde.png", __ASSET__assets_images_medianoverde_png);
		type.set ("assets/images/MedianoVerde.png", AssetType.IMAGE);
		
		className.set ("assets/images/MedianoVioleta.png", __ASSET__assets_images_medianovioleta_png);
		type.set ("assets/images/MedianoVioleta.png", AssetType.IMAGE);
		
		className.set ("assets/images/Municion.png", __ASSET__assets_images_municion_png);
		type.set ("assets/images/Municion.png", AssetType.IMAGE);
		
		className.set ("assets/images/Naranja.png", __ASSET__assets_images_naranja_png);
		type.set ("assets/images/Naranja.png", AssetType.IMAGE);
		
		className.set ("assets/images/Pinchos.png", __ASSET__assets_images_pinchos_png);
		type.set ("assets/images/Pinchos.png", AssetType.IMAGE);
		
		className.set ("assets/images/Reloj.png", __ASSET__assets_images_reloj_png);
		type.set ("assets/images/Reloj.png", AssetType.IMAGE);
		
		className.set ("assets/images/Rojo.png", __ASSET__assets_images_rojo_png);
		type.set ("assets/images/Rojo.png", AssetType.IMAGE);
		
		className.set ("assets/images/tilesCastelvania.png", __ASSET__assets_images_tilescastelvania_png);
		type.set ("assets/images/tilesCastelvania.png", AssetType.IMAGE);
		
		className.set ("assets/images/Verde.png", __ASSET__assets_images_verde_png);
		type.set ("assets/images/Verde.png", AssetType.IMAGE);
		
		className.set ("assets/images/Violeta.png", __ASSET__assets_images_violeta_png);
		type.set ("assets/images/Violeta.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_castelvaniaogmo_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_castelvaniaogmo_oep extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_animations_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_arco_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_chiconaranja_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_chicorojo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_chicoverde_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_chicovioleta_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_corazon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemigo1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemigo2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemigo3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_flcha_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_grandenaranja_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_granderojo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_grandeverde_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_grandevioleta_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hacha_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hachachica_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_jugador_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_medianonaranja_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_medianorojo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_medianoverde_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_medianovioleta_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_municion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_naranja_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pinchos_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_reloj_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rojo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tilescastelvania_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_verde_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_violeta_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5







































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/CastelvaniaOgmo.oel") #if display private #end class __ASSET__assets_data_castelvaniaogmo_oel extends lime.utils.Bytes {}
@:file("assets/data/CastelvaniaOgmo.oep") #if display private #end class __ASSET__assets_data_castelvaniaogmo_oep extends lime.utils.Bytes {}
@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.Bytes {}
@:image("assets/images/animations.png") #if display private #end class __ASSET__assets_images_animations_png extends lime.graphics.Image {}
@:image("assets/images/Arco.png") #if display private #end class __ASSET__assets_images_arco_png extends lime.graphics.Image {}
@:image("assets/images/ChicoNaranja.png") #if display private #end class __ASSET__assets_images_chiconaranja_png extends lime.graphics.Image {}
@:image("assets/images/ChicoRojo.png") #if display private #end class __ASSET__assets_images_chicorojo_png extends lime.graphics.Image {}
@:image("assets/images/ChicoVerde.png") #if display private #end class __ASSET__assets_images_chicoverde_png extends lime.graphics.Image {}
@:image("assets/images/ChicoVioleta.png") #if display private #end class __ASSET__assets_images_chicovioleta_png extends lime.graphics.Image {}
@:image("assets/images/Corazon.png") #if display private #end class __ASSET__assets_images_corazon_png extends lime.graphics.Image {}
@:image("assets/images/enemigo1.png") #if display private #end class __ASSET__assets_images_enemigo1_png extends lime.graphics.Image {}
@:image("assets/images/enemigo2.png") #if display private #end class __ASSET__assets_images_enemigo2_png extends lime.graphics.Image {}
@:image("assets/images/enemigo3.png") #if display private #end class __ASSET__assets_images_enemigo3_png extends lime.graphics.Image {}
@:image("assets/images/Flcha.png") #if display private #end class __ASSET__assets_images_flcha_png extends lime.graphics.Image {}
@:image("assets/images/GrandeNaranja.png") #if display private #end class __ASSET__assets_images_grandenaranja_png extends lime.graphics.Image {}
@:image("assets/images/GrandeRojo.png") #if display private #end class __ASSET__assets_images_granderojo_png extends lime.graphics.Image {}
@:image("assets/images/GrandeVerde.png") #if display private #end class __ASSET__assets_images_grandeverde_png extends lime.graphics.Image {}
@:image("assets/images/GrandeVioleta.png") #if display private #end class __ASSET__assets_images_grandevioleta_png extends lime.graphics.Image {}
@:image("assets/images/Hacha.png") #if display private #end class __ASSET__assets_images_hacha_png extends lime.graphics.Image {}
@:image("assets/images/HachaChica.png") #if display private #end class __ASSET__assets_images_hachachica_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:image("assets/images/jugador.png") #if display private #end class __ASSET__assets_images_jugador_png extends lime.graphics.Image {}
@:image("assets/images/MedianoNaranja.png") #if display private #end class __ASSET__assets_images_medianonaranja_png extends lime.graphics.Image {}
@:image("assets/images/MedianoRojo.png") #if display private #end class __ASSET__assets_images_medianorojo_png extends lime.graphics.Image {}
@:image("assets/images/MedianoVerde.png") #if display private #end class __ASSET__assets_images_medianoverde_png extends lime.graphics.Image {}
@:image("assets/images/MedianoVioleta.png") #if display private #end class __ASSET__assets_images_medianovioleta_png extends lime.graphics.Image {}
@:image("assets/images/Municion.png") #if display private #end class __ASSET__assets_images_municion_png extends lime.graphics.Image {}
@:image("assets/images/Naranja.png") #if display private #end class __ASSET__assets_images_naranja_png extends lime.graphics.Image {}
@:image("assets/images/Pinchos.png") #if display private #end class __ASSET__assets_images_pinchos_png extends lime.graphics.Image {}
@:image("assets/images/Reloj.png") #if display private #end class __ASSET__assets_images_reloj_png extends lime.graphics.Image {}
@:image("assets/images/Rojo.png") #if display private #end class __ASSET__assets_images_rojo_png extends lime.graphics.Image {}
@:image("assets/images/tilesCastelvania.png") #if display private #end class __ASSET__assets_images_tilescastelvania_png extends lime.graphics.Image {}
@:image("assets/images/Verde.png") #if display private #end class __ASSET__assets_images_verde_png extends lime.graphics.Image {}
@:image("assets/images/Violeta.png") #if display private #end class __ASSET__assets_images_violeta_png extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end