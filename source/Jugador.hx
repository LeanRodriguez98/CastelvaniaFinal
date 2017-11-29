package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;

/**
 * ...
 * @author Theo Leyenda
 */
enum Estado
{
	QUIETO;
	CORRE;
	SALTA;
	ATAQUEAEREO;
	ATAQUE;
}
enum AtaqueEspecial
{
	ATAQUEESPECIAL1;
	ATAQUEESPECIAL2;
	ATAQUEESPECIAL3;
}

class Jugador extends FlxSprite
{
	private var ataqueEspecial:AtaqueEspecial;
	private var state:Estado = Estado.QUIETO;
	private var habilitarA:Bool = false;
	private var habilitarD:Bool = false;
	private var Pinia:Trompada;
	private var habilitarTimer:Bool = false;
	private var habilitarPinia:Bool = true;
	private var tiempoSigPinia:Int = 15;
	private var habilitarTimeSigPinia:Bool = false;
	private var tiempoPinia:Int = 15;
	private var habilitarMov:Bool = true;
	var timer:Int = 0;
	var idletimer:Float = 0;
	private var habilitarAtaEspe1:Bool = false;
	private var habilitarAtaEspe2:Bool = false;
	private var habilitarAtaEspe3:Bool = false;
	private var Flecha:FlxSprite;
	private var Hacha:FlxSprite;

	private var dileyAtaqueEsp1:Int = 50;
	private var dileyAtaqueEsp2:Int = 50;
	private var dileyAtaqueEsp3:Int = 50;
	private var habDil1:Bool = false;
	private var habDil2:Bool = false;
	private var habDil3:Bool = false;
	private var municion:Int = 0;

	private var tiempoParalizado:Int = 30;
	private var estaParalizado:Bool= false;
	public var vida(get, null):Int = 100;
	var cubitoPrueva:FlxSprite;
	var MovEsp3:Bool = false;
	var timerMovEsp3:Int = 0;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);

		Pinia = new Trompada(x, y);
		Pinia.kill();
		Flecha = new FlxSprite(x, y);
		Flecha.loadGraphic(AssetPaths.Flcha__png);
		Flecha.kill();
		Hacha = new FlxSprite(x, y);
		Hacha.loadGraphic(AssetPaths.HachaChica__png);
		Hacha.kill();
		
		loadGraphic(AssetPaths.animations__png, true, 32, 32);
		animation.add("idle", [0], 8, false);
		animation.add("run", [0,1,2,3], 8, true);
		animation.add("jump", [4, 5, 6, 7], 8, false);
		animation.add("attack",[8, 9, 10, 11, 12, 13, 14, 15], 32, false);
		animation.add("attackJump",[16, 17, 18, 19, 20, 21, 22, 23], 16, false);
		animation.play("idel");
		state = Estado.QUIETO;

		width = 14;
		height = 32;
		centerOrigin();
		centerOffsets();

		setFacingFlip(FlxObject.LEFT, true, false);//el segundo parametro dice si volteo X y el segundo si volteo Y (true lo voltea false no lo voltea)
		//voltea: cambia el signo.
		//para setear que mire para la izquierda;
		setFacingFlip(FlxObject.RIGHT, false, false);//el segundo parametro dice si volteo X y el segundo si volteo Y (true lo voltea false no lo voltea)
		//voltea: cambia el signo.h
		// para setear que mire para la derecha;

		acceleration.y = 1500;
	}
	override public function update(elapsed:Float):Void
	{
		
		if (gethabilitarAtaEspe1())
		{
			dileyAtaqueEsp1++;
		}
		else
		{
			dileyAtaqueEsp1 = 0;
		}
		if (gethabilitarAtaEspe2())
		{
			dileyAtaqueEsp2++;
		}
		else
		{
			dileyAtaqueEsp2 = 0;
		}
		if (gethabilitarAtaEspe3())
		{
			dileyAtaqueEsp3++;
			tiempoParalizado++;
			estaParalizado = true;
		}
		else
		{
			dileyAtaqueEsp3 = 0;
		}

		if (vida <= 0)
		{
			this.kill();
		}
		if (MovEsp3)
		{
			timerMovEsp3 += 1;
		}
		else
		{
			timerMovEsp3 = 0;
		}
		if (timerMovEsp3 > 50)
		{
			MovEsp3 = false;
			
		}
		timer += 1;
		idletimer += 1;

		maquinaStado();

		if (isTouching(FlxObject.FLOOR))
		{
			habilitarA = true;
			habilitarD = true;
		}
		if (tiempoPinia == 0)
		{
			habilitarMov = true;
			habilitarTimeSigPinia = true;
			habilitarTimer = false;
			tiempoPinia = 15;
			Pinia.kill();
		}
		if (habilitarTimeSigPinia)
		{
			tiempoSigPinia = tiempoSigPinia - 1;
		}
		if (tiempoSigPinia == 0)
		{
			habilitarTimeSigPinia = true;
			habilitarPinia = true;
			tiempoSigPinia = 8;
		}

		if (habilitarTimer)
		{
			habilitarPinia = false;
			tiempoPinia = tiempoPinia - 1;
		}

		super.update(elapsed);
	}

	public function sumarMunicion(a:Int):Void
	{
		municion = municion + a;
	}
	public function getMunicion():Int
	{
		return municion;
	}

	public function maquinaStado():Void
	{
		switch (state)
		{
			case Estado.QUIETO:
				idle();
				if (FlxG.keys.pressed.D || FlxG.keys.pressed.A)
				{
					state = Estado.CORRE;
				}
				if (FlxG.keys.pressed.L)
				{
					state = Estado.ATAQUE;
				}
				if (FlxG.keys.pressed.L)
				{
					if (FlxG.keys.pressed.W)
					{
						state = Estado.ATAQUEAEREO;
					}
				}
				if (isTouching(FlxObject.FLOOR))
				{
					salto();
					movimientoHorizontal();
				}
				if (velocity.y != 0)
				{
					state = Estado.SALTA;
				}

			case Estado.SALTA:
				movimientoHorizontal();
				salto();
				if (FlxG.keys.pressed.L == false)
				{
					animation.play("jump");
					idletimer = 0;
				}
				if (velocity.y == 0)
				{
					state = Estado.QUIETO;
				}
				if (velocity.x != 0 && isTouching(FlxObject.FLOOR))
				{
					state = Estado.CORRE;
				}
				if (FlxG.keys.pressed.L)
				{
					state = Estado.ATAQUEAEREO;
				}

			case Estado.CORRE:
				animation.play("run");
				idletimer = 0;
				if (isTouching(FlxObject.FLOOR))
				{
					salto();
					movimientoHorizontal();
				}
				if (velocity.y != 0)
				{
					state = Estado.SALTA;
				}
				if (FlxG.keys.pressed.L)
				{
					state = Estado.ATAQUE;
				}
				else if (velocity.x == 0)
				{
					state = Estado.QUIETO;
				}

			case Estado.ATAQUEAEREO:
				if (timer > 30)
				{
					GolpearAereo();
				}
				if (!isTouching(FlxObject.FLOOR))
				{
					state = Estado.SALTA;
				}
				if (velocity.x != 0 && isTouching(FlxObject.FLOOR))
				{
					state = Estado.CORRE;
				}
				if (velocity.y == 0)
				{
					state = Estado.QUIETO;
				}

			case Estado.ATAQUE:
				if (isTouching(FlxObject.FLOOR))
				{
					if (timer > 30)
					{
						velocity.x = 0;
						Golpear();
					}
				}
				if (velocity.x != 0)
				{
					state = Estado.CORRE;
				}
				if (velocity.x == 0 && velocity.y == 0)
				{
					state = Estado.QUIETO;
				}
				if (velocity.y != 0)
				{
					state = Estado.SALTA;
				}

		}

	}

	public function idle():Void
	{
		if ((isTouching(FlxObject.FLOOR) || FlxG.collide(this,PlayState.plataformaVerde)) && FlxG.keys.justPressed.W == false && FlxG.keys.justPressed.A == false && FlxG.keys.justPressed.A == false && FlxG.keys.justPressed.S == false && FlxG.keys.justPressed.D == false && FlxG.keys.justPressed.L == false )
		{
			if (idletimer > 11.725)
			{
				animation.play("idle");
			}
		}
	}

	public function salto():Void
	{

		if (FlxG.keys.justPressed.W && ((isTouching(FlxObject.FLOOR))))
		{
			animation.play("jump");
			idletimer = 0;

			if (facing == FlxObject.RIGHT)
			{
				//habilitarA = false;
				if (MovEsp3)
				{
				velocity.y = velocity.y -650;
				}
				else
				{
				velocity.y = velocity.y -500;					
				}

			}
			else if (facing == FlxObject.LEFT)
			{
				//habilitarD = false;
				if (MovEsp3)
				{
				velocity.y = velocity.y -650;
				}
				else
				{
				velocity.y = velocity.y -500;					
				}
			}

			state = Estado.SALTA;
		}
	}

	public function movimientoHorizontal():Void
	{
		if (habilitarMov)
		{
			velocity.x = 0;
			tiempoSigPinia = 0;
			if (FlxG.keys.pressed.D )
			{
				if (MovEsp3)
				{
				velocity.x = velocity.x +500;
				}
				else
				{
				velocity.x = velocity.x +300;					
				}
			}
			if (FlxG.keys.pressed.A)
			{
				if (MovEsp3)
				{
				velocity.x = velocity.x -500;
				}
				else
				{
				velocity.x = velocity.x -300;					
				}
			}
			if (isTouching(FlxObject.FLOOR) && velocity.y == 0)
			{
				if (velocity.x != 0)
				{
					if (velocity.x > 0)
					{
						facing = FlxObject.RIGHT;
						animation.play("run");
						idletimer = 0;

					}
					if (velocity.x < 0)
					{
						facing = FlxObject.LEFT;
						animation.play("run");
						idletimer = 0;

					}
				}
			}
		}
	}
	public function Golpear():Void
	{
		animation.play("attack");
		idletimer = 0;
		habilitarMov = false;

		if (FlxG.keys.pressed.L)
		{

			Pinia.reset(x+width/2, y);
			Pinia.makeGraphic(3, 26, 0xffff00ff);// remplazar por sprite.
			FlxG.state.add(Pinia);

			if (facing == FlxObject.LEFT)
			{
				Pinia.velocity.x = -100;
			}
			if (facing == FlxObject.RIGHT)
			{
				Pinia.velocity.x = 100;
			}
			habilitarTimer = true;
			habilitarTimeSigPinia = true;
		}
		timer = 0;

	}
	public function GolpearAereo():Void
	{

		animation.play("attackJump");
		idletimer = 0;

		if (FlxG.keys.pressed.L)
		{
			Pinia.reset(x+width/2, y);
			Pinia.makeGraphic(3, 26, 0xffff00ff);// remplazar por sprite.
			FlxG.state.add(Pinia);

			if (facing == FlxObject.LEFT)
			{
				Pinia.velocity.x = -100;
			}
			if (facing == FlxObject.RIGHT)
			{
				Pinia.velocity.x = 100;
			}
			habilitarTimer = true;
			habilitarTimeSigPinia = true;
		}
		timer = 0;

	}

	public function maquinaEstadoAtaque():Void
	{
		if (habilitarAtaEspe1 && getMunicion()>0)
		{
			trace("1");
			ataqueEspecial = AtaqueEspecial.ATAQUEESPECIAL1;
		}
		if (habilitarAtaEspe2 && getMunicion()>0)
		{
			trace("2");
			ataqueEspecial = AtaqueEspecial.ATAQUEESPECIAL2;
		}
		if (habilitarAtaEspe3 && getMunicion()>0)
		{
			trace("3");
			ataqueEspecial = AtaqueEspecial.ATAQUEESPECIAL3;
		}
	}
	public function RestarVida(a:Int):Void
	{
		vida = vida - a;
	}
	public function SumarVida(a:Int):Void
	{
		vida = vida + a;
	}
	public function setHabilitarAtaEspe1(a:Bool):Void
	{
		habilitarAtaEspe1 = a;
	}
	public function setHabilitarAtaEspe2(a:Bool):Void
	{
		habilitarAtaEspe2 = a;
	}
	public function setHabilitarAtaEspe3(a:Bool):Void
	{
		habilitarAtaEspe3 = a;
	}

	public function gethabilitarAtaEspe1():Bool
	{
		return habilitarAtaEspe1;
	}
	public function gethabilitarAtaEspe2():Bool
	{
		return habilitarAtaEspe2;
	}
	public function gethabilitarAtaEspe3():Bool
	{
		return habilitarAtaEspe3;
	}

	public function getTrompada():Trompada
	{
		return Pinia;
	}
	public function getHacha():FlxSprite
	{
		return Hacha;
	}
	public function getFlecha():FlxSprite
	{
		return Flecha;
	}
	public function AtaqueEspecial1():Void
	{
		if (dileyAtaqueEsp1 >= 50)
		{
			if (facing == FlxObject.LEFT && FlxG.keys.pressed.K)
			{
				if (getMunicion() > 0)
				{
					Flecha.reset(x + 8, y + 8);
					Flecha.velocity.x = -200;
					Flecha.flipX = true;
					FlxG.state.add(Flecha);
					dileyAtaqueEsp1 = 0;
					municion--;
				}
			}
			if (facing == FlxObject.RIGHT && FlxG.keys.pressed.K)
			{
				if (getMunicion() > 0)
				{
					Flecha.reset(x + 8, y + 8);
					Flecha.velocity.x = 200;
					FlxG.state.add(Flecha);
					dileyAtaqueEsp1 = 0;
					municion--;
				}
			}
		}
	}
	public function AtaqueEspecial2():Void
	{
		if (dileyAtaqueEsp2 >= 50)
		{
			if (facing == FlxObject.LEFT && FlxG.keys.pressed.K)
			{
				if (getMunicion() > 0)
				{
					Hacha.reset(x + width, y - height/2);
					Hacha.acceleration.y = 900;
					Hacha.velocity.x = -150;
					Hacha.velocity.y = -300;
					FlxG.state.add(Hacha);
					dileyAtaqueEsp2 = 0;
					municion--;
				}
			}
			if (facing == FlxObject.RIGHT && FlxG.keys.pressed.K)
			{
				if (getMunicion() > 0)
				{
					Hacha.reset(x + width / 2, y);
					Hacha.acceleration.y = 900;
					Hacha.velocity.x = 150;
					Hacha.velocity.y = -300;
					FlxG.state.add(Hacha);
					dileyAtaqueEsp2 = 0;
					municion--;
				}
			}
		}
	}
	public function getEstaParalizado():Bool
	{
		return estaParalizado;
	}
	
	public function AtaqueEspecial3():Void
	{
		if (dileyAtaqueEsp3 >= 150)
		{
			if (FlxG.keys.pressed.K)
			{
				if (getMunicion() > 0)
				{
					MovEsp3 = true;
					dileyAtaqueEsp3 = 0;
					municion--;
					
					
					
				}
			}
		}
	}
	
	function get_vida():Int 
	{
		return vida;
	}


}
