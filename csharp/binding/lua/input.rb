#
# Copyright (C) 2013 GREE, Inc.
# 
# This software is provided 'as-is', without any express or implied
# warranty.  In no event will the authors be held liable for any damages
# arising from the use of this software.
# 
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely, subject to the following restrictions:
# 
# 1. The origin of this software must not be misrepresented; you must not
#    claim that you wrote the original software. If you use this software
#    in a product, an acknowledgment in the product documentation would be
#    appreciated but is not required.
# 2. Altered source versions must be plainly marked as such, and must not be
#    misrepresented as being the original software.
# 3. This notice may not be removed or altered from any source distribution.
#

{
	:classes=>[
		{
			:name=>'LWF.LWF',
			:readProperties=>[
				['name', 'getName'],
				['rootMovie', 'getRootMovie'],
				['_root', 'get_root'],
				['width', 'getWidth'],
				['height', 'getHeight'],
				['pointX', 'getPointX'],
				['pointY', 'getPointY'],
			],
			:memberFunctions=><<-EOS,
void SetText(string textName, string text) @ setText
string GetText(string textName) @ getText
void PlayMovie(string instanceName) @ playMovie
void StopMovie(string instanceName) @ stopMovie
void NextFrameMovie(string instanceName) @ nextFrameMovie
void PrevFrameMovie(string instanceName) @ prevFrameMovie
void SetVisibleMovie(string instanceName, bool visible) @ setVisibleMovie
void GotoAndStopMovie(string instanceName, int frameNo) @ gotoAndStopMovie
void GotoAndStopMovie(string instanceName, string label) @ gotoAndStopMovie
void GotoAndPlayMovie(string instanceName, int frameNo) @ gotoAndPlayMovie
void GotoAndPlayMovie(string instanceName, string label) @ gotoAndPlayMovie
void MoveMovie(string instanceName, float vx, float vy) @ moveMovie
void MoveToMovie(string instanceName, float vx, float vy) @ moveToMovie
void RotateMovie(string instanceName, float degree) @ rotateMovie
void RotateToMovie(string instanceName, float degree) @ rotateToMovie
void ScaleMovie(string instanceName, float vx, float vy) @ scaleMovie
void ScaleToMovie(string instanceName, float vx, float vy) @ scaleToMovie
void SetAlphaMovie(string instanceName, float v) @ setAlphaMovie
void SetColorTransformMovie(string instanceName, float vr, float vg, float vb, float va) @ setColorTransformMovie
void SetColorTransformMovie(string instanceName, float vr, float vg, float vb, float va, float ar, float ag, float ab, float aa) @ setColorTransformMovie
void RemoveEventHandler(string eventName, int id) @ removeEventListener
void ClearEventHandler(string eventName) @ clearEventListener
void RemoveMovieEventHandler(string instanceName, int id) @ removeMovieEventListener
void ClearMovieEventHandler(string instanceName) @ clearMovieEventListener
void RemoveButtonEventHandler(string instanceName, int id) @ removeButtonEventListener
void ClearButtonEventHandler(string instanceName) @ clearButtonEventListener
			EOS

			:staticMemberFunctions=><<-EOS,
static string getName(LWF.LWF o);
static float getWidth(LWF.LWF o);
static float getHeight(LWF.LWF o);
static float getPointX(LWF.LWF o);
static float getPointY(LWF.LWF o);
			EOS

			:customFunctionsToRegister=>[
				'addEventListener',
				'addMovieEventListener',
				'addButtonEventListener',
			],

			:wrapperCode=><<-EOS,
	public static string getName(LWF.LWF o){return o.name;}
	public static float getWidth(LWF.LWF o){return o.width;}
	public static float getHeight(LWF.LWF o){return o.height;}
	public static float getPointX(LWF.LWF o){return o.pointX;}
	public static float getPointY(LWF.LWF o){return o.pointY;}

	public static int _bind_getRootMovie(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 1 ||
				Luna.get_uniqueid(L, 1) != LunaTraits_LWF_LWF.uniqueID) {
			Luna.printStack(L);
			Lua.luaL_error(L, "luna typecheck failed: LWF.LWF.rootMovie");
		}

		LWF.LWF a = Luna_LWF_LWF.check(L, 1);
		Luna_LWF_Movie.push(L, a.rootMovie, false);
		return 1;
	}

	public static int _bind_get_root(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 1 ||
				Luna.get_uniqueid(L, 1) != LunaTraits_LWF_LWF.uniqueID) {
			Luna.printStack(L);
			Lua.luaL_error(L, "luna typecheck failed: LWF.LWF._root");
		}

		LWF.LWF a = Luna_LWF_LWF.check(L, 1);
		Luna_LWF_Movie.push(L, a._root, false);
		return 1;
	}

	public static int addEventListener(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 3 ||
				Luna.get_uniqueid(L, 1) != LunaTraits_LWF_LWF.uniqueID ||
				Lua.lua_isstring(L, 2) == 0 || !Lua.lua_isfunction(L, 3)) {
			Luna.printStack(L);
			Lua.luaL_error(L, "luna typecheck failed: LWF.addEventListener");
		}

		LWF.LWF a = Luna_LWF_LWF.check(L, 1);
		return a.AddEventHandlerLua();
	}

	public static int addMovieEventListener(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 3 ||
				Luna.get_uniqueid(L, 1) != LunaTraits_LWF_LWF.uniqueID ||
				Lua.lua_isstring(L, 2)==0 || !Lua.lua_istable(L, 3)) {
			Luna.printStack(L);
			Lua.luaL_error(L, "luna typecheck failed: LWF.addMovieEventListener");
		}

		LWF.LWF a = Luna_LWF_LWF.check(L, 1);
		return a.AddMovieEventHandlerLua();
	}

	public static int addButtonEventListener(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 3 ||
				Luna.get_uniqueid(L, 1) != LunaTraits_LWF_LWF.uniqueID ||
				Lua.lua_isstring(L, 2)==0 || !Lua.lua_istable(L, 3)) {
			Luna.printStack(L);
			Lua.luaL_error(L, "luna typecheck failed: LWF.addButtonEventListener");
		}

		LWF.LWF a = Luna_LWF_LWF.check(L, 1);
		return a.AddButtonEventHandlerLua();
	}

		EOS
		},{
			:name=>'LWF.Button',
			:readProperties=>[
				['name', 'getName'],
				['parent', 'getParent'],
				['lwf', 'getLWF'],
				['hitX', 'getHitX'],
				['hitY', 'getHitY'],
				['width', 'getWidth'],
				['height', 'getHeight'],
			],
			:memberFunctions=><<-EOS,
string GetFullName() @ getFullName
void RemoveEventHandler(string eventName, int id) @ removeEventListener
void ClearEventHandler(string eventName) @ clearEventListener
			EOS

			:staticMemberFunctions=><<-EOS,
static string getName(LWF.Button o);
static float getHitX(LWF.Button o);
static float getHitY(LWF.Button o);
static float getWidth(LWF.Button o);
static float getHeight(LWF.Button o);
			EOS

			:customFunctionsToRegister=>[
				'addEventListener',
      ],

			:wrapperCode=><<-EOS,
	public static string getName(LWF.Button o){return o.name;}
	public static float getHitX(LWF.Button o){return o.hitX;}
	public static float getHitY(LWF.Button o){return o.hitY;}
	public static float getWidth(LWF.Button o){return o.width;}
	public static float getHeight(LWF.Button o){return o.height;}

	public static int _bind_getLWF(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 1 || Luna.get_uniqueid(L, 1) !=
						LunaTraits_LWF_Button.uniqueID) {
				Luna.printStack(L);
				Lua.luaL_error(L, "luna typecheck failed: LWF.Button.lwf");
		}
		LWF.Button a = Luna_LWF_Button.check(L, 1);
		Luna_LWF_LWF.push(L, a.lwf, false);
		return 1;
	}

	public static int _bind_getParent(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 1 || Luna.get_uniqueid(L, 1) !=
				LunaTraits_LWF_Button.uniqueID)
		{
			Luna.printStack(L);
			Lua.luaL_error(L, "luna typecheck failed: LWF.Button.parent");
		}
		LWF.Button a = Luna_LWF_Button.check(L, 1);
		Luna_LWF_Movie.push(L, a.parent, false);
		return 1;
	}

	public static int addEventListener(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 3 ||
				Luna.get_uniqueid(L, 1) != LunaTraits_LWF_Button.uniqueID ||
				Lua.lua_isstring(L, 2) == 0 || !Lua.lua_isfunction(L, 3)) {
			Luna.printStack(L);
      Lua.luaL_error(L, "luna typecheck failed: LWF.Button.addEventListener");
		}

		LWF.Button a = Luna_LWF_Button.check(L, 1);
    return a.lwf.AddEventHandlerLua(null, a);
	}

			EOS
		},{
			:name=>'LWF.Movie',
			:readProperties=>[
				['name', 'getName'],
				['parent', 'getParent'],
				['currentFrame', 'getCurrentFrame'],
				['currentLabel', 'getCurrentLabel'],
				['currentLabels', 'getCurrentLabels'],
				['totalFrames', 'getTotalFrames'],
				['visible', 'getVisible'],
				['x', 'getX'],
				['y', 'getY'],
				['scaleX', 'getScaleX'],
				['scaleY', 'getScaleY'],
				['rotation', 'getRotation'],
				['alpha', 'getAlpha'],
				['red', 'getRed'],
				['green', 'getGreen'],
				['blue', 'getBlue'],
				['lwf', 'getLWF'],
				['blendMode', 'getBlendMode'],
			],
			:writeProperties=>[
				['visible', 'setVisible'],
				['x', 'setX'],
				['y', 'setY'],
				['scaleX', 'setScaleX'],
				['scaleY', 'setScaleY'],
				['rotation', 'setRotation'],
				['alpha', 'setAlpha'],
				['red', 'setRed'],
				['green', 'setGreen'],
				['blue', 'setBlue'],
				['blendMode', 'setBlendMode'],
			],

			:memberFunctions=><<-EOS,
string GetFullName() @ getFullName
LWF.Point GlobalToLocal(LWF.Point point) @ globalToLocal
LWF.Point LocalToGlobal(LWF.Point point) @ localToGlobal
void Play() @ play
void Stop() @ stop
void NextFrame() @ nextFrame
void PrevFrame() @ prevFrame
void GotoFrame(int frameNo) @ gotoFrame
void GotoAndStop(int frameNo) @ gotoAndStop
void GotoAndStop(string label) @ gotoAndStop
void GotoAndPlay(int frameNo) @ gotoAndPlay
void GotoAndPlay(string label) @ gotoAndPlay
void Move(float vx, float vy) @ move
void MoveTo(float vx, float vy) @ moveTo
void Rotate(float degree) @ rotate
void RotateTo(float degree) @ rotateTo
void Scale(float vx, float vy) @ scale
void ScaleTo(float vx, float vy) @ scaleTo
void RemoveEventHandler(string eventName, int id) @ removeEventListener
void ClearEventHandler(string eventName) @ clearEventListener
void SwapAttachedMovieDepth(int depth0, int depth1) @ swapAttachedMovieDepth
void DetachMovie(string aName) @ detachMovie
void DetachMovie(LWF.Movie movie) @ detachMovie
void DetachFromParent() @ detachFromParent
void DetachLWF(string aName) @ detachLWF
void DetachAllLWFs() @ detachAllLWFs
void RemoveMovieClip() @ removeMovieClip
LWF.BitmapClip AttachBitmap(string linkageName, int depth) @ attachBitmap
LWF.BitmapClip GetAttachedBitmap(int depth) @ getAttachedBitmap
void SwapAttachedBitmapDepth(int depth0, int depth1) @ swapAttachedBitmapDepth
void DetachBitmap(int depth) @ detachBitmap
			EOS

			:staticMemberFunctions=><<-EOS,
static string getName(LWF.Movie o);
static int getCurrentFrame(LWF.Movie o);
static string getCurrentLabel(LWF.Movie o);
static int getTotalFrames(LWF.Movie o);
static bool getVisible(LWF.Movie o);
static float getX(LWF.Movie o);
static float getY(LWF.Movie o);
static float getScaleX(LWF.Movie o);
static float getScaleY(LWF.Movie o);
static float getRotation(LWF.Movie o);
static float getAlpha(LWF.Movie o);
static float getRed(LWF.Movie o);
static float getGreen(LWF.Movie o);
static float getBlue(LWF.Movie o);
static string getBlendMode(LWF.Movie o);

static void setVisible(LWF.Movie o, bool v);
static void setX(LWF.Movie o, float v);
static void setY(LWF.Movie o, float v);
static void setScaleX(LWF.Movie o, float v);
static void setScaleY(LWF.Movie o, float v);
static void setRotation(LWF.Movie o, float v);
static void setAlpha(LWF.Movie o, float v);
static void setRed(LWF.Movie o, float v);
static void setGreen(LWF.Movie o, float v);
static void setBlue(LWF.Movie o, float v);
static void setBlendMode(LWF.Movie o, string v);
			EOS

			:customIndex=><<-EOS,
		if (Lua.lua_gettop(L) == 2 && Luna.get_uniqueid(L, 1) ==
				LunaTraits_LWF_Movie.uniqueID) {
			LWF.Movie o =
				Luna_LWF_Movie.check(L, 1);
			string name = Lua.lua_tostring(L, 2).ToString();
			if (o.lwf.GetFieldLua(o, name))
				return 1;
			LWF.Movie movie = o.SearchMovieInstance(name, false);
			if (movie != null) {
				Lua.lua_pop(L, 1);
				Luna_LWF_Movie.push(L, movie, false);
				return 1;
			}
			LWF.Button button = o.SearchButtonInstance(name, false);
			if (button != null) {
				Lua.lua_pop(L, 1);
				Luna_LWF_Button.push(L, button, false);
				return 1;
			}
		}

			EOS

			:customNewIndex=><<-EOS,
		if (Lua.lua_gettop(L) == 3 && Luna.get_uniqueid(L, 1) ==
			LunaTraits_LWF_Movie.uniqueID)
		{
			LWF.Movie o =
				Luna_LWF_Movie.check(L, 1);
			string name = Lua.lua_tostring(L, 2).ToString();
			if (o.lwf.SetFieldLua(o, name))
			return 0;
		}
			EOS

			:customFunctionsToRegister=>[
				'addEventListener',
				'attachMovie',
				'attachEmptyMovie',
				'attachLWF',
        'dispatchEvent',
			],

			:wrapperCode=><<-EOS,
	static string getName(LWF.Movie o){return o.name;}
	static int getCurrentFrame(LWF.Movie o){return o.currentFrame;}
	static string getCurrentLabel(LWF.Movie o){return o.GetCurrentLabel();}
	static int getTotalFrames(LWF.Movie o){return o.totalFrames;}
	static bool getVisible(LWF.Movie o){return o.visible;}
	static float getX(LWF.Movie o){return o.x;}
	static float getY(LWF.Movie o){return o.y;}
	static float getScaleX(LWF.Movie o){return o.scaleX;}
	static float getScaleY(LWF.Movie o){return o.scaleY;}
	static float getRotation(LWF.Movie o){return o.rotation;}
	static float getAlpha(LWF.Movie o){return o.alpha;}
	static float getRed(LWF.Movie o){return o.red;}
	static float getGreen(LWF.Movie o){return o.green;}
	static float getBlue(LWF.Movie o){return o.blue;}

	static void setVisible(LWF.Movie o, bool v){o.SetVisible(v);}
	static void setX(LWF.Movie o, float v){o.x=v;}
	static void setY(LWF.Movie o, float v){o.y=v;}
	static void setScaleX(LWF.Movie o, float v){o.scaleX=v;}
	static void setScaleY(LWF.Movie o, float v){o.scaleY=v;}
	static void setRotation(LWF.Movie o, float v){o.rotation=v;}
	static void setAlpha(LWF.Movie o, float v){o.alpha=v;}
	static void setRed(LWF.Movie o, float v){o.red=v;}
	static void setGreen(LWF.Movie o, float v){o.green=v;}
	static void setBlue(LWF.Movie o, float v){o.blue=v;}

	static string getBlendMode(LWF.Movie o)
	{
		switch (o.blendMode) {
			default:
				return "normal";
			case (int)LWF.Format.Constant.BLEND_MODE_ADD:
				return "add";
			case (int)LWF.Format.Constant.BLEND_MODE_ERASE:
				return "erase";
			case (int)LWF.Format.Constant.BLEND_MODE_LAYER:
				return "layer";
			case (int)LWF.Format.Constant.BLEND_MODE_MASK:
				return "mask";
			case (int)LWF.Format.Constant.BLEND_MODE_MULTIPLY:
				return "multiply";
			case (int)LWF.Format.Constant.BLEND_MODE_SCREEN:
				return "screen";
			case (int)LWF.Format.Constant.BLEND_MODE_SUBTRACT:
				return "subtract";
		}
	}

	static void setBlendMode(LWF.Movie o, string v)
	{
		switch (v.ToLower()) {
		default:
			o.blendMode = (int)LWF.Format.Constant.BLEND_MODE_NORMAL;
			break;
		case "add":
			o.blendMode = (int)LWF.Format.Constant.BLEND_MODE_ADD;
			break;
		case "erase":
			o.blendMode = (int)LWF.Format.Constant.BLEND_MODE_ERASE;
			break;
		case "layer":
			o.blendMode = (int)LWF.Format.Constant.BLEND_MODE_LAYER;
			break;
		case "mask":
			o.blendMode = (int)LWF.Format.Constant.BLEND_MODE_MASK;
			break;
		case "multiply":
			o.blendMode = (int)LWF.Format.Constant.BLEND_MODE_MULTIPLY;
			break;
		case "screen":
			o.blendMode = (int)LWF.Format.Constant.BLEND_MODE_SCREEN;
			break;
		case "subtract":
			o.blendMode = (int)LWF.Format.Constant.BLEND_MODE_SUBTRACT;
			break;
		}
	}

	public static int _bind_getLWF(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 1 || Luna.get_uniqueid(L, 1) !=
				LunaTraits_LWF_Movie.uniqueID) {
			Luna.printStack(L);
			Lua.luaL_error(L, "luna typecheck failed: LWF.Movie.lwf");
		}
		LWF.Movie a =
			Luna_LWF_Movie.check(L, 1);
		Luna_LWF_LWF.push(L, a.lwf, false);
		return 1;
	}

	public static int _bind_getParent(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 1 || Luna.get_uniqueid(L, 1) !=
				LunaTraits_LWF_Movie.uniqueID) {
			Luna.printStack(L);
			Lua.luaL_error(L, "luna typecheck failed: LWF.Movie.parent");
		}
		LWF.Movie a =
			Luna_LWF_Movie.check(L, 1);
		Luna_LWF_Movie.push(L, a.parent, false);
		return 1;
	}

	public static int _bind_getCurrentLabels(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 1 || Luna.get_uniqueid(L, 1) !=
				LunaTraits_LWF_Movie.uniqueID) {
			Luna.printStack(L);
			Lua.luaL_error(L, "luna typecheck failed: LWF.Movie.currentLabels");
		}
		LWF.Movie a =
			Luna_LWF_Movie.check(L, 1);
		List<LWF.LabelData> currentLabels = a.GetCurrentLabels();
	
		Lua.lua_createtable(L, currentLabels.Count, 0);
		/* -1: table */
		int i = 1;
		foreach(LWF.LabelData labelData in currentLabels) {
			Lua.lua_pushnumber(L, i);
			/* -2: table */
			/* -1: index */
			Lua.lua_createtable(L, 0, 2);
			/* -3: table */
			/* -2: index */
			/* -1: table */
			Lua.lua_pushnumber(L, labelData.frame);
			/* -4: table */
			/* -3: index */
			/* -2: table */
			/* -1: frame */
			Lua.lua_setfield(L, -2, "frame");
			/* -3: table */
			/* -2: index */
			/* -1: table */
			Lua.lua_pushstring(L, labelData.name);
			/* -4: table */
			/* -3: index */
			/* -2: table */
			/* -1: name */
			Lua.lua_setfield(L, -2, "name");
			/* -3: table */
			/* -2: index */
			/* -1: table */
			Lua.lua_settable(L, -3);
			/* -1: table */
			++i;
		}
		/* -1: table */
		return 1;
	}

	public static int attachMovie(Lua.lua_State L)
	{
		LWF.Movie a;
		int args = Lua.lua_gettop(L);
		if (args < 3 || args > 6)
			goto error;
		if (Luna.get_uniqueid(L, 1) != LunaTraits_LWF_Movie.uniqueID)
			goto error;
		if (Lua.lua_isstring(L, 2)==0 || Lua.lua_isstring(L, 3)==0)
			goto error;
		if (args >= 4 && !Lua.lua_istable(L, 4))
			goto error;
		if (args >= 5 && Lua.lua_isnumber(L, 5)==0)
			goto error;
		if (args >= 6 && !Lua.lua_isboolean(L, 6))
			goto error;

		a = Luna_LWF_Movie.check(L, 1);
		return a.lwf.AttachMovieLua(a, false);

	error:
		Luna.printStack(L);
		Lua.luaL_error(L, "luna typecheck failed: LWF.Movie.attachMovie");
		return 1;
	}

	public static int attachEmptyMovie(Lua.lua_State L)
	{
		LWF.Movie a;
		int args = Lua.lua_gettop(L);
		if (args < 2 || args > 5)
			goto error;
		if (Luna.get_uniqueid(L, 1) != LunaTraits_LWF_Movie.uniqueID)
			goto error;
		if (Lua.lua_isstring(L, 2)==0)
			goto error;
		if (args >= 3 && !Lua.lua_istable(L, 3))
			goto error;
		if (args >= 4 && Lua.lua_isnumber(L, 4)==0)
			goto error;
		if (args >= 5 && !Lua.lua_isboolean(L, 5))
			goto error;

		a = Luna_LWF_Movie.check(L, 1);
		return a.lwf.AttachMovieLua(a, true);

	error:
		Luna.printStack(L);
		Lua.luaL_error(L, "luna typecheck failed: LWF.Movie.attachMovie");
		return 1;
	}

	public static int attachLWF(Lua.lua_State L)
	{
		LWF.Movie a;
		int args = Lua.lua_gettop(L);
		if (args < 3 || args > 6)
			goto error;
		if (Luna.get_uniqueid(L, 1) != LunaTraits_LWF_Movie.uniqueID)
			goto error;
		if (Lua.lua_isstring(L, 2)==0 || Lua.lua_isstring(L, 3)==0)
			goto error;
		if (args >= 4 && Lua.lua_isnumber(L, 4)==0)
			goto error;
		if (args >= 5 && !Lua.lua_isboolean(L, 5))
			goto error;
		if (args >= 6 && Lua.lua_isstring(L, 6)==0)
			goto error;

		a = Luna_LWF_Movie.check(L, 1);
		return a.lwf.AttachLWFLua(a);

	error:
		Luna.printStack(L);
		Lua.luaL_error(L, "luna typecheck failed: LWF.Movie.attachLWF");
		return 1;
	}

	public static int addEventListener(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 3 ||
				Luna.get_uniqueid(L, 1) != LunaTraits_LWF_Movie.uniqueID ||
				Lua.lua_isstring(L, 2) == 0 || !Lua.lua_isfunction(L, 3)) {
			Luna.printStack(L);
      Lua.luaL_error(L, "luna typecheck failed: LWF.Movie.addEventListener");
		}

		LWF.Movie a = Luna_LWF_Movie.check(L, 1);
    return a.lwf.AddEventHandlerLua(a);
	}

	public static int dispatchEvent(Lua.lua_State L)
	{
    LWF.Movie a;
    string eventName;
		if (Lua.lua_gettop(L) != 2)
      goto error;
		if (Luna.get_uniqueid(L, 1) != LunaTraits_LWF_Movie.uniqueID)
      goto error;
    if (Lua.lua_isstring(L, 2)!=0) {
      eventName = Lua.lua_tostring(L, 2).ToString();
    } else if (Lua.lua_istable(L, 2)) {
      Lua.lua_getfield(L, 2, "type");
      if (Lua.lua_isstring(L, -1)==0)
        goto error;
      eventName = Lua.lua_tostring(L, -1).ToString();
      Lua.lua_pop(L, 1);
    } else {
      goto error;
    }

		a = Luna_LWF_Movie.check(L, 1);
		a.DispatchEvent(eventName);
    return 0;

	error:
		Luna.printStack(L);
    Lua.luaL_error(L, "luna typecheck failed: LWF.Movie.dispatchEvent");
    return 1;
	}

			EOS
		},{
			:name=>'LWF.BitmapClip',
			:properties=>[
				'int depth',
				'bool visible',
				'float width',
				'float height',
				'float regX',
				'float regY',
				'float x',
				'float y',
				'float scaleX',
				'float scaleY',
				'float rotation',
				'float alpha',
				'float offsetX',
				'float offsetY',
				'float originalWidth',
				'float originalHeight',
			],
			:readProperties=>[
				['name', 'getName'],
				['parent', 'getParent'],
				['lwf', 'getLWF'],
			],
			:memberFunctions=><<-EOS,
void DetachFromParent() @ detachFromParent
			EOS
			:staticMemberFunctions=><<-EOS,
static string getName(LWF.BitmapClip o);
      EOS
			:wrapperCode=><<-EOS,
	static string getName(LWF.BitmapClip o){return o.name;}

	public static int _bind_getLWF(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 1 || Luna.get_uniqueid(L, 1) !=
				LunaTraits_LWF_BitmapClip.uniqueID) {
			Luna.printStack(L);
			Lua.luaL_error(L, "luna typecheck failed: LWF.BitmapClip.lwf");
		}
		LWF.BitmapClip a =
			Luna_LWF_BitmapClip.check(L, 1);
		Luna_LWF_LWF.push(L, a.lwf, false);
		return 1;
	}

	public static int _bind_getParent(Lua.lua_State L)
	{
		if (Lua.lua_gettop(L) != 1 || Luna.get_uniqueid(L, 1) !=
				LunaTraits_LWF_BitmapClip.uniqueID) {
			Luna.printStack(L);
			Lua.luaL_error(L, "luna typecheck failed: LWF.BitmapClip.parent");
		}
		LWF.BitmapClip a =
			Luna_LWF_BitmapClip.check(L, 1);
		Luna_LWF_Movie.push(L, a.parent, false);
		return 1;
	}

			EOS
		},{
			:name=>'LWF.Point',
			:ctors=>['()', '(float x, float y)'],
			:properties=>[
				'float x',
				'float y',
			],
		},
	]
}

