--[[ 
[Spanish]
    |HUD MINI SIMPLE version[A1] END | LuaXdea |
    | Psych Engine 0.7.2h |

Este script te permite personalizar el HUD (la interfaz)
en Psych Engine de forma sencilla 'Creo'. Añade opciones como animación de los iconos.
Ajustes de la cámara y reducción de salud del oponente, entre otras cosas.

[Youtube]: https://youtube.com/@lua-x-dea?si=vH4ommC_t3CGrDqn
[Gamebanana]: https://gamebanana.com/mods/502653
[Github]: https://github.com/Contra-Sakar/HUD-MINI-SIMPLE
]]

-- | HUD MINI SIMPLE | Ajustes |
-- | True: Activado | false: Desactivado |

-- | Ajustes de personalización |
local IconAnim = true -- Animación extra para los iconos [default true]
local HideBotplayTxt = true -- Opción para ocultar el texto de botplay [default true]
local CoverMode = false -- Activa el modo Cover donde todo el HUD MINI SIMPLE y algunas cosas mas se vuelve de una opacidad menor y se activa automáticamente el botplay [default false]


-- | HUD |
local TrakeHUD = false -- El HUD se personalizar como a usado el HUD Trake [default false]
local FlipTrakeHUD = false -- Cambias la poción de las cosas del HUD a la izquierda [default false]
local ColorBarVanilla = false -- Cambia el color de la barra de vida al FNF Base [default false]
local HealthBarColorFix = true -- Si el color de la barra de vida del oponente y jugador son iguales o muy similares, se hará un pequeño retoque en el color para que no sean iguales [default true]


-- | Ajustes de Psych Engine |
local MiddlescrollON = true -- HUD personalizado para middlescroll [default true]
local MiddleScrollToggle = false -- Puedes denegar que se active el middlescroll [default false]
local CamZoomingToggle = false -- Si se activa, la cámara no hace zoom (Dejará de funcionar el evento de Add Camera Zoom) [default false]
local SkipCountdownToggle = false -- Quitas el conteo de inicio [default false]
local PauseToggle = false -- Podrás denegar que se pueda usar el modo pausa [default false]


-- | ScoreMini |
local ScoreTxtMini = true -- Opción para que se vean el ScoreMini y MissesMini [default true]
local TimeScoreMini = 0.3 -- El tiempo que tardará en llegar a la nueva puntuación [defecto 0.3]
local ColorScoreMini = '00FF00' -- El color que se volverá el ScoreMini cuando se gana puntos [defecto Hex 00FF00 (Verde)]


-- | Ayuda de eventos |
local InfoEvent = false -- Te permite ver qué eventos se está usando en el momento con su configuración de Value 1 y Value 2 [default false]
local TextoFont = 'MAHAWA__.TTF' -- Aquí puedes elegir que fuente de letra quieres usar para el (InfoEvent) [default MAHAWA__.TTF]


-- | CameraFix | Reemplazo de zCameraFix |
local CamFix = false -- Arregla las cámaras para que se puedan usar mejor [default false]
local SpeedZoom = 0.1 -- Velocidad de Zoom [Recomendable de 0.05 a 0.5] [default 0.1]
local CamFull = false -- Puedes hacer que se vea la cámara completa [default false]
local CustomCamFix = 0 -- Puedes personalizar el tamaño de la camara requiere que CamFull este en false [default 0]


-- | Intro |
local IntroLua = false -- Activa una intro que se ve cuando inicia cualquier nivel [default false]
local AnimMini = 1 -- Animaciones de entrada: 1 = normal, 2 = izquierda a derecha, 3 = derecha a izquierda, 4 = arriba a abajo, 5 = abajo a arriba, 6 = Cara, 7 = Centro, 8 = Especial. [default 1]
local AnimTime = 0.5 -- El tiempo en que se hará la Intro [default 0.5]
local ColorMode = 1 -- 1 = solo un color, 2 = ajedrez, 3 = aleatorio, 4 = columnas de 2 colores, 5 = Random color custom. [default 1]
local SingleColor = '000000' -- Color unico [default Hex 000000 (Negro)]
local color1 = 'FFFFFF' -- Color primario [default Hex FFFFFF (Blanco)]
local color2 = '000000' -- Color secundario [default Hex 000000 (Negro)]
local customColors = {'000000','FFFFFF','FF0C00'} -- Random color Custom [default Hex {'000000','FFFFFF','FF0C00'}] (Requiere ColorMode = 5)
local ColorFace = 'CCCCCC' -- Puedes elegir el color que va ser la cara pixel [default Hex CCCCCC] (Requiere AnimMini = 6)
local CamIntro = 'camHUD' -- La cámara donde sera la Intro recomendable (camHUD o camOther) [default camHUD]


-- | Configuración de reducción de salud del oponente |
local healthOp = true -- Activar o desactivar la reducción de salud [default true]
local QuitaV = 0.013 -- Reducción de salud [default 0.013]
local LimiteDeVida = 0.4 -- Reducción Maxima [default 0.4]
local PocaVida = true -- El icono del bf parpadea cuando la vida es por debajo de 0.4 [default true]
local IconAngle = true -- El icon da una vuelta cuando está a poca vida [default true]


-- | Configuración de CamFollow |
local CustomCam = false -- Si quieres usar la poción de la cámara por defecto de los personajes (false) o personalizada (true)
local FlipDadX = false -- Cuando FlipDadX esta en true, LEFT aumenta X y RIGHT la disminuye; de lo contrario, LEFT disminuye X y RIGHT la aumenta [default false]
local IndividualOffsets = false -- Es para si quieres usar los Offsets por individual cada uno [default false]
local GeneralOffset = 20 -- Reemplaza a los offsets de dad,boyfriend y gf si el IndividualOffsets está en false [default 20]
local AngleSwitch = false -- Inclinar Cámara (Requiere CamFix) [default false]
local angleTime = 1 -- Velocidad de Angle [default 1]
local followCharacters = true -- CamFollow [default true]
local CameraSpeedOff = false -- Puedes desactivar el cameraSpeed en el script si ya tienes en otro script que ya hace lo mismo, es para evitar problemas si otro script esta usando el cameraSpeed [default false]
local cameraSpeed = 1 -- Velocidad de CamFollow [default 1]

-- | Posiciones de las cámaras | [Configurado para Test]
-- Esto solo funciona si CustomCam está en true
-- camX: es la posición horizontal
-- camY: es la posición vertical
local camX_opponent = 600
local camY_opponent = 600
local camX_player = 700
local camY_player = 600
-- [Puede que el de gf no funcione en la versión 0.7.3]
local camX_gf = 650
local camY_gf = 450

-- | Offsets de las cámaras |
-- Offset: Define hasta dónde puede desplazarse la cámara al seguir a los personajes.
local offset_opponent = 20
local offset_player = 20
local offset_gf = 20

-- | Ángulos generales |
-- angle: es cuánto se inclinara la cámara
local angle_left = 7
local angle_right = -7
local angle_up = 0
local angle_down = 0


local function configureHUD()
    if CoverMode then
        setProperty('comboGroup.alpha',0.2)
        setProperty('cpuControlled',true)
        for _,ModeAlpha in pairs({'iconP1','iconP2','healthBar','timeBar','timeBarBG','timeTxt'}) do
            setProperty(ModeAlpha..'.alpha',0.5)
        end
        for j = 0,7 do
            setPropertyFromGroup('strumLineNotes',j,'alpha',0.5)
        end
        for j = 0,getProperty('unspawnNotes.length') - 1 do
            setPropertyFromGroup('unspawnNotes',j,'visible',false)
        end
    end
    if not TrakeHUD and not MiddleScrollToggle and MiddlescrollON and middlescroll then
        setProperty('iconP1.x',1120)
        setProperty('iconP1.y',downscroll and 590 or 0)
        setProperty('iconP2.x',10)
        setProperty('iconP2.y',downscroll and 590 or 15)
        setProperty('healthBar.x',335)
        setProperty('healthBar.y',downscroll and 675 or 35)
        setProperty('healthBar.scale.x',0.5)
        setProperty('timeBar.x',380)
        setProperty('timeBar.y',downscroll and 695 or 13)
        setProperty('timeBar.scale.x',0.4)
        setProperty('timeTxt.x',500)
        setProperty('timeTxt.y',downscroll and 690 or 5)
        setProperty('ScoreMini.x',10)
        setProperty('ScoreMini.y',10)
        setProperty('MissesMini.x',10)
        setProperty('MissesMini.y',30)
    else
    local flip = TrakeHUD and FlipTrakeHUD
        setProperty('iconP1.x',flip and 144 or (TrakeHUD and 1100 or 144))
        setProperty('iconP2.x',flip and 20 or (TrakeHUD and 960 or 20))
        setProperty('healthBar.x',flip and -140 or (TrakeHUD and 800 or -140))
        setProperty('healthBar.scale.x',0.5)
        setProperty('timeBar.x',flip and -105 or (TrakeHUD and 835 or -105))
        setProperty('timeBar.scale.x',0.4)
        setProperty('timeTxt.x',flip and 40 or (TrakeHUD and 1000 or 40))
        setProperty('ScoreMini.x',flip and 20 or (TrakeHUD and 960 or 20))
        setProperty('MissesMini.x',flip and 20 or (TrakeHUD and 960 or 20))
    local yOffset = (flip and not downscroll) and {0,10,130,155,147,175,195} or (flip and downscroll) and {590,590,570,550,540,525,505} or downscroll and {0,10,130,155,147,175,195} or {590,590,570,550,540,525,505}
        setProperty('iconP1.y',yOffset[1])
        setProperty('iconP2.y',yOffset[2])
        setProperty('healthBar.y',yOffset[3])
        setProperty('timeBar.y',yOffset[4])
        setProperty('timeTxt.y',yOffset[5])
        setProperty('ScoreMini.y',yOffset[6])
        setProperty('MissesMini.y',yOffset[7])
    end
    setProperty('botplayTxt.visible',not HideBotplayTxt)
    setProperty('scoreTxt.visible',false)
    setProperty('camZooming',not CamZoomingToggle)
end
function onHUDnotes()
    if TrakeHUD then
        for j = 0,3 do
            setPropertyFromGroup('playerStrums',j,'y',downscroll and 570 or 50)
            setPropertyFromGroup('opponentStrums',j,'y',downscroll and 50 or 570)
            if not downscroll then
                setPropertyFromGroup('opponentStrums',j,'downScroll',true)
            else
                setPropertyFromGroup('opponentStrums',j,'downScroll',false)
            end
        end
    end
end
local staticVariables = {
    {'IconAnim',IconAnim},
    {'HideBotplayTxt',HideBotplayTxt},
    {'CoverMode',CoverMode},
    {'TrakeHUD',TrakeHUD},
    {'FlipTrakeHUD',FlipTrakeHUD},
    {'ColorBarVanilla',ColorBarVanilla},
    {'HealthBarColorFix',HealthBarColorFix},
    {'MiddlescrollON',MiddlescrollON},
    {'MiddleScrollToggle',MiddleScrollToggle},
    {'CamZoomingToggle',CamZoomingToggle},
    {'SkipCountdownToggle',SkipCountdownToggle},
    {'PauseToggle',PauseToggle},
    {'ScoreTxtMini',ScoreTxtMini},
    {'TimeScoreMini',TimeScoreMini},
    {'ColorScoreMini',ColorScoreMini},
    {'InfoEvent',InfoEvent},
    {'TextoFont',TextoFont},
    {'CamFix',CamFix},
    {'SpeedZoom',SpeedZoom},
    {'CamFull',CamFull},
    {'CustomCamFix',CustomCamFix},
    {'IntroLua',IntroLua},
    {'AnimMini',AnimMini},
    {'AnimTime',AnimTime},
    {'ColorMode',ColorMode},
    {'SingleColor',SingleColor},
    {'color1',color1},
    {'color2',color2},
    {'customColors',customColors},
    {'healthOp',healthOp},
    {'QuitaV',QuitaV},
    {'LimiteDeVida',LimiteDeVida},
    {'PocaVida',PocaVida},
    {'CustomCam',CustomCam},
    {'FlipDadX',FlipDadX},
    {'IndividualOffsets',IndividualOffsets},
    {'GeneralOffset',GeneralOffset},
    {'AngleSwitch',AngleSwitch},
    {'angleTime',angleTime},
    {'followCharacters',followCharacters},
    {'CameraSpeedOff',CameraSpeedOff},
    {'cameraSpeed',cameraSpeed},
    {'camX_opponent',camX_opponentEvent},
    {'camY_opponent',camY_opponentEvent},
    {'camX_player',camX_playerEvent},
    {'camY_player',camY_playerEvent},
    {'camX_gf',camX_gfEvent},
    {'camY_gf',camY_gfEvent},
    {'offset_opponent',offset_opponent},
    {'offset_player',offset_player},
    {'offset_gf',offset_gf},
    {'angle_left',angle_left},
    {'angle_right',angle_right},
    {'angle_up',angle_up},
    {'angle_down',angle_down}
}
local dynamicVariables = {
    {'health',function() return getProperty('health') end},
    {'iconP1Name',function() return getProperty('boyfriend.healthIcon') end},
    {'iconP2Name',function() return getProperty('dad.healthIcon') end}
}
local cachedValues = {}
function onVariablesUpdate()
    for _,VlE in ipairs(staticVariables) do
        if cachedValues[VlE[1]] ~= VlE[2] then
            cachedValues[VlE[1]] = VlE[2]
            setOnScripts(VlE[1],VlE[2])
        end
    end
    for _,VlE in ipairs(dynamicVariables) do
        local newValue = VlE[2]()
        if cachedValues[VlE[1]] ~= newValue then
            cachedValues[VlE[1]] = newValue
            setOnScripts(VlE[1],newValue)
        end
    end
end
function animateIcons(elapsed)
    if IconAnim then
        setProperty('iconP1.scale.y',1)
        setProperty('iconP2.scale.y',1)
    end
end
function onBeatHit()
    if PocaVida and getProperty('healthBar.percent') < 20 then
        setProperty('iconP1.alpha',0.3)
        doTweenAlpha('iconP1Alpha','iconP1',1,0.4)
    end
end
local CamGameZoomFix,CamHUDZoomFix = 1,1
function onCamFix()
    if CamFix then
CamGameZoomFix = CamGameZoomFix + SpeedZoom * (getProperty('defaultCamZoom') - CamGameZoomFix)
CamHUDZoomFix = CamHUDZoomFix + SpeedZoom * (1 - CamHUDZoomFix)
    for _,Cam in pairs({'camGame','camHUD','camOther'}) do
            setProperty(Cam..'.zoom',(Cam == 'camGame' and CamGameZoomFix or CamHUDZoomFix) / 1.35)
            setProperty(Cam..'.flashSprite.scaleX',1.35)
            setProperty(Cam..'.flashSprite.scaleY',1.35)
        end
    end
end
function opponentNoteHit()
    if healthOp and health > LimiteDeVida then
        setHealth(health - QuitaV) end
end
function AltUpdate()
    if IconAngle then
        doTweenAngle('IconP1Angle','iconP1',getProperty('healthBar.percent') < 20 and 360 or 0,0.2)
        doTweenAngle('IconP2Angle','iconP2',getProperty('healthBar.percent') > 80 and 0 or 360,0.2)
    end
    if ColorBarVanilla then
        setHealthBarColors('FF0000','00FF00')
        HealthBarColorFix = false
    end
end
function onSongStart()
    if not CoverMode and not getProperty('cpuControlled') then
        doTweenAlpha('ScoreMiniAlpha','ScoreMini',1,0.5)
        doTweenAlpha('MissesMiniAlpha','MissesMini',1,0.5)
    else
        removeLuaText('ScoreMini')
        removeLuaText('MissesMini')
    end
    luaPrint((AngleSwitch and not CamFix) and 'AngleSwitch: require = CamFix' or nil,'FF0000')
    IconStart = true
    onStartIntro()
end
function onPause()
    if PauseToggle then
    return Function_Stop;
    end
end
function onCreate()
    setProperty('skipCountdown',SkipCountdownToggle)
    for c = 1,2 do
    makeLuaSprite('CamFixBar'..c,nil)
    makeGraphic('CamFixBar'..c,1280,720,'000000')
    setObjectCamera('CamFixBar'..c,'camOther')
    setProperty('CamFixBar'..c..'.x',(c == 1) and -1280 - math.abs(CustomCamFix) or 1280 + math.abs(CustomCamFix))
    setProperty('CamFixBar'..c..'.visible',not CamFull)
    addLuaSprite('CamFixBar'..c,true)
    end
    makeLuaText('ScoreMini','0')
    setTextSize('ScoreMini',20)
    setProperty('ScoreMini.alpha',0)
    addLuaText('ScoreMini')
    makeLuaText('MissesMini','0')
    setTextColor('MissesMini','FF0000')
    setTextSize('MissesMini',20)
    setProperty('MissesMini.alpha',0)
    addLuaText('MissesMini')
    if healthOp then
        setProperty('guitarHeroSustains',false)
    else
        setProperty('guitarHeroSustains',true)
    end
    if TrakeHUD then
        MiddleScrollToggle = true
    end
    defaultOptions()
    onIntro()
end
function defaultOptions()
    MiddlescrollDefault = getPropertyFromClass('backend.ClientPrefs','data.middleScroll')
    SplashAlpha = getPropertyFromClass('backend.ClientPrefs','data.splashAlpha')
    if MiddleScrollToggle then
    setPropertyFromClass('backend.ClientPrefs','data.middleScroll',false)
    else
    setPropertyFromClass('backend.ClientPrefs','data.middleScroll',MiddlescrollDefault)
    end
    setPropertyFromClass('backend.ClientPrefs','data.splashAlpha',CoverMode and 0.3 or SplashAlpha)
end
function CoverModeSplash()
    for i = 0,getProperty('grpNoteSplashes.length') - 1 do
    setPropertyFromGroup('grpNoteSplashes',i,'alpha',CoverMode and 0.3 or SplashAlpha)
    end
end
function onDestroy()
    setPropertyFromClass('backend.ClientPrefs','data.splashAlpha',SplashAlpha)
    setPropertyFromClass('backend.ClientPrefs','data.middleScroll',MiddlescrollDefault)
end
function onCreatePost()
    CamDefault()
    onHUDnotes()
    if CoverMode then
        for j = 0,7 do
            setPropertyFromGroup('strumLineNotes',j,'alpha',0.5)
            setPropertyFromGroup('unspawnNotes',j,'visible',false)
        end
    end
end
function onUpdate(elapsed)
    InfoEventUpdate(elapsed)
    CoverModeSplash()
    onVariablesUpdate()
    AltUpdate()
    healthBarFix()
end
function onUpdatePost(elapsed)
    configureHUD()
    onCamFix()
    onCamFollowPos()
    ObjectOrderPost()
    animateIcons(elapsed)
    ScoreMiniPost(elapsed)
end
function ObjectOrderPost()
    setObjectOrder('ScoreMini',getObjectOrder('scoreTxt') + 1)
    setObjectOrder('MissesMini',getObjectOrder('scoreTxt') + 1)
end
function healthBarFix()
    if HealthBarColorFix then
    local rBF,gBF,bBF = unpack(getProperty('boyfriend.healthColorArray'))
    local rDad,gDad,bDad = unpack(getProperty('dad.healthColorArray'))
    if areColorsSimilar(rBF,gBF,bBF,rDad,gDad,bDad) then
        local luminosityDad = calculateLuminosity(rDad,gDad,bDad)
        local adjustedColor = adjustColor(rDad,gDad,bDad,luminosityDad)
        setHealthBarColors(rgbToHex(adjustedColor),rgbToHex({rBF,gBF,bBF}))
    end end
end
function areColorsSimilar(r1,g1,b1,r2,g2,b2)
    local threshold = 50
    return math.abs(r1 - r2) <= threshold and math.abs(g1 - g2) <= threshold and math.abs(b1 - b2) <= threshold
end
function calculateLuminosity(r,g,b)
    return 0.299 * r + 0.587 * g + 0.114 * b
end
function adjustColor(r,g,b,luminosity)
    local adjustment = (luminosity > 128) and -60 or 60
    return {
        clamp(r + adjustment,0,255),
        clamp(g + adjustment,0,255),
        clamp(b + adjustment,0,255)
    }
end
function rgbToHex(color)
    return string.format("0x%02X%02X%02X",color[1],color[2],color[3])
end
function clamp(value,min,max)
    return math.max(min,math.min(max,value))
end
local size,cols,rows = 40,40,18
local offsetX = -145
local facePixels = {
{15,6},{16,6},{17,6},
{15,7},{16,7},{17,7},            {21,7},{22,7},{23,7},

{15,10},                                      {23,10},
     {16,11},                              {22,11},
        {17,12},{18,12},{19,12},{20,12},{21,12}
}
local centerX,centerY = (1920 / 2) + offsetX,720 / 2
function onIntro()
    if IntroLua then
        for i = 0,cols - 1 do
            for j = 0,rows - 1 do
                local id = 'sq'..(i * rows + j)
                local color = SingleColor
                local isFacePixel = false
                if AnimMini == 6 then
                    for _,pos in ipairs(facePixels) do
                        if pos[1] == i and pos[2] == j then
                            color = ColorFace
                            isFacePixel = true
                            break
                        end
                    end
                end
                if not isFacePixel then
                    if ColorMode == 1 then
                        color = SingleColor
                    elseif ColorMode == 2 then
                        color = ((i + j) % 2 == 0) and color1 or color2
                    elseif ColorMode == 3 then
                        color = string.format('%06X', math.random(0x000000, 0xFFFFFF))
                    elseif ColorMode == 4 then
                        color = (i % 2 == 0) and color1 or color2
                    elseif ColorMode == 5 then
                        color = customColors[math.random(#customColors)]
                    end
                end
                makeLuaSprite(id,nil,i * size + offsetX,j * size)
                makeGraphic(id,size,size,color)
                setObjectCamera(id,CamIntro)
                addLuaSprite(id)
            end
        end
    end
end
function onStartIntro()
    if IntroLua then
        if AnimMini == 6 then
            animateSmileFace()
        elseif AnimMini == 7 then
            animateFromCenterOut()
        elseif AnimMini == 8 then
            animateForOnly()
        else
            standardAnimation()
        end
    end
end
function animateSmileFace()
    local baseTime,delayInc,alphaDelay = AnimTime,0.03,0.15
    for _,pos in ipairs(facePixels)do
        local id = 'sq'..(pos[1]*rows+pos[2])
        doTweenX(id..'_scX',id..'.scale',0.01,baseTime)
        doTweenY(id..'_scY',id..'.scale',0.01,baseTime)
        runTimer(id..'_fade',alphaDelay)
    end
    for i = 0,cols-1 do
        for j = 0,rows-1 do
            local id = 'sq'..(i*rows+j)
            local isFacePixel = false
            for _,pos in ipairs(facePixels)do
                if pos[1] == i and pos[2] == j then
                    isFacePixel = true
                    break
                end
            end
            if not isFacePixel then
                local delay = (i+j)*delayInc + baseTime
                doTweenX(id..'_scX',id..'.scale',0.01,delay)
                doTweenY(id..'_scY',id..'.scale',0.01,delay)
                runTimer(id..'_fade',delay + alphaDelay)
            end
        end
    end
end
function animateFromCenterOut()
    local baseTime,delayInc,alphaDelay = AnimTime,0.002,0.1
    local squares = {}
    for i = 0,cols - 1 do
        for j = 0,rows - 1 do
            local id = 'sq'..(i * rows + j)
            local x,y = i * size + size / 2 + offsetX + 200, j * size + size / 2
            local dist = math.sqrt((x - centerX)^2 + (y - centerY)^2)
            table.insert(squares,{id = id,delay = dist * delayInc})
        end
    end
    for _,square in ipairs(squares) do
        local scaleTime = baseTime + square.delay
        doTweenX(square.id..'_scX',square.id..'.scale',0.01,scaleTime)
        doTweenY(square.id..'_scY',square.id..'.scale',0.01,scaleTime)
        runTimer(square.id..'_fade',scaleTime + alphaDelay)
    end
end
function standardAnimation()
    local baseTime = AnimTime
    local delayInc = (AnimMini == 1)and 0 or 0.03
    local alphaDelay = (AnimMini == 1)and 0.15 or 0.07
    local limit = (AnimMini<4)and 40 or 18
    local isColumn = (AnimMini<4)
    local reverse = (AnimMini == 3)or(AnimMini == 5)
    for i = 0,limit - 1 do
        local index = reverse and(limit - i)or i
        local delay = index*delayInc
        local scaleTime = baseTime+delay
        for j = 0,(isColumn and 18 or 40)do
            local id = 'sq'..(isColumn and(i*18 + j)or(j*18 + i))
            doTweenX(id..'_scX',id..'.scale',0.01,scaleTime)
            doTweenY(id..'_scY',id..'.scale',0.01,scaleTime)
            runTimer(id..'_fade',delay + alphaDelay)
        end
    end
end
local squares = {}
local activeSquares = {}
local completedSquares = {}
function animateForOnly()
    for i = 0,cols - 1 do
        for j = 0,rows - 1 do
            local id = 'sq'..(i * rows + j)
            local x,y = i * size + size / 2,j * size + size / 2
            local dist = math.sqrt((x - centerX)^2 + (y - centerY)^2)
            squares[id] = {id = id,x = x,y = y,dist = dist,active = false}
        end
    end
    local sortedSquares = {}
    for _,square in pairs(squares) do
        table.insert(sortedSquares,square)
    end
    table.sort(sortedSquares,function(a,b) return a.dist < b.dist end)
    for i = 1,4 do
        startAnimation(sortedSquares[i])
    end
end
function startAnimation(square)
    square.active = true
    activeSquares[square.id] = square
    doTweenX(square.id..'_scX',square.id..'.scale',0.1,AnimTime,'smootherStepInOut')
    doTweenY(square.id..'_scY',square.id..'.scale',0.1,AnimTime,'smootherStepInOut')
    runTimer(square.id..'_next',AnimTime)
    runTimer(square.id..'_fade',0.1)
end
function onTimerCompletedIntro(t)
    local id = t:gsub('_(%w+)$','')
    local action = t:match('_(%w+)$')
    if action == 'next' then
    local square = activeSquares[id]
    if not square then return end
    activeSquares[id] = nil
    completedSquares[id] = true
    local neighbors = {}
    for _,sq in pairs(squares) do
        if not sq.active and not completedSquares[sq.id] then
            local dx = math.abs(sq.x - square.x)
            local dy = math.abs(sq.y - square.y)
            if (dx == size and dy == 0) or (dy == size and dx == 0) then
                table.insert(neighbors,sq)
            end
        end
    end
    table.sort(neighbors,function(a,b) return a.dist < b.dist end)
    for i = 1,math.min(4,#neighbors) do
        startAnimation(neighbors[i])
    end
    elseif action == 'fade' then
        doTweenAlpha(id..'_alpha',id,0,0.5)
        runTimer(id..'_remove',0.5)
    elseif action == 'remove' then
        removeLuaSprite(id,true)
    end
end
local activeTexts = {}
local maxTexts, textDuration,yOffsetStep,baseX,baseY,offsetXNewText = 6,5,25,0,200,400
local eventCooldown = {}
function luaPrint(message,ColorPrint)
    if #activeTexts >= maxTexts then
        local oldestText = table.remove(activeTexts,1)
        doTweenAlpha(oldestText.tag..'FadeQuick',oldestText.tag,0,0.15,'linear')
        runTimer('removeOldText'..oldestText.tag,0.15)
    end
    local textTag = 'customText'..(function() counter = (counter or 0) + 1; return counter end)()
    for i, textData in ipairs(activeTexts) do
        doTweenY(textData.tag..'MoveDown',textData.tag,baseY + (i * yOffsetStep),0.3,'linear')
    end
    makeLuaText(textTag,message,1000,baseX + offsetXNewText,baseY + 300)
    setTextSize(textTag,14)
    setTextBorder(textTag,0.3,'000000')
    setTextColor(textTag,ColorPrint or 'FFFFFF')
    setTextAlignment(textTag,'left')
    setTextFont(textTag,TextoFont or 'vcr.ttf')
    setProperty(textTag..'.alpha',0)
    setObjectCamera(textTag,'camOther')
    addLuaText(textTag)
    doTweenAlpha(textTag..'FadeIn',textTag,1,0.15,'linear')
    doTweenX(textTag..'MoveIn',textTag,baseX,0.15,'linear')
    table.insert(activeTexts, {tag = textTag,lifetime = textDuration,alphaTime = 0,isNew = true})
end
function InfoEventUpdate(elapsed)
    for n,cooldown in pairs(eventCooldown) do
        if cooldown > 0 then eventCooldown[n] = cooldown - elapsed end
    end
    for i = #activeTexts,1,-1 do
        local textData = activeTexts[i]
        textData.lifetime = textData.lifetime - elapsed
        if textData.lifetime <= 0 then
            if textData.isNew then
                doTweenAlpha(textData.tag..'FadeOut', textData.tag,0,0.15,'linear')
                runTimer('removeOldText'..textData.tag,0.15)
                textData.isNew = false
            end
        end
    end
end
function onTimerCompleted(t)
    if t:find('removeOldText') then
        local textTag = t:gsub('removeOldText','')
        removeLuaText(textTag,true)
    end
    onTimerCompletedIntro(t)
end
local ScoreActual = 0
local timerUp,timerDown,incrementStageUp,incrementStageDown = 0,0,0,0
local incrementSpeed = {up = 1,down = 1}
function ScoreMiniPost(elapsed)
    local TargetScore = getProperty('songScore')
    local TargetMisses = getProperty('songMisses')
    timerUp = timerUp + elapsed
    timerDown = timerDown + elapsed
    if timerUp >= TimeScoreMini then
        incrementStageUp = incrementStageUp + 1
        incrementSpeed.up = 1 + (2 * incrementStageUp)
        timerUp = 0
    end
    if timerDown >= TimeScoreMini then
        incrementStageDown = incrementStageDown + 1
        incrementSpeed.down = math.min(1 + incrementStageDown, 4)
        timerDown = 0
    end
    if ScoreActual ~= TargetScore then
        local direction = (ScoreActual < TargetScore) and 'up' or 'down'
        ScoreActual = ScoreActual + ((direction == 'up') and incrementSpeed.up or -incrementSpeed.down)
        setProperty('ScoreMini.color',getColorFromHex((direction == 'up') and ColorScoreMini or 'FF0000'))
        if (direction == 'up' and ScoreActual > TargetScore) or (direction == 'down' and ScoreActual < TargetScore) then
            ScoreActual = TargetScore
        end
        if ScoreActual == TargetScore then
            doTweenColor('ScoreR','ScoreMini','FFFFFF',0.3)
            incrementSpeed.up,incrementSpeed.down = 1,1
            incrementStageUp,incrementStageDown = 0,0
        end
    end
    if not CoverMode and not getProperty('cpuControlled') then
    setTextString('ScoreMini',math.floor(ScoreActual))
    setTextString('MissesMini',TargetMisses)
    end
end
function CamDefault()
    if not CustomCam then
        camX_player= getMidpointX('boyfriend') - 100
        camY_player = getMidpointY('boyfriend') - 100
        camX_opponent = getMidpointX('dad') + 150
        camY_opponent = getMidpointY('dad') - 100
        camX_gf = getMidpointX('gf')
        camY_gf = getMidpointY('gf')
    end
end
function onCamFollowPos()
if not CameraSpeedOff then setProperty('cameraSpeed',cameraSpeed) end
    if followCharacters then
        local character = 'dad'
        if gfSection then
            character = 'gf'
        elseif mustHitSection then
            character = 'boyfriend'
        end
        local gfAnim = getProperty('gf.animation.curAnim.name')
        if gfAnim:find('singLEFT') or gfAnim:find('singRIGHT') or gfAnim:find('singUP') or gfAnim:find('singDOWN') then
            character = 'gf'
        end
        local x,y,offset,angle = 0,0,0,0
        if character == 'dad' then
            x,y = camX_opponent,camY_opponent
            offset = IndividualOffsets and offset_opponent or GeneralOffset
        elseif character == 'boyfriend' then
            x,y = camX_player,camY_player
            offset = IndividualOffsets and offset_player or GeneralOffset
        elseif character == 'gf' then
            x,y = camX_gf,camY_gf
            offset = IndividualOffsets and offset_gf or GeneralOffset
        end
        local anim = getProperty(character..'.animation.curAnim.name')
            if anim:find('LEFT') then
                x = FlipDadX and character == 'dad' and x + offset or x - offset
                angle = FlipDadX and character == 'dad' and angle_right or angle_left
            elseif anim:find('RIGHT') then
                x = FlipDadX and character == 'dad' and x - offset or x + offset
                angle = FlipDadX and character == 'dad' and angle_left or angle_right
            elseif anim:find('UP') then
                y = y - offset
                angle = angle_up
            elseif anim:find('DOWN') then
                y = y + offset
                angle = angle_down
        end
        setProperty('camFollow.x',x)
        setProperty('camFollow.y',y)
        doTweenAngle('camGameAngle','camGame',(AngleSwitch and CamFix) and angle or 0,angleTime)
    end
end
function onEvent(n,v1,v2)
    if InfoEvent then
    if eventCooldown[n] and eventCooldown[n] > 0 then return end
    eventCooldown[n] = 0.2
    luaPrint('Event: '..n..(v1 ~= '' and '  Value1: '..v1 or '')..(v2 ~= '' and '  Value2: '..v2 or ''),'00FF00')
    end
    if v1 then v1 = string.lower(v1) end
    if n == 'CamFollowGeneral' or n == 'LifeDrain' then
        if v2 then v2 = string.lower(v2) end
        if v2 == 'true' or v2 == 't' then
            B = true
        elseif v2 == 'false' or v2 == 'f' then
            B = false
        end
    end
    if n == 'CamFollowGeneral' then
        if v1 == 'as' then  -- AngleSwitch
            AngleSwitch = B
        elseif v1 == 'cf' then -- CameraSpeedOff
            CameraSpeedOff = B
        elseif v1 == 'cs' then -- cameraSpeed
            cameraSpeed = tonumber(v2)
        elseif v1 == 'fd' then -- FlipDadX
            FlipDadX = B
        elseif v1 == 'fc' then  -- followCharacters
            followCharacters = B
        elseif v1 == 'io' then -- IndividualOffsets
            IndividualOffsets = B
        elseif v1 == 'go' then  -- GeneralOffset
            GeneralOffset = tonumber(v2)
        elseif v1 == 'at' then  -- angleTime
            angleTime = tonumber(v2)
        elseif v1 == 'al' then  -- angle_left
            angle_left = tonumber(v2)
        elseif v1 == 'ar' then  -- angle_right
            angle_right = tonumber(v2)
        elseif v1 == 'au' then  -- angle_up
            angle_up = tonumber(v2)
        elseif v1 == 'ad' then  -- angle_down
            angle_down = tonumber(v2)
        end
    elseif n == 'CamFollowPlayer' then
        local isAdd = string.find(v1,'Add')
            if CustomCam then
            if string.find(v1,'x') then  -- camX_player
            if isAdd then
                camX_playerEvent = tonumber(camX_playerEvent + v2)
            else
                camX_playerEvent = tonumber(v2)
            end
            elseif string.find(v1,'y') then  -- camY_player
            if isAdd then
                camY_playerEvent = tonumber(camY_playerEvent + v2)
            else
                camY_playerEvent = tonumber(v2)
            end
            elseif v1 == 'of' then  -- offset_player
            offset_player = tonumber(v2)
        end
    else
        if string.find(v1,'x') then  -- camX_player
            camX_playerEvent = tonumber(camX_playerEvent + v2)
        elseif string.find(v1,'y') then  -- camY_player
            camY_playerEvent = tonumber(camY_playerEvent + v2)
        elseif v1 == 'of' then  -- offset_player
            offset_player = tonumber(v2)
        end
    end
    elseif n == 'CamFollowOpponent' then
        local isAdd = string.find(v1,'Add')
            if CustomCam then
            if string.find(v1,'x') then  -- camX_opponent
            if isAdd then
                camX_opponentEvent = tonumber(camX_opponentEvent + v2)
            else
                camX_opponentEvent = tonumber(v2)
            end
            elseif string.find(v1,'y') then  -- camY_opponent
            if isAdd then
                camY_opponentEvent = tonumber(camY_opponentEvent + v2)
            else
                camY_opponentEvent = tonumber(v2)
            end
            elseif v1 == 'of' then  -- offset_opponent
            offset_opponent = tonumber(v2)
        end
    else
        if string.find(v1,'x') then  -- camX_opponent
            camX_opponentEvent = tonumber(camX_opponentEvent + v2)
        elseif string.find(v1,'y') then  -- camY_opponent
            camY_opponentEvent = tonumber(camY_opponentEvent + v2)
        elseif v1 == 'of' then  -- offset_opponent
            offset_opponent = tonumber(v2)
        end
    end
    elseif n == 'CamFollowGf' then
        local isAdd = string.find(v1,'Add')
            if CustomCam then
            if string.find(v1,'x') then  -- camX_gf
            if isAdd then
                camX_gfEvent = tonumber(camX_gfEvent + v2)
            else
                camX_gfEvent = tonumber(v2)
            end
            elseif string.find(v1,'y') then  -- camY_gf
            if isAdd then
                camY_gfEvent = tonumber(camY_gfEvent + v2)
            else
                camY_gfEvent = tonumber(v2)
            end
            elseif v1 == 'of' then  -- offset_gf
            offset_gf = tonumber(v2)
        end
    else
        if string.find(v1,'x') then  -- camX_gf
            camX_gfEvent = tonumber(camX_gfEvent + v2)
        elseif string.find(v1,'y') then  -- camY_gf
            camY_gfEvent = tonumber(camY_gfEvent + v2)
        elseif v1 == 'of' then  -- offset_gf
            offset_gf = tonumber(v2)
        end
    end
    elseif n == 'LifeDrain' then
        if v1 == 'ho' then  -- healthOp
            healthOp = B
        elseif v1 == 'qv' then  -- QuitaV
            QuitaV = tonumber(v2)
        elseif v1 == 'ld' then  -- LimiteDeVida
            LimiteDeVida = tonumber(v2)
        elseif v1 == 'pv' then  -- PocaVida
            PocaVida = B
        end
    end
end

--[[
| Evento: CamFollowGeneral |
Configuracion general.
- Value 1, Value 2:
  - AS: AngleSwitch. Valores: true, false.
  - CF: CameraSpeedOff, Valores: true, false
  - CS: Velocidad de la cámara. Valores: número.
  - FD: FlipDadX, Valores: true, false
  - FC: followCharacters. Valores: true, false.
  - IO: Desplazamientos individuales. Valores: true, false.
  - GO: Desplazamiento General. Valores: número.
  - AT: Tiempo del ángulo. Valores: número.
  - AL: Ángulo izquierdo. Valores: número.
  - AR: Ángulo derecho. Valores: número.
  - AU: Ángulo arriba. Valores: número.
  - AD: Ángulo abajo. Valores: número.
Ejemplos:
Value1: AS, Value2: true
Value1: CS, Value2: 1.8


| Evento: CamFollowPlayer |
Configura la cámara para seguir al jugador (boyfriend).
- Value 1, Value 2:
  - X: Posición X. Usa "Add" en Value 1 para sumar en Value 2.
  - Y: Posición Y. Usa "Add" en Value 1 para sumar en Value 2.
  - OF: Desplazamiento. Valores: número.
Ejemplos:
Value 1: X, Value 2: 750
Value 1: X,Add, Value 2: 50
Value 1: Y, Value 2: 650
Value 1: Y,Add, Value 2: 30
Value 1: OF, Value 2: 20


| Evento: CamFollowOpponent |
Configura la cámara para seguir al oponente (dad).
- Value 1, Value 2:
  - X: Posición X. Usa "Add" en Value 1 para sumar en Value 2.
  - Y: Posición Y. Usa "Add" en Value 1 para sumar en Value 2.
  - OF: Desplazamiento. Valores: número.
Ejemplos:
Value 1: X, Value 2: 650
Value 1: X,Add, Value 2: 40
Value 1: Y, Value 2: 650
Value 1: Y,Add, Value 2: 20
Value 1: OF, Value 2: 15


| Evento: CamFollowGf |
Configura la cámara para seguir a GF.
- Value 1, Value 2:
  - X: Posición X. Usa "Add" en Value 1 para sumar en Value 2.
  - Y: Posición Y. Usa "Add" en Value 1 para sumar en Value 2.
  - OF: Desplazamiento. Valores: número.
Ejemplos:
Value 1: X, Value 2: 550
Value 1: X,Add, Value 2: 30
Value 1: Y, Value 2: 620
Value 1: Y,Add, Value 2: 25
Value 1: OF, Value 2: 10


| Evento: LifeDrain |
Configura el robo de vida del oponente.
- Value 1, Value 2:
  - HO: healthOp. Valores: true, false.
  - QV: Quita vida. Valores: número.
  - LD: Limite de Vida. Valores: número.
  - PV: PocaVida. Valores: true, false.
Ejemplos:
Value1: HO, Value2: false
Value1: LD, Value2: 0.6
]]
