package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.FlxObject;
import flixel.math.FlxRandom;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.ui.FlxBar;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	private var ItemVida:FlxSprite;
	private var GrupItemVida:FlxTypedGroup<FlxSprite>;
	private var personajetxt:FlxText;
	private var bosstxt:FlxText;
	private var municiontxt:FlxText;
	private var player:Jugador;
	private var barraVidaBoss:FlxBar;
	private var icon1:FlxSprite;
	private var icon2:FlxSprite;
	private var icon3:FlxSprite;
	private var SpawnerX:FlxRandom;
	private var SpawnerY:FlxRandom;
	private var Random:FlxRandom;
	private var Powerup1:PowerUp1;
	private var Powerup2:PowerUp2;
	private var Powerup3:PowerUp3;
	private var murcielago:Murcielago;
	private var Ratita:Raton;
	private var Meduska:Meduza;
	private var boss:Boss;

	private var GrupRatita:FlxTypedGroup<Raton>;
	private var GrupMurcielago:FlxTypedGroup<Murcielago>;
	private var GrupMeduza:FlxTypedGroup<Meduza>;
	private var GrupPichos:FlxTypedGroup<FlxSprite>;
	private var GrupPlataforma:FlxTypedGroup<FlxSprite>;
	private var GrupObstaculo2:FlxTypedGroup<FlxSprite>;
	private var ItemAtaqueEsp1:PowerUp1;
	private var ItemAtaqueEsp2:PowerUp2;
	private var ItemAtaqueEsp3:PowerUp3;
	private var ItemMunicion:FlxSprite;
	private var GrupMunicion:FlxTypedGroup<FlxSprite>;
	private var plataforma:FlxSprite;
	private var obstaculo2:FlxSprite;
	private var obstaculo3:FlxSprite;
	private var obstaculo4:FlxSprite;
	private var TimerDesaparecer:Int = 0;
	private var municion:Int = 0;

	var tilemap:FlxTilemap;
	private var vidaBoss:Int = 1000;

	private var VordeIzq:FlxSprite;
	private var VordeDer:FlxSprite;
	private var FollowRat:Bool = false;
	private var stopwatch:Bool = true;
	//-----------------------------------------------------------------------------

	private var pinchos:Pinchos;
	private var plataformaDesapareceNaranja:PlataformaDesapareceNaranja;
	private var plataformaDesapareceRoja:PlataformaDesapareceRoja;
	private var plataformaDesapareceVerde:PlataformaDesapareceVerde;
	private var plataformaDesapareceVioleta:PlataformaDesapareceVioleta;
	private var plataformaNaranja:PlataformaNaranja;
	private var plataformaRoja:PlataformaRoja;
	static public var plataformaVerde:PlataformaVerde;

	private var plataformaVioleta:PlataformaVioleta;
	private var transparenteVerde:TransparenteVerde;
	private var transparenteRoja:TransparenteRojo;
	private var transparenteNaranja:TransparenteNaranja;
	private var transparenteVioleta:TransparenteVioleta;
	private var GrupPlataformaDesapareceVioleta:FlxTypedGroup<FlxSprite>;
	private var GrupPlataformaDesapareceVerde:FlxTypedGroup<FlxSprite>;
	private var GrupPlataformaDesapareceRoja:FlxTypedGroup<FlxSprite>;
	private var GrupPlataformaDesapareceNaranja:FlxTypedGroup<FlxSprite>;
	private var GrupPlataformaRoja:FlxTypedGroup<FlxSprite>;
	private var GrupPlataformaNaranja:FlxTypedGroup<FlxSprite>;
	private var GrupPlataformaVerde:FlxTypedGroup<FlxSprite>;
	private var GrupPlataformaVioleta:FlxTypedGroup<FlxSprite>;
	private var GrupTransparenteNaranja:FlxTypedGroup<FlxSprite>;
	private var GrupTransparenteRojo:FlxTypedGroup<FlxSprite>;
	private var GrupTransparenteVerde:FlxTypedGroup<FlxSprite>;
	private var GrupTransparenteVioleta:FlxTypedGroup<FlxSprite>;
	private var Xmunicion:Int;
	private var Ymunicion:Int;
	private var Xvidas:Int;
	private var Yvidas:Int;
	private var XpowerUp1:Int;
	private var YpowerUp1:Int;
	private var XpowerUp2:Int;
	private var YpowerUp2:Int;
	private var XpowerUp3:Int;
	private var YpowerUp3:Int;
	private var GrupPowerUp1:FlxTypedGroup<PowerUp1>;
	private var GrupPowerUp2:FlxTypedGroup<PowerUp2>;
	private var GrupPowerUp3:FlxTypedGroup<PowerUp3>;
	private var plataformaRojaExtra:PlataformaRojaExtra;

	private var TimerDesaparecePlataforma:Int = 0;

	private var plataformaDesapareceVerde1:FlxSprite;
	private var plataformaDesapareceVerde2:FlxSprite;
	private var plataformaDesapareceNaranja1:FlxSprite;
	private var ActivaBossFight:FlxSprite;
	private var SoloEstaVez:Bool = true;
	private var flechaRetroseso1:FlechaRetroseso;
	private var flechaRetroseso2:FlechaRetroseso;
	private var flechaRetroseso3:FlechaRetroseso;
	private var dileyAtaqueEsp1:Int = 0;
	private var dileyAtaqueEsp2:Int = 0;
	private var dileyAtaqueEsp3:Int = 0;
	private var habDil1:Bool = false;
	private var habDil2:Bool = false;
	private var habDil3:Bool = false;
	var TimerParalisis:Int;
	var bossTimeSleep:Int = 0;
	var patron2Init:Bool = true;
	var FollowBat:Bool = false;
	var timerBat:Int = 0;
	var timerJellyfish:Int = 0;
	var FollowJellyfish:Bool = false;
	var direccionalBoss:Bool = true;
	var patron3Timer:Int = 0;
	var safeTime = false;
	var safeTimeTimer:Int = 0;
	var BossFightStart:Bool = false;
	private var plataformaVioletaBoss1:PlataformasVioletasBoss;
	private var plataformaVioletaBoss2:PlataformasVioletasBoss;
	private var plataformaVioletaBoss3:PlataformasVioletasBoss;
	private var plataformaVioletaBoss4:PlataformasVioletasBoss;
	private var plataformaVioletaBoss5:PlataformasVioletasBoss;
	private var plataformaVioletaBoss6:PlataformasVioletasBoss;
	private var plataformaVioletaBoss7:PlataformasVioletasBoss;
	private var plataformaVioletaBoss8:PlataformasVioletasBoss;
	private var plataformaVioletaBoss9:PlataformasVioletasBoss;
	private var plataformaVioletaBoss10:PlataformasVioletasBoss;
	private var plataformaVioletaBoss11:PlataformasVioletasBoss;
	private var plataformaVioletaBoss12:PlataformasVioletasBoss;
	private var plataformaVioletaBoss13:PlataformasVioletasBoss;
	private var plataformaVioletaBoss14:PlataformasVioletasBoss;
	private var plataformaVioletaBoss15:PlataformasVioletasBoss;
	private var plataformaVioletaBoss16:PlataformasVioletasBoss;
	private var plataformaVioletaBoss17:PlataformasVioletasBoss;
	private var plataformaVioletaBoss18:PlataformasVioletasBoss;
	private var plataformaVioletaBoss19:PlataformasVioletasBoss;
	private var plataformaVioletaBoss20:PlataformasVioletasBoss;
	private var plataformaVioletaBoss21:PlataformasVioletasBoss;
	private var plataformaVioletaBoss22:PlataformasVioletasBoss;
	private var plataformaVioletaBoss23:PlataformasVioletasBoss;
	private var plataformaVioletaBoss24:PlataformasVioletasBoss;
	private var plataformaVioletaBoss25:PlataformasVioletasBoss;
	private var plataformaVioletaBoss26:PlataformasVioletasBoss;
	private var plataformaVioletaBoss27:PlataformasVioletasBoss;
	private var plataformaVioletaBoss28:PlataformasVioletasBoss;
	private var plataformaVioletaBoss29:PlataformasVioletasBoss;
	private var plataformaVioletaBoss30:PlataformasVioletasBoss;
	private var plataformaVioletaBoss31:PlataformasVioletasBoss;
	private var plataformaVioletaBoss32:PlataformasVioletasBoss;
	private var plataformaVioletaBoss33:PlataformasVioletasBoss;
	private var bloqueCae1:BloqueCae;
	private var bloqueCae2:BloqueCae;
	private var bloqueCae3:BloqueCae;

	var GrupPlataformaVioletaBoss:FlxTypedGroup<PlataformasVioletasBoss>;
	var cerradura:Bool = false;
	var GrupBloqueCae:FlxTypedGroup<BloqueCae>;
	var boolBloqueCae:Bool = false;
	var boolBloqueCaeReutrn:Bool = false;
	var boolBloqueCae2:Bool = false;
	var boolBloqueCaeReutrn2:Bool = false;
	var boolBloqueCae3:Bool = false;
	var boolBloqueCaeReutrn3:Bool = false;
	var boolBarraVidaBoss = true;
	private var barraVidaPersonaje:FlxBar;
	var inicio:Bool = true;
	var texto:FlxText;
	var icon1bool:Bool = false;
	var icon2bool:Bool = false;
	var icon3bool:Bool = false;

	override public function create():Void
	{

		super.create();
		municion = Reg.RegMunicion;
		SpawnerX = new FlxRandom();
		SpawnerY = new FlxRandom();
		Random = new FlxRandom();
		FlxG.worldBounds.width = 1792;
		FlxG.worldBounds.height = 960;
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.CastelvaniaOgmo__oel);
		tilemap = loader.loadTilemap(AssetPaths.tilesCastelvania__png, 32, 32, "tiles");
		//tilemap.setTileProperties
		tilemap.setTileProperties(0, FlxObject.NONE);
		player = new Jugador(FlxG.width / 2 + 50, 200);
		flechaRetroseso1 = new FlechaRetroseso(1376, 474);
		flechaRetroseso1.immovable = true;
		add(flechaRetroseso1);
		flechaRetroseso2 = new FlechaRetroseso(704, 474);
		flechaRetroseso2.immovable = true;
		add(flechaRetroseso2);
		flechaRetroseso3 = new FlechaRetroseso(416, 474);
		flechaRetroseso3.immovable = true;
		add(flechaRetroseso3);
		ActivaBossFight = new FlxSprite(1600, 64);
		ActivaBossFight.makeGraphic(32, 192, 0x00000000);
		Ratita = new Raton();
		murcielago = new Murcielago();
		Meduska = new Meduza();
		boss = new Boss(150, 50);
		GrupBloqueCae = new FlxTypedGroup<BloqueCae>();
		bloqueCae1 = new BloqueCae(192, 512);
		GrupBloqueCae.add(bloqueCae1);
		bloqueCae2 = new BloqueCae(736, 512);
		GrupBloqueCae.add(bloqueCae2);
		bloqueCae3 = new BloqueCae(1088,512);
		GrupBloqueCae.add(bloqueCae3);
		transparenteVerde = new TransparenteVerde();
		transparenteNaranja = new TransparenteNaranja();
		transparenteRoja = new TransparenteRojo();
		plataformaVerde = new PlataformaVerde();
		plataformaNaranja = new PlataformaNaranja(32,672,AssetPaths.Naranja__png);
		plataformaRoja = new PlataformaRoja(1728, 448, AssetPaths.Rojo__png);
		plataformaRojaExtra = new PlataformaRojaExtra(1088, 448, AssetPaths.Rojo__png);
		GrupMeduza = new FlxTypedGroup<Meduza>();
		GrupMurcielago = new FlxTypedGroup<Murcielago>();
		GrupRatita = new FlxTypedGroup<Raton>();
		GrupPlataforma = new FlxTypedGroup<FlxSprite>();

		GrupPichos = new FlxTypedGroup<FlxSprite>();
		GrupPlataformaDesapareceNaranja = new FlxTypedGroup<FlxSprite>();
		GrupPlataformaDesapareceRoja = new FlxTypedGroup<FlxSprite>();
		GrupPlataformaDesapareceVerde = new FlxTypedGroup<FlxSprite>();
		GrupPlataformaDesapareceVioleta = new FlxTypedGroup<FlxSprite>();
		GrupPlataformaNaranja = new FlxTypedGroup<FlxSprite>();
		GrupPlataformaVerde = new FlxTypedGroup<FlxSprite>();
		GrupPlataformaRoja = new FlxTypedGroup<FlxSprite>();
		GrupPlataformaVioleta = new FlxTypedGroup<FlxSprite>();
		GrupTransparenteNaranja = new FlxTypedGroup<FlxSprite>();
		GrupTransparenteVerde = new FlxTypedGroup<FlxSprite>();
		GrupTransparenteRojo = new FlxTypedGroup<FlxSprite>();
		GrupTransparenteVioleta = new FlxTypedGroup<FlxSprite>();

		GrupMunicion = new FlxTypedGroup<FlxSprite>();
		GrupItemVida = new FlxTypedGroup<FlxSprite>();

		//Te olvidaste los new Lean :)
		GrupPowerUp1 = new FlxTypedGroup<PowerUp1>();
		GrupPowerUp2 = new FlxTypedGroup<PowerUp2>();
		GrupPowerUp3 = new FlxTypedGroup<PowerUp3>();
		GrupPlataformaVioletaBoss = new FlxTypedGroup<PlataformasVioletasBoss>();
		//--------------------------------------------------h

		plataformaVioletaBoss1 = new PlataformasVioletasBoss(1664, 224);
		//GrupPlataformaVioletaBoss.add(plataformaVioletaBoss1);

		plataformaVioletaBoss2 = new PlataformasVioletasBoss(1664, 192);
		//GrupPlataformaVioletaBoss.add(plataformaVioletaBoss2);

		plataformaVioletaBoss3 = new PlataformasVioletasBoss(1504, 192);
		plataformaVioletaBoss3.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss3);

		plataformaVioletaBoss4 = new PlataformasVioletasBoss(1334, 192);
		plataformaVioletaBoss4.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss4);

		plataformaVioletaBoss5 = new PlataformasVioletasBoss(1120, 192);
		plataformaVioletaBoss5.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss5);

		plataformaVioletaBoss6 = new PlataformasVioletasBoss(928, 192);
		plataformaVioletaBoss6.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss6);

		plataformaVioletaBoss7 = new PlataformasVioletasBoss(672, 192);
		plataformaVioletaBoss7.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss7);

		plataformaVioletaBoss8 = new PlataformasVioletasBoss(512, 192);
		plataformaVioletaBoss8.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss8);

		plataformaVioletaBoss9 = new PlataformasVioletasBoss(348, 192);
		plataformaVioletaBoss9.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss9);

		plataformaVioletaBoss10 = new PlataformasVioletasBoss(224, 128);
		plataformaVioletaBoss10.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss10);

		plataformaVioletaBoss11 = new PlataformasVioletasBoss(96, 128);
		plataformaVioletaBoss11.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss11);

		plataformaVioletaBoss12 = new PlataformasVioletasBoss(1664, 128);
		//GrupPlataformaVioletaBoss.add(plataformaVioletaBoss12);

		plataformaVioletaBoss13 = new PlataformasVioletasBoss(1504, 128);
		plataformaVioletaBoss13.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss13);

		plataformaVioletaBoss14 = new PlataformasVioletasBoss(1440, 128);
		plataformaVioletaBoss14.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss14);

		plataformaVioletaBoss15 = new PlataformasVioletasBoss(1184, 128);
		plataformaVioletaBoss15.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss15);

		plataformaVioletaBoss16 = new PlataformasVioletasBoss(1024, 128);
		plataformaVioletaBoss16.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss16);

		plataformaVioletaBoss17 = new PlataformasVioletasBoss(960, 128);
		plataformaVioletaBoss17.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss17);

		plataformaVioletaBoss18 = new PlataformasVioletasBoss(768, 128);
		plataformaVioletaBoss18.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss18);

		plataformaVioletaBoss19 = new PlataformasVioletasBoss(640, 128);
		plataformaVioletaBoss19.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss19);

		plataformaVioletaBoss20 = new PlataformasVioletasBoss(544, 128);
		plataformaVioletaBoss20.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss20);

		plataformaVioletaBoss21 = new PlataformasVioletasBoss(384, 128);
		plataformaVioletaBoss21.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss21);

		plataformaVioletaBoss22 = new PlataformasVioletasBoss(224, 128);
		plataformaVioletaBoss22.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss22);

		plataformaVioletaBoss23 = new PlataformasVioletasBoss(1664, 160);
		//GrupPlataformaVioletaBoss.add(plataformaVioletaBoss23);

		plataformaVioletaBoss24 = new PlataformasVioletasBoss(1664, 128);
		//GrupPlataformaVioletaBoss.add(plataformaVioletaBoss24);

		plataformaVioletaBoss25 = new PlataformasVioletasBoss(1664, 96);
		//GrupPlataformaVioletaBoss.add(plataformaVioletaBoss25);

		plataformaVioletaBoss26 = new PlataformasVioletasBoss(1664, 64);
		//GrupPlataformaVioletaBoss.add(plataformaVioletaBoss26);
		/*
		plataformaVioletaBoss27 = new PlataformasVioletasBoss(1728, 128);
		plataformaVioletaBoss27.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss27);

		plataformaVioletaBoss28 = new PlataformasVioletasBoss(1728, 128);
		plataformaVioletaBoss28.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss28);

		plataformaVioletaBoss29 = new PlataformasVioletasBoss(1728, 128);
		plataformaVioletaBoss29.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss29);

		plataformaVioletaBoss30 = new PlataformasVioletasBoss(1728, 128);
		plataformaVioletaBoss30.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss30);

		plataformaVioletaBoss31 = new PlataformasVioletasBoss(1728, 128);
		plataformaVioletaBoss31.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss31);

		plataformaVioletaBoss32 = new PlataformasVioletasBoss(1728, 128);
		plataformaVioletaBoss32.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss32);

		plataformaVioletaBoss33 = new PlataformasVioletasBoss(1728, 128);
		plataformaVioletaBoss33.immovable = true;
		GrupPlataformaVioletaBoss.add(plataformaVioletaBoss33);
		*/

		//for (j in 0...GrupPlataformaVioletaBoss.length)
		//{
		//	GrupPlataformaVioletaBoss[j].immovable = true;
		//}

		//GrupItemAtaqueEsp1 = new FlxTypedGroup<FlxSprite>();

		//GrupItemAtaqueEsp2 = new FlxTypedGroup<FlxSprite>();

		//GrupItemAtaqueEsp3 = new FlxTypedGroup<FlxSprite>();

		/*ItemAtaqueEsp1 = new FlxSprite(50,900);// falta agregar al mapa con cordenada x, y

		ItemAtaqueEsp2 = new FlxSprite();// falta agregar al mapa con cordenada x, y

		ItemAtaqueEsp3 = new FlxSprite();// falta agregar al mapa con cordenada x, y*/

		for (i in 0...50)//graduo la cantidad de items que se generan de municion
		{
			ItemMunicion = new FlxSprite();
			ItemMunicion.loadGraphic(AssetPaths.Municion__png);
			GrupMunicion.add(ItemMunicion);
		}

		for (i in 0...50)
		{
			ItemVida = new FlxSprite();
			ItemVida.loadGraphic(AssetPaths.Corazon__png);
			GrupItemVida.add(ItemVida);
		}

		for (i in 0...5)
		{
			ItemAtaqueEsp1 = new PowerUp1();
			GrupPowerUp1.add(ItemAtaqueEsp1);

		}
		for (i in 0...5)
		{
			ItemAtaqueEsp2 = new PowerUp2();
			GrupPowerUp2.add(ItemAtaqueEsp2);

		}
		for (i in 0...5)
		{
			ItemAtaqueEsp3 = new PowerUp3();
			GrupPowerUp3.add(ItemAtaqueEsp3);

		}
		loader.loadEntities(placeEntites, "entities");
		icon1 = new FlxSprite(-500,-500,AssetPaths.Arco__png);
		icon2 = new FlxSprite(-500,-500,AssetPaths.Hacha__png);
		icon3 = new FlxSprite(-500,-500,AssetPaths.Reloj__png);
		//player.x = 1700;
		//player.y = 400;
		bloqueCae1.immovable = true;
		bloqueCae2.immovable = true;
		bloqueCae3.immovable = true;
		

		barraVidaBoss = new FlxBar(100, 960, LEFT_TO_RIGHT, 150, 8, this, "vidaBoss", 0, 100);
		barraVidaPersonaje = new FlxBar(100, 970, LEFT_TO_RIGHT, 100, 8, player, "vida",0, 100);
		personajetxt = new FlxText(50, 970, 0, "Player: ", 5, false);
		bosstxt = new FlxText(50, 970, 0, "Boss: ", 5, false);
	//	municiontxt = new FlxText(50, 970, "Municion: " + player.getMunicion(), 5, false);
		add(GrupRatita);
		add(GrupMurcielago);
		add(GrupMeduza);

		add(GrupPichos);

		add(player);

		FlxG.camera.follow(player);
		FlxG.sound.playMusic(AssetPaths.VampireKiller__wav);

		CrearMunicion();
		CrearVidas();
		CrearPowerUp1();
		CrearPowerUp2();
		CrearPowerUp3();
		add(tilemap);
		add(plataformaVerde);
		add(plataformaRoja);
		add(plataformaNaranja);
		add(plataformaRojaExtra);
		add(GrupTransparenteNaranja);
		add(GrupTransparenteRojo);
		add(GrupTransparenteVerde);
		add(GrupPlataformaDesapareceNaranja);
		add(GrupPlataformaDesapareceRoja);
		add(GrupPlataformaDesapareceVerde);
		add(ActivaBossFight);
		add(boss);
		add(GrupBloqueCae);
		add(barraVidaPersonaje);
		add(personajetxt);
		add(municiontxt);
		add(GrupMunicion);
		add(icon1);
		add(icon2);
		add(icon3);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (FlxG.collide(player, flechaRetroseso1) || FlxG.collide(player, flechaRetroseso2) || FlxG.collide(player, flechaRetroseso3))
		{
			player.x -= 60;
		}
		if (player.getEstaParalizado())
		{
			TimerParalisis += 1;
		}
		else
		{
			TimerParalisis = 0;
		}
		if (safeTime == true)
		{
			safeTimeTimer += 1;
		}
		if (safeTimeTimer >= 50)
		{
			safeTime = false;
			safeTimeTimer = 0;
		}
		timerBat += 1;

		if (player.getMunicion() > 0)
		{
			if (FlxG.keys.pressed.K)
			{
				if (player.getEstaParalizado())
				{
					stopwatch = false;
					if (TimerParalisis > 30)
					{
						stopwatch = true;
						TimerParalisis = 0;
					}
				}

			}
		}
		TimerDesaparecePlataforma++;
		timerJellyfish += 1;
		patron3Timer += 1;
		if (patron3Timer > 400)
		{
			patron3Timer = 0;
		}
		if (player.vida < 100)
		{
			for (i in 0...GrupItemVida.length)
			{
				if (FlxG.overlap(player, GrupItemVida.members[i]))
				{
					GrupItemVida.members[i].kill();
					player.SumarVida(5);
				}
			}
		}
		if (SoloEstaVez)
		{
			if (TimerDesaparecePlataforma == 100)
			{
				GrupPlataformaDesapareceVerde.destroy();
				GrupPlataformaDesapareceNaranja.destroy();
				GrupPlataformaDesapareceRoja.destroy();

				plataformaDesapareceNaranja1 = new FlxSprite(832, 608);
				plataformaDesapareceVerde1 = new FlxSprite(1216, 864);
				plataformaDesapareceVerde2 = new FlxSprite(1248, 864);

				plataformaDesapareceNaranja1.loadGraphic(AssetPaths.Naranja__png);
				plataformaDesapareceVerde1.loadGraphic(AssetPaths.Verde__png);
				plataformaDesapareceVerde2.loadGraphic(AssetPaths.Verde__png);

				plataformaDesapareceNaranja1.immovable = true;
				plataformaDesapareceVerde1.immovable = true;
				plataformaDesapareceVerde2.immovable = true;

				add(plataformaDesapareceNaranja1);
				add(plataformaDesapareceVerde1);
				add(plataformaDesapareceVerde2);
				SoloEstaVez = false;
			}
			if (TimerDesaparecePlataforma == 175)
			{
				TimerDesaparecePlataforma = 0;
			}
		}
		if (FlxG.collide(player, ActivaBossFight))
		{
			BossFightStart = true;
			ActivaBossFight.kill();
			add(GrupPlataformaVioletaBoss);
			cerradura = true;

		}
		if (cerradura == true)
		{
			plataformaVioletaBoss1.immovable = true;
			add(plataformaVioletaBoss1);
			FlxG.collide(player, plataformaVioletaBoss1);
			plataformaVioletaBoss2.immovable = true;
			add(plataformaVioletaBoss2);
			FlxG.collide(player, plataformaVioletaBoss2);
			plataformaVioletaBoss12.immovable = true;
			add(plataformaVioletaBoss12);
			FlxG.collide(player, plataformaVioletaBoss12);
			plataformaVioletaBoss23.immovable = true;
			add(plataformaVioletaBoss23);
			FlxG.collide(player, plataformaVioletaBoss23);
			plataformaVioletaBoss24.immovable = true;
			add(plataformaVioletaBoss24);
			FlxG.collide(player, plataformaVioletaBoss24);
			plataformaVioletaBoss25.immovable = true;
			add(plataformaVioletaBoss25);
			FlxG.collide(player, plataformaVioletaBoss25);
			plataformaVioletaBoss26.immovable = true;
			add(plataformaVioletaBoss26);
			FlxG.collide(player, plataformaVioletaBoss26);

		}
		/*if (TimerDesaparecer == 100)
		{
			obstaculo4.destroy();
		}
		if (TimerDesaparecer == 175)
		{
			obstaculo4 = new FlxSprite(80, 190);
			obstaculo4.makeGraphic(20, 20, 0xff0000ff);
			obstaculo4.immovable = true;
			add(obstaculo4);
			TimerDesaparecer = 0;
		}*/
		else
		{
			if (TimerDesaparecePlataforma == 100)
			{
				plataformaDesapareceNaranja1.kill();
				plataformaDesapareceVerde1.kill();
				plataformaDesapareceVerde2.kill();
			}
			if (TimerDesaparecePlataforma==175)
			{
				plataformaDesapareceNaranja1.reset(832, 608);
				plataformaDesapareceVerde1.reset(1216, 864);
				plataformaDesapareceVerde2.reset(1248, 864);

				plataformaDesapareceNaranja1.loadGraphic(AssetPaths.Naranja__png);
				plataformaDesapareceVerde1.loadGraphic(AssetPaths.Verde__png);
				plataformaDesapareceVerde2.loadGraphic(AssetPaths.Verde__png);

				plataformaDesapareceNaranja1.immovable = true;
				plataformaDesapareceVerde1.immovable = true;
				plataformaDesapareceVerde2.immovable = true;
				TimerDesaparecePlataforma = 0;
			}
		}
		FlxG.collide(player, plataformaDesapareceVerde1);
		FlxG.collide(player, plataformaDesapareceVerde2);
		FlxG.collide(player, plataformaDesapareceNaranja1);
		//showbars();

		barraVidaBoss.x = player.x - 90;
		barraVidaBoss.y = player.y + 120;
		barraVidaPersonaje.x = player.x - 90;
		barraVidaPersonaje.y = player.y + 130;
		personajetxt.x = player.x - 120;
		personajetxt.y = player.y + 130;
		bosstxt.x = player.x - 120;
		bosstxt.y = player.y + 120;
		//municiontxt.x = player.x + 10;
		//municiontxt.y = player.y + 130;
		if (icon1bool)
		{
			icon1.x = player.x + 120;
			icon1.y = player.y + 120;
		}
		else
		{
			icon1.x = -500;
			icon1.y = -500;
		}
		if (icon2bool)
		{
			icon2.x = player.x + 120;
			icon2.y = player.y + 120;
		}
		else
		{
			icon2.x = -500;
			icon2.y = -500;

		}
		if (icon3bool)
		{
			icon3.x = player.x + 120;
			icon3.y = player.y + 120;
		}
		else
		{
			icon3.x = -500;
			icon3.y = -500;
		}
		if (player.vida <= 0)
		{
			player.kill();
			FlxG.switchState(new GG());

		}
		if (player.velocity.x > 0)
		{
			player.facing = FlxObject.RIGHT;
		}
		if (player.velocity.x < 0)
		{
			player.facing = FlxObject.LEFT;
		}
		//activador de movimiento de la plataforma verde
		if (FlxG.overlap(player, plataformaVerde))
		{
			plataformaVerde.setHabilitarMov(true);
		}
		if (FlxG.overlap(player, plataformaVerde) == false)
		{
			plataformaVerde.setHabilitarMov(false);
		}
		//activador de movimientos de la plataforma roja
		if (FlxG.overlap(player, plataformaRoja))
		{
			plataformaRoja.setHabilitarMov(true);
		}
		if (FlxG.overlap(player, plataformaRoja) == false)
		{
			plataformaRoja.setHabilitarMov(false);
		}

		if (FlxG.overlap(player, plataformaRojaExtra))
		{
			plataformaRojaExtra.setHabilitarMov(true);
		}
		if (FlxG.overlap(player, plataformaRojaExtra) == false)
		{
			plataformaRojaExtra.setHabilitarMov(false);
		}
		//activador de movimientos de la plataforma naranja
		if (FlxG.overlap(player, plataformaNaranja))
		{
			plataformaNaranja.setHabilitarMov(true);
		}
		if (FlxG.overlap(player, plataformaNaranja) == false)
		{
			plataformaNaranja.setHabilitarMov(false);
		}

		//MOVIMIENTO DE DOS OBJETOS EN EL VORDE DE LA CAMARA
		//VordeIzq.x = player.x - 123;
		//VordeIzq.y = player.y - 100;
		//---------------------------------------------------------
		TimerDesaparecer++;

		
		for (i in 0...GrupRatita.length)
		{
			if (GrupRatita.members[i].x > player.x)
			{
				GrupRatita.members[i].facing = FlxObject.RIGHT;
			}
			else
			{
				GrupRatita.members[i].facing = FlxObject.LEFT;
			}
		}
		for (i in 0...GrupRatita.length)
		{
			if (player.x - GrupRatita.members[i].x <= 120 && player.x - GrupRatita.members[i].x >= -120 )
			{
				FollowRat = true;

			}
			if (FollowRat)
			{
				FlxTween.tween(GrupRatita.members[i], {x:player.x, y:GrupRatita.members[i].y}, 1, {type:FlxTween.ONESHOT});
				GrupRatita.members[i].y = GrupRatita.members[i].y;
			}
			FollowRat = false;
		}

		for (i in 0...GrupRatita.length)
		{
			if (player.x < GrupRatita.members[i].x)
			{
				for (j	in 0...GrupRatita.length)
				{
					GrupRatita.members[i].flipX = false;
				}
			}
			if (player.x > GrupRatita.members[i].x)
			{
				for (j	in 0...GrupRatita.length)
				{
					GrupRatita.members[i].flipX = true;

				}
			}
		}

		for (j in 0...GrupMurcielago.length)
		{
			if (timerBat > 0 && timerBat <= 70)
			{
				GrupMurcielago.members[j].y += 1;
			}
			if (timerBat > 70 && timerBat <= 140)
			{
				GrupMurcielago.members[j].x -= 1;
			}
			if (timerBat > 140 && timerBat <= 210)
			{
				GrupMurcielago.members[j].y -= 1;
			}
			if (timerBat > 210 && timerBat <= 280)
			{
				GrupMurcielago.members[j].x += 1;
			}
		}

		if (timerBat > 280)
		{
			timerBat = 0;
		}

		for (k	in 0...GrupMeduza.length)
		{
			if (player.x - GrupMeduza.members[k].x <= 120 && player.x - GrupMeduza.members[k].x >= -120 )
			{
				FollowJellyfish = true;
			}

			if (FollowJellyfish)
			{
				if (timerJellyfish < 140)
				{
					GrupMeduza.members[k].y += 1;
				}
				if (timerJellyfish >= 140)
				{
					GrupMeduza.members[k].y -= 1;
				}
				if (timerJellyfish == 280)
				{
					timerJellyfish = 0;
				}
			}
		}
	
		if (player.y > 512 && player.y < 750)
		{
			if ( player.x - bloqueCae1.x   <= 16 && player.x - bloqueCae1.x  >= -16)
			{
				boolBloqueCae = true;
			}
			if (boolBloqueCae == true)
			{
				bloqueCae1.y += 3;
				if (FlxG.collide(player, bloqueCae1))
				{
					player.kill();
					FlxG.switchState(new GG());

				}
			}
			if (bloqueCae1.y >= 672)
			{

				boolBloqueCae == false;
				boolBloqueCaeReutrn = true;
			}
			if (boolBloqueCaeReutrn == true)
			{
				bloqueCae1.y -= 4;

			}
			if ( bloqueCae1.y <= 512)
			{
				boolBloqueCaeReutrn = false;
				boolBloqueCae = false;
			}

			if ( player.x - bloqueCae2.x   <= 16 && player.x - bloqueCae2.x  >= -16)
			{
				boolBloqueCae2 = true;
			}
			if (boolBloqueCae2 == true)
			{
				bloqueCae2.y += 3;
				if (FlxG.collide(player, bloqueCae2))
				{
					player.kill();
					FlxG.switchState(new GG());

				}
			}
			if (bloqueCae2.y >= 672)
			{
				boolBloqueCae2 == false;
				boolBloqueCaeReutrn2 = true;
			}
			if (boolBloqueCaeReutrn2 == true)
			{
				bloqueCae2.y -= 4;

			}
			if ( bloqueCae2.y <= 512)
			{
				boolBloqueCaeReutrn2 = false;
				boolBloqueCae2 = false;
			}

			if ( player.x - bloqueCae3.x   <= 16 && player.x - bloqueCae3.x  >= -16)
			{
				boolBloqueCae3 = true;
			}
			if (boolBloqueCae3 == true)
			{
				bloqueCae3.y += 3;
				if (FlxG.collide(player, bloqueCae3))
				{
					player.kill();
					FlxG.switchState(new GG());

				}
			}
			if (bloqueCae3.y >= 672)
			{
				boolBloqueCae3 == false;
				boolBloqueCaeReutrn3 = true;
			}
			if (boolBloqueCaeReutrn3 == true)
			{
				bloqueCae3.y -= 4;
			}
			if ( bloqueCae3.y <= 512)
			{
				boolBloqueCaeReutrn3 = false;
				boolBloqueCae3 = false;
			}
		}
		if (FlxG.overlap(player, GrupPichos))
		{
			player.kill();
			FlxG.switchState(new GG());

		}
		FlxG.collide(player, plataformaVerde);
		FlxG.collide(player, plataformaNaranja);
		FlxG.collide(player, plataformaRoja);
		FlxG.collide(player, tilemap);
		FlxG.collide(GrupRatita, tilemap);
		FlxG.collide(GrupMurcielago, tilemap);
		FlxG.collide(GrupMeduza, tilemap);
		FlxG.collide(boss, tilemap);
		FlxG.collide(player, GrupPlataformaVioletaBoss);
		FlxG.collide(player, plataformaRojaExtra);
		FlxG.collide(GrupBloqueCae, tilemap);
		FlxG.collide(bloqueCae1, player);
		FlxG.collide(bloqueCae2, player);
		FlxG.collide(bloqueCae3, player);
		//VERIFICO COLICIONES CON GRUPOS
		for (i in 0...GrupRatita.length)
		{
			if (FlxG.overlap(player.getTrompada(),GrupRatita.members[i]) && GrupRatita.members[i].visible == true)
			{
				GrupRatita.members[i].visible = false;
				GrupRatita.members[i].kill();
			}
			if (FlxG.overlap(player.getFlecha(), GrupRatita.members[i]))
			{
				GrupRatita.members[i].visible = false;
				GrupRatita.members[i].kill();
				player.getFlecha().kill();
			}
			if (FlxG.overlap(player.getHacha(), GrupRatita.members[i]))
			{
				GrupRatita.members[i].visible = false;
				GrupRatita.members[i].kill();
				player.getHacha().kill();
			}
		}
		for (i in 0...GrupMurcielago.length)
		{
			if (FlxG.overlap(player.getTrompada(), GrupMurcielago.members[i]) && GrupMurcielago.members[i].visible == true)
			{
				GrupMurcielago.members[i].visible = false;
				GrupMurcielago.members[i].kill();
			}
			if (FlxG.overlap(player.getFlecha(), GrupMurcielago.members[i]))
			{
				GrupMurcielago.members[i].visible = false;
				GrupMurcielago.members[i].kill();
				player.getFlecha().kill();
			}
			if (FlxG.overlap(player.getHacha(), GrupMurcielago.members[i]))
			{
				GrupMurcielago.members[i].visible = false;
				GrupMurcielago.members[i].kill();
				player.getHacha().kill();
			}
		}
		for (i in 0...GrupMeduza.length)
		{
			if (FlxG.overlap(player.getTrompada(), GrupMeduza.members[i]) && GrupMeduza.members[i].visible == true)
			{
				GrupMeduza.members[i].visible = false;
				GrupMeduza.members[i].kill();
			}
			if (FlxG.overlap(player.getFlecha(), GrupMeduza.members[i]))
			{
				GrupMeduza.members[i].visible = false;
				GrupMeduza.members[i].kill();
				player.getFlecha().kill();
			}
			if ( FlxG.overlap(player.getHacha(), GrupMeduza.members[i]))
			{
				GrupMeduza.members[i].visible = false;
				GrupMeduza.members[i].kill();
				player.getHacha().kill();
			}
		}
		if (safeTime == false)
		{
			for (i in 0...GrupRatita.length)
			{
				if (FlxG.overlap(player, GrupRatita.members[i]) && GrupRatita.members[i].visible == true)
				{
					player.RestarVida(5);
					safeTime = true;
				}
			}
			for (i in 0...GrupMurcielago.length)
			{
				if (FlxG.overlap(player, GrupMurcielago.members[i]) && GrupMurcielago.members[i].visible == true)
				{
					player.RestarVida(10);
					safeTime = true;

				}
			}
			for (i in 0...GrupMeduza.length)
			{
				if (FlxG.overlap(player, GrupMeduza.members[i]) && GrupMeduza.members[i].visible == true)
				{
					player.RestarVida(15);
					safeTime = true;

				}
			}

			if (FlxG.overlap(player, boss) && boss.visible == true)
			{
				player.RestarVida(20);
				safeTime = true;

			}
		}

		if (FlxG.overlap(player.getTrompada(), boss))
		{
			vidaBoss -= 20;
			player.getTrompada().kill();
		}
		if (FlxG.overlap(player.getFlecha(), boss))
		{
			vidaBoss -= 50;
			player.getFlecha().kill();

		}
		if (FlxG.overlap(player.getHacha(), boss))
		{
			vidaBoss -= 100;
			player.getHacha().kill();

		}
		if (vidaBoss <= 0)
		{
			boss.visible = false;
			boss.kill();
			FlxG.switchState(new Win());
			
		}
		if (BossFightStart)
		{

			if (vidaBoss >= 700)
			{
				if (boolBarraVidaBoss)
				{
					add(barraVidaBoss);
					add(bosstxt);
					boolBarraVidaBoss = false;
				}

				if (boss.y <= 50)
				{
					boss.x = boss.x + 2;
					bossTimeSleep = 0;
				}
				if (boss.x >= 1550 && boss.y < 200)
				{
					boss.x = 1550;
					boss.y = boss.y + 2;
				}
				if (boss.y >= 200)
				{
					boss.y = 200;
					boss.x = boss.x - 2;
				}
				if (boss.x <= 150 && bossTimeSleep <= 500)
				{
					boss.x = 150;
					bossTimeSleep += 2;
				}
				if (bossTimeSleep == 501)
				{
					boss.y = boss.y -1;
				}

			}
			if (vidaBoss >= 400 && vidaBoss < 700)
			{
				if (patron2Init)
				{
					FlxTween.tween(boss, {x:150, y:50}, 1, {type:FlxTween.ONESHOT});
				}
				if (boss.x == 150 && boss.y == 50 && patron2Init == true)
				{
					patron2Init = false;
				}
				if (boss.x == 150 && boss.y == 50 && patron2Init == false && direccionalBoss == true)
				{
					FlxTween.tween(boss, {x:boss.x + 350, y:boss.y + 150}, 3, {type:FlxTween.ONESHOT});
				}
				if (boss.x == 500 && boss.y == 200 && patron2Init == false && direccionalBoss == true)
				{
					FlxTween.tween(boss, {x:boss.x + 350, y:boss.y - 150}, 3, {type:FlxTween.ONESHOT});
				}
				if (boss.x == 850 && boss.y == 50 && patron2Init == false && direccionalBoss == true)
				{
					FlxTween.tween(boss, {x:boss.x + 350, y:boss.y + 150}, 3, {type:FlxTween.ONESHOT});
				}
				if (boss.x == 1200 && boss.y == 200 && patron2Init == false && direccionalBoss == true)
				{
					FlxTween.tween(boss, {x:boss.x + 350, y:boss.y - 150}, 3, {type:FlxTween.ONESHOT});
				}
				if (boss.x == 1550 && boss.y == 50 && patron2Init == false)
				{
					FlxTween.tween(boss, {x:boss.x - 350, y:boss.y + 150}, 3, {type:FlxTween.ONESHOT});
					direccionalBoss = false;
				}
				if (boss.x == 1200 && boss.y == 200 && patron2Init == false && direccionalBoss == false)
				{
					FlxTween.tween(boss, {x:boss.x - 350, y:boss.y - 150}, 3, {type:FlxTween.ONESHOT});
				}
				if (boss.x == 850 && boss.y == 50 && patron2Init == false && direccionalBoss == false)
				{
					FlxTween.tween(boss, {x:boss.x - 350, y:boss.y + 150}, 3, {type:FlxTween.ONESHOT});
				}
				if (boss.x == 500 && boss.y == 200 && patron2Init == false && direccionalBoss == false)
				{
					FlxTween.tween(boss, {x:boss.x - 350, y:boss.y - 150}, 3, {type:FlxTween.ONESHOT});
					direccionalBoss = true;
				}

			}
			if (vidaBoss < 400)
			{
				if (patron3Timer <= 300)
				{
					if (player.x > boss.x)
					{
						boss.x += 1.5;
					}
					if (player.y > boss.y + 20)
					{
						boss.y += 1.5;
					}
					if (player.x < boss.x)
					{
						boss.x -= 1.5;
					}
					if (player.y < boss.y)
					{
						boss.y -= 1.5;
					}
				}

			}
		}

		if (FlxG.overlap(player, GrupPichos))
		{
			player.kill();
			
			///////////////////
		}
		for (i in 0...GrupPowerUp1.length)
		{
			if (FlxG.overlap(player, GrupPowerUp1.members[i]))
			{
				player.setHabilitarAtaEspe1(true);
				player.setHabilitarAtaEspe2(false);
				player.setHabilitarAtaEspe3(false);
				GrupPowerUp1.members[i].kill();
				icon1bool = true;
				icon2bool = false;
				icon3bool = false;

			}
		}
		for (i in 0...GrupPowerUp2.length)
		{
			if (FlxG.overlap(player, GrupPowerUp2.members[i]))
			{
				player.setHabilitarAtaEspe1(false);
				player.setHabilitarAtaEspe2(true);
				player.setHabilitarAtaEspe3(false);
				GrupPowerUp2.members[i].kill();
				icon1bool = false;
				icon2bool = true;
				icon3bool = false;
			}
		}
		for (i in 0...GrupPowerUp3.length)
		{
			if (FlxG.overlap(player, GrupPowerUp3.members[i]))
			{
				player.setHabilitarAtaEspe1(false);
				player.setHabilitarAtaEspe2(false);
				player.setHabilitarAtaEspe3(true);
				GrupPowerUp3.members[i].kill();
				icon1bool = false;
				icon2bool = false;
				icon3bool = true;
			}
		}
		if (player.gethabilitarAtaEspe1())
		{
			player.AtaqueEspecial1();
		}
		if (player.gethabilitarAtaEspe2())
		{
			player.AtaqueEspecial2();
		}
		if (player.gethabilitarAtaEspe3())
		{
			player.AtaqueEspecial3();
		}

		for (i in 0...GrupMunicion.length)
		{
			if (FlxG.overlap(player, GrupMunicion.members[i]))
			{
				player.sumarMunicion(1);
				Reg.RegMunicion = player.getMunicion();
				GrupMunicion.members[i].destroy();// poner kill si se rompe
			}
		}
	}
	function placeEntites (entityName:String, entityData:Xml):Void
	{
		var X:Int = Std.parseInt(entityData.get("x"));
		var Y:Int = Std.parseInt(entityData.get("y"));
		switch (entityName)
		{
			case "player":
				player = new Jugador(X, Y, AssetPaths.animations__png);
			case "rat":
				Ratita = new Raton(X, Y, AssetPaths.enemigo3__png);
				GrupRatita.add(Ratita);
			case "jellyfish":
				Meduska = new Meduza(X, Y, AssetPaths.enemigo2__png);
				GrupMeduza.add(Meduska);
			case"bat":
				murcielago = new Murcielago(X, Y, AssetPaths.enemigo1__png);
				GrupMurcielago.add(murcielago);
			case"PlataformaDesapareceVioleta":
				plataformaDesapareceVioleta = new PlataformaDesapareceVioleta (X, Y, AssetPaths.Violeta__png);
				GrupPlataformaDesapareceVioleta.add(plataformaDesapareceVioleta);
				plataformaDesapareceVioleta.immovable = true;
			case"PlataformaDesapareceVerde":
				plataformaDesapareceVerde = new PlataformaDesapareceVerde (X, Y, AssetPaths.Verde__png);
				plataformaDesapareceVerde.immovable = true;
				GrupPlataformaDesapareceVerde.add(plataformaDesapareceVerde);
			case"PlataformaDesapareceRoja":
				plataformaDesapareceRoja = new PlataformaDesapareceRoja (X, Y, AssetPaths.Rojo__png);
				plataformaDesapareceRoja.immovable = true;
				GrupPlataformaDesapareceRoja.add(plataformaDesapareceRoja);
			case"PlataformaDesapareceNaranja":
				plataformaDesapareceNaranja = new PlataformaDesapareceNaranja (X, Y, AssetPaths.Naranja__png);
				GrupPlataformaDesapareceNaranja.add(plataformaDesapareceNaranja);
				plataformaDesapareceNaranja.immovable = true;
			/*case"PlataformaRoja":
				plataformaRoja = new PlataformaRoja (X, Y, AssetPaths.Rojo__png);
				plataformaRoja.immovable = true;
				GrupPlataformaRoja.add(plataformaRoja);*/
			/*case"PlataformaNaranja":
				plataformaNaranja = new PlataformaNaranja (X, Y, AssetPaths.Naranja__png);
				plataformaNaranja.immovable = true;
				GrupPlataformaNaranja.add(plataformaNaranja);*/
			case"PlataformaVerde":
				plataformaVerde = new PlataformaVerde (X, Y, AssetPaths.Verde__png);
				plataformaVerde.immovable = true;
				GrupPlataformaVerde.add(plataformaVerde);
			case"PlataformaVioleta":
				plataformaVioleta = new PlataformaVioleta (X, Y, AssetPaths.Violeta__png);
				plataformaVioleta.immovable = true;
				GrupPlataformaVioleta.add(plataformaVioleta);
			case"TransparenteNaranja":
				transparenteNaranja = new TransparenteNaranja (X, Y, AssetPaths.Naranja__png);
				transparenteNaranja.immovable = true;
				GrupTransparenteNaranja.add(transparenteNaranja);
			case"TransparenteRoja":
				transparenteRoja = new TransparenteRojo (X, Y, AssetPaths.Rojo__png);
				transparenteRoja.immovable = true;
				GrupTransparenteRojo.add(transparenteRoja);
			case"TransparenteVerde":
				transparenteVerde = new TransparenteVerde (X, Y, AssetPaths.Verde__png);
				transparenteVerde.immovable = true;
				GrupTransparenteVerde.add(transparenteVerde);
			case"TransparenteVioleta":
				transparenteVioleta = new TransparenteVioleta (X, Y, AssetPaths.Violeta__png);
				transparenteVioleta.immovable = true;
				GrupTransparenteVioleta.add(transparenteVioleta);

			case "Pinchos":
				pinchos = new Pinchos(X, Y, AssetPaths.Pinchos__png);
				pinchos.immovable = true;
				GrupPichos.add(pinchos);
		}
	}

	function CrearMunicion():Void
	{
		for (i in 0...50)
		{
			Xmunicion = SpawnerX.int(32, 1760);
			Ymunicion = SpawnerY.int(32, 928);
			GrupMunicion.members[i].x = Xmunicion;
			GrupMunicion.members[i].y = Ymunicion;
			add(GrupMunicion);
			/*while (FlxG.overlap(GrupMunicion.members[i], tilemap))
			{
				GrupMunicion.members[i].kill();
				GrupMunicion.members[i].reset(SpawnerX.int(32, 1760), SpawnerY.int(32, 928));// comentar esto y ver que pasa
				add(GrupMunicion);
			}*/
		}
	}
	function CrearVidas():Void
	{
		for (i in 0...GrupItemVida.length)
		{
			Xvidas = SpawnerX.int(32, 1760);
			Yvidas = SpawnerY.int(32, 928);
			GrupItemVida.members[i].x = Xvidas;
			GrupItemVida.members[i].y = Yvidas;
			add(GrupItemVida);

		}
	}
	function CrearPowerUp1():Void
	{
		for (i in 0...GrupPowerUp1.length)
		{
			XpowerUp1 = SpawnerX.int(32, 1760);
			YpowerUp1 = SpawnerY.int(32, 928);
			GrupPowerUp1.members[i].x = XpowerUp1;
			GrupPowerUp1.members[i].y = YpowerUp1;
			add(GrupPowerUp1);
			/*while (FlxG.overlap(GrupPowerUp1.members[i], tilemap))
			{
				GrupPowerUp1.members[i].kill();
				GrupPowerUp1.members[i].reset(SpawnerX.int(32, 1760), SpawnerY.int(32, 928));// comentar esto y ver que pasa
				add(GrupPowerUp1);
			}*/
		}
	}
	function CrearPowerUp2():Void
	{
		for (i in 0...GrupPowerUp2.length)
		{
			XpowerUp2 = SpawnerX.int(32, 1760);
			YpowerUp2 = SpawnerY.int(32, 928);
			GrupPowerUp2.members[i].x = XpowerUp2;
			GrupPowerUp2.members[i].y = YpowerUp2;
			add(GrupPowerUp2);
			/*while (FlxG.overlap(GrupPowerUp2.members[i], tilemap))
			{
				GrupPowerUp2.members[i].kill();
				GrupPowerUp2.members[i].reset(SpawnerX.int(32, 1760), SpawnerY.int(32, 928));// comentar esto y ver que pasa
				add(GrupPowerUp2);
			}*/
		}
	} function CrearPowerUp3():Void
	{
		for (i in 0...GrupPowerUp3.length)
		{
			XpowerUp3 = SpawnerX.int(32, 1760);
			YpowerUp3 = SpawnerY.int(32, 928);
			GrupPowerUp3.members[i].x = XpowerUp3;
			GrupPowerUp3.members[i].y = YpowerUp3;
			add(GrupPowerUp3);
			/*while (FlxG.overlap(GrupPowerUp3.members[i], tilemap))
			{
				GrupPowerUp3.members[i].kill();
				GrupPowerUp3.members[i].reset(SpawnerX.int(32, 1760), SpawnerY.int(32, 928));// comentar esto y ver que pasa
				add(GrupPowerUp3);
			}*/
		}
	}
	function placePlataformaDesaparece(entityName:String, entityData:Xml):Void
	{
		var X:Int = Std.parseInt(entityData.get("x"));
		var Y:Int = Std.parseInt(entityData.get("y"));
		switch (entityName)
		{
			case"PlataformaDesapareceVerde":
				plataformaDesapareceVerde = new PlataformaDesapareceVerde (X, Y, AssetPaths.Verde__png);
				plataformaDesapareceVerde.immovable = true;
				GrupPlataformaDesapareceVerde.add(plataformaDesapareceVerde);
		}
	}
	function showbars():Void
	{

	}
}
