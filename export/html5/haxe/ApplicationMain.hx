#if !macro


@:access(lime.app.Application)
@:access(lime.Assets)
@:access(openfl.display.Stage)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new openfl.display.Application ();
		app.create (config);
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		app.setPreloader (preloader);
		preloader.onComplete.add (init);
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/data/CastelvaniaOgmo.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/CastelvaniaOgmo.oep");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/animations.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Arco.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/ChicoNaranja.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/ChicoRojo.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/ChicoVerde.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/ChicoVioleta.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Corazon.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemigo1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemigo2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/enemigo3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Flcha.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/GrandeNaranja.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/GrandeRojo.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/GrandeVerde.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/GrandeVioleta.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Hacha.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/HachaChica.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/images-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/jugador.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/MedianoNaranja.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/MedianoRojo.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/MedianoVerde.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/MedianoVioleta.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Municion.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Naranja.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Pinchos.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Reloj.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Rojo.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/tilesCastelvania.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Verde.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/Violeta.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("flixel/sounds/beep.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("flixel/sounds/flixel.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("Nokia Cellphone FC Small");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Monsterrat");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("flixel/images/ui/button.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("flixel/images/logo/default.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		
		if (total == 0) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			build: "939",
			company: "...",
			file: "Castelvania-theo",
			fps: 60,
			name: "Castelvania-theo",
			orientation: "",
			packageName: "com.example.myapp",
			version: "0.0.1",
			windows: [
				
				{
					antialiasing: 0,
					background: 0,
					borderless: false,
					depthBuffer: false,
					display: 0,
					fullscreen: false,
					hardware: false,
					height: 240,
					parameters: "{}",
					resizable: false,
					stencilBuffer: true,
					title: "Castelvania-theo",
					vsync: true,
					width: 256,
					x: null,
					y: null
				},
			]
			
		};
		
		#if hxtelemetry
		var telemetry = new hxtelemetry.HxTelemetry.Config ();
		telemetry.allocations = true;
		telemetry.host = "localhost";
		telemetry.app_name = config.name;
		Reflect.setField (config, "telemetry", telemetry);
		#end
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 256, 240, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		#if !flash
		if (openfl.Lib.current.stage.window.fullscreen) {
			
			openfl.Lib.current.stage.dispatchEvent (new openfl.events.FullScreenEvent (openfl.events.FullScreenEvent.FULL_SCREEN, false, false, true, true));
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		#end
		
	}
	
	
	#if neko
	@:noCompletion @:dox(hide) public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end