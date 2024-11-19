--[[ 
[Español]
    |HUD MINI SIMPLE v4 Pre-release 0.5 | Psych Engine 0.6.3 -> 1.0 | |LuaXdea|

Este script te permite personalizar el HUD (la interfaz) en Psych Engine de forma sencilla "Creo". Añade opciones como animación de los iconos, ajustes de la cámara y reducción de salud del oponente. Esta v4 es la última actualización por este mes se volvera a actualizar el script completo en fines de diciembre o inicios de enero del 2025.

[Youtube]: https://youtube.com/@lua-x-dea?si=vH4ommC_t3CGrDqn
[Gamebanana]: https://gamebanana.com/mods/502653
[Github]: https://github.com/Contra-Sakar/HUD-MINI-SIMPLE
]]

-- | HUD MINI SIMPLE | Ajustes |
-- | True: Activado | false: Desactivado |

-- | Ajustes de personalización |
local IconAnim = false -- Animación de iconos [default false]
local IconAnimExtra = true -- Animación extra para los iconos [default true]
local MiddlescrollON = true -- HUD personalizado para middlescroll [default true]
local MiddleScrollToggle = false -- Puedes denegar que se active el middlescroll [default false]
local HideBotplayTxt = true -- Opción para ocultar el texto de botplay [default true]
local CoverMode = false -- Activa el modo Cover donde todo el HUD MINI SIMPLE y algunas cosas mas se vuelve de una opacidad menor y se activa automáticamente el botplay [default false]


-- | ScoreMini |
local ScoreTxtMini = true -- Opción para que se vean el ScoreMini y MissesMini [default true]
local TimeScoreMini = 0.3 -- El tiempo que tardará en llegar a la nueva puntuación [defecto 0.3]
local ColorScoreMini = '00FF00' -- El color que se volverá el ScoreMini cuando se gana puntos [defecto Hex 00FF00 (Verde)]


-- | Ayuda de eventos |
local InfoEvent = false -- Te permite ver qué eventos se está usando en el momento con su configuración de Value 1 y Value 2 [default false]
local TextoFont = 'MAHAWA__.TTF' -- Aquí puedes elegir que fuente de letra quieres usar para el [InfoEvent] (default MAHAWA__.TTF)


-- | Escala de cámaras |
local CamScale = false -- Es para aumentar la escala de las camaras (default false)
local CamerasScale = {'camGame','camHUD','camOther'} -- Elige las camaras que quieres cambiar su escala (default {'camGame','camHUD','camOther'} )
local CamScaleX = 1.03 -- Escala horizontal (default 1.03)
local CamScaleY = 1.03 -- Escala vertical (default 1.03)


-- | Intro |
local IntroLua = true -- Activa una intro que se ve cuando inicia cualquier nivel (default false)
local AnimMini = 2 -- Animaciones de entrada: 0 = normal, 2 = izquierda a derecha, 3 = derecha a izquierda, 4 = arriba a abajo, 5 = abajo a arriba, 6 = Cara, 7 = Centro. (default 2)
local ColorMode = 2 -- 1 = solo un color, 2 = ajedrez, 3 = aleatorio, 4 = columnas de 2 colores, 5 = Random color custom. (default 2)
local SingleColor = '000000' -- Color unico (default Hex 000000 (Negro))
local color1 = 'FFFFFF' -- Color primario (default Hex FFFFFF (Blanco))
local color2 = '000000' -- Color secundario (default Hex 000000 (Negro))
local customColors = {'000000','FFFFFF','FF0C00'} -- Random color Custom (default Hex {'000000','FFFFFF','FF0C00'}) [Requiere ColorMode = 5]
local ColorFace = 'CCCCCC' -- Puedes elegir el color que va ser la cara pixel (default Hex CCCCCC) [Requiere AnimMini = 6]
local CamIntro = 'camHUD' -- La cámara donde sera la Intro recomendable [camHUD o camOther] (default camHUD)


-- | Configuración de reducción de salud del oponente |
local healthOp = true -- Activar o desactivar la reducción de salud [default true]
local QuitaV = 0.012 -- Reducción de salud [default 0.012]
local LimiteDeVida = 0.4 -- Reducción Maxima [default 0.4]
local PocaVida = true -- El icono del bf parpadea cuando la vida es por debajo de 0.4 [default true]


-- | Configuración de CamFollow |
local CustomCam = false -- Si quieres usar la poción de la cámara por defecto de los personajes (false) o personalizada (true) [default false] [beta]
local FlipDadX = false -- Cuando FlipDadX esta en true, LEFT aumenta X y RIGHT la disminuye; de lo contrario, LEFT disminuye X y RIGHT la aumenta [default false]
local IndividualOffsets = false -- Es para si quieres usar los Offsets por individual cada uno [default false]
local GeneralOffset = 17 -- Reemplaza a los offsets de dad,boyfriend y gf si el IndividualOffsets está en false [default 17]
local AngleSwitch = false -- Inclinar Cámara [default false]
local angleTime = 0.8 -- Velocidad de Angle [default 0.8]
local followCharacters = true -- CamFollow [default true]
local CameraSpeedOff = false -- Puedes desactivar el cameraSpeed en el script si ya tienes en otro script que ya hace lo mismo, es para evitar problemas si otro script esta usando el cameraSpeed (default false)
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
local offset_gf = 25

-- | Ángulos generales | [Recomendable usar zCameraFix para Psych Engine 0.7.x, 1.0 Pre y 1.0]
-- angle: es cuánto se inclinara la cámara
local angle_left = 3
local angle_right = -3
local angle_up = 0
local angle_down = 0

local function configureHUD()
    if CoverMode then
        setProperty('comboGroup.alpha',0.2)
        setProperty('cpuControlled',true)
    local CoverModeTabla = {'iconP1','iconP2','healthBar','healthBarBG','timeBar','timeBarBG','timeTxt'}
        for _,ModeAlpha in pairs(CoverModeTabla) do setProperty(ModeAlpha..'.alpha',0.5) end
        for j = 0,7 do
            setPropertyFromGroup('strumLineNotes',j,'alpha',0.5)
            setPropertyFromGroup('unspawnNotes',j,'visible',false)
        end
    end
    if not MiddleScrollToggle and MiddlescrollON and middlescroll then
        setProperty('iconP1.x',1120)
        setProperty('iconP1.y',downscroll and 590 or 0)
        setProperty('iconP2.x',10)
        setProperty('iconP2.y',downscroll and 590 or 15)
        setProperty('healthBar.x',335)
        setProperty('healthBar.y',downscroll and 675 or 35)
        setProperty('healthBar.scale.x',0.5)
        setProperty('healthBarBG.scale.x',0.5)
        setProperty('timeBar.x',380)
        setProperty('timeBar.y',downscroll and 695 or 13)
        setProperty('timeBar.scale.x',0.4)
        setProperty('timeBarBG.scale.x',0.4)
        setProperty('timeTxt.x',500)
        setProperty('timeTxt.y',downscroll and 690 or 5)
        setProperty('ScoreMini.x',10)
        setProperty('ScoreMini.y',10)
        setProperty('MissesMini.x',10)
        setProperty('MissesMini.y',30)
        setProperty('botplayTxt.visible',not HideBotplayTxt)
    else
        setProperty('iconP1.x',144)
        setProperty('iconP1.y',downscroll and 0 or 590)
        setProperty('iconP2.x',20)
        setProperty('iconP2.y',downscroll and 0 or 590)
        setProperty('healthBar.x',-140)
        setProperty('healthBar.y',downscroll and 130 or 570)
        setProperty('healthBar.scale.x',0.5)
        setProperty('healthBarBG.scale.x',0.5)
        setProperty('timeBar.x',-105)
        setProperty('timeBar.y',downscroll and 155 or 550)
        setProperty('timeBar.scale.x',0.4)
        setProperty('timeBarBG.scale.x',0.4)
        setProperty('timeTxt.x',40)
        setProperty('timeTxt.y',downscroll and 145 or 540)
        setProperty('ScoreMini.x',20)
        setProperty('ScoreMini.y',downscroll and 175 or 525)
        setProperty('MissesMini.x',20)
        setProperty('MissesMini.y',downscroll and 195 or 505)
        setProperty('botplayTxt.visible',not HideBotplayTxt)
    end
    setProperty('scoreTxt.visible',false)
end
local function animateIconsExtra(elapsed)
    if IconAnimExtra then
        setProperty('iconP1.scale.y',math.sin(elapsed * 0.5) * 0.05 + 1)
        setProperty('iconP2.scale.y',math.cos(elapsed * 0.5) * 0.05 + 1)
    end
end
function onBeatHit()
    if IconAnim then
        local angle = curBeat % 2 == 0 and -9 or 9
        setProperty('iconP1.angle',angle)
        setProperty('iconP2.angle',-angle)
        doTweenAngle('return1','iconP1',0,0.25 / playbackRate,'circOut')
        doTweenAngle('return2','iconP2',0,0.25 / playbackRate,'circOut')
    end
    if PocaVida and getProperty('health') < 0.4 then
        setProperty('iconP1.alpha',0.3)
        doTweenAlpha('iconP1Alpha','iconP1',1,0.4)
    else
        doTweenAlpha('iconP1AlphaNormal','iconP1',1,0.5)
    end
end
function onCamScale()
    if CamScale then
    for _,Cam in pairs(CamerasScale) do
        setProperty(Cam..'.flashSprite.scaleX',CamScaleX)
        setProperty(Cam..'.flashSprite.scaleY',CamScaleY)
    end
    end
end
function opponentNoteHit()
    if healthOp and health > LimiteDeVida then setHealth(health - QuitaV) end
end
function onSongStart()
    if not CoverMode and not getProperty('cpuControlled') then
        doTweenAlpha('ScoreMiniAlpha','ScoreMini',1,0.5)
        doTweenAlpha('MissesMiniAlpha','MissesMini',1,0.5)
    else
        removeLuaText('ScoreMini')
        removeLuaText('MissesMini')
    end
    onSongStartIntro()
end
function onCreate()
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
    defaultOptions()
    onIntro()
end
function defaultOptions()
    if version == '0.6.3' then
    MiddlescrollDefault = getPropertyFromClass('ClientPrefs','middleScroll')
    SplashAlpha = getPropertyFromGroup('grpNoteSplashes',0,'alpha')
    if MiddleScrollToggle then
    setPropertyFromClass('ClientPrefs','middleScroll',false)
    else
    setPropertyFromClass('ClientPrefs','middleScroll',MiddlescrollDefault)
    end
    setProperty('grpNoteSplashes.alpha',CoverMode and 0.3 or SplashAlpha)
    else
    MiddlescrollDefault = getPropertyFromClass('backend.ClientPrefs','data.middleScroll')
    SplashAlpha = getPropertyFromClass('backend.ClientPrefs','data.splashAlpha')
    if MiddleScrollToggle then
    setPropertyFromClass('backend.ClientPrefs','data.middleScroll',false)
    else
    setPropertyFromClass('backend.ClientPrefs','data.middleScroll',MiddlescrollDefault)
    end
    setPropertyFromClass('backend.ClientPrefs','data.splashAlpha',CoverMode and 0.3 or SplashAlpha)
    end
end
function CoverModeSplash()
    for i = 0,getProperty('grpNoteSplashes.length') - 1 do
setPropertyFromGroup('grpNoteSplashes',i,'alpha',CoverMode and 0.3 or SplashAlpha)
    end
end
function onDestroy()
    if version == '0.6.3' then
    setPropertyFromClass('ClientPrefs','middleScroll',MiddlescrollDefault)
    else
    setPropertyFromClass('backend.ClientPrefs','data.splashAlpha',SplashAlpha)
    setPropertyFromClass('backend.ClientPrefs','data.middleScroll',MiddlescrollDefault)
    end
end
function onCreatePost()
    CamDefault()
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
end
function onUpdatePost(elapsed)
    configureHUD()
    onCamScale()
    onCamFollowPos()
    ObjectOrderPost()
    animateIconsExtra(elapsed)
    ScoreMiniPost(elapsed)
end
function ObjectOrderPost()
    setObjectOrder('ScoreMini',getObjectOrder('scoreTxt') + 1)
    setObjectOrder('MissesMini',getObjectOrder('scoreTxt') + 1)
end
local size,cols,rows = 40,32,18
local facePixels = {
{11,6},{12,6},{13,6},
{11,7},{12,7},{13,7},            {17,7},{18,7},{19,7},

{11,10},                                      {19,10},
     {12,11},                              {18,11},
        {13,12},{14,12},{15,12},{16,12},{17,12}
}
function onIntro()
    if IntroLua then
    for i = 0,cols - 1 do
        for j = 0,rows - 1 do
            local id = 'sq'..(i * rows + j)
            local color = SingleColor
            local isFacePixel = false
            if AnimMini == 6 then
                for _, pos in ipairs(facePixels) do
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
                    color = string.format('%06X',math.random(0x000000,0xFFFFFF))
                elseif ColorMode == 4 then
                    color = (i % 2 == 0) and color1 or color2
                elseif ColorMode == 5 then
                    color = customColors[math.random(#customColors)]
                end
            end
            makeLuaSprite(id,nil,i * size,j * size)
            makeGraphic(id,size,size,color)
            if version == '1.0' then
            setProperty(id..'.camera',instanceArg(CamIntro),false,true)
            else
            setObjectCamera(id,CamIntro)
            end
            addLuaSprite(id)
        end
    end
    end
end
function onSongStartIntro()
    if IntroLua then
        if AnimMini == 6 then
        animateSmileFace()
        elseif AnimMini == 7 then
        animateFromCenterOut()
        else
        standardAnimation()
        end
    end
end
function animateSmileFace()
local facePixels = {
{11,6},{12,6},{13,6},
{11,7},{12,7},{13,7},            {17,7},{18,7},{19,7},

{11,10},                                      {19,10},
     {12,11},                              {18,11},
        {13,12},{14,12},{15,12},{16,12},{17,12}
}
    local baseTime,delayInc,alphaDelay = 0.2,0.03,0.15
    for _,pos in ipairs(facePixels) do
        local id = 'sq'..(pos[1] * rows + pos[2])
        doTweenX(id..'_scX',id..'.scale',0.01,baseTime)
        doTweenY(id..'_scY',id..'.scale',0.01,baseTime)
        runTimer(id..'_fade',alphaDelay)
    end
    for i = 0,cols - 1 do
        for j = 0,rows - 1 do
            local id = 'sq'..(i * rows + j)
            local isFacePixel = false
            for _, pos in ipairs(facePixels) do
                if pos[1] == i and pos[2] == j then
                    isFacePixel = true
                    break
                end
            end
            if not isFacePixel then
                local delay = (i + j) * delayInc + baseTime
                doTweenX(id..'_scX',id..'.scale',0.01, delay)
                doTweenY(id..'_scY',id..'.scale',0.01, delay)
                runTimer(id..'_fade',delay + alphaDelay)
            end
        end
    end
end
function animateFromCenterOut()
    local centerX,centerY = 1280 / 2, 720 / 2
    local baseTime,delayInc,alphaDelay = 0.03,0.002,0.1
    local squares = {}
    for i = 0,cols - 1 do
        for j = 0,rows - 1 do
            local id = 'sq'..(i * rows + j)
            local x,y = i * size + size / 2,j * size + size / 2
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
    local baseTime = (AnimMini == 0) and 0.5 or 0.15
    local delayInc = (AnimMini == 0) and 0 or 0.03
    local alphaDelay = (AnimMini == 0) and 0.15 or 0.07
    local limit = (AnimMini < 4) and 31 or 17
    local isColumn = (AnimMini < 4)
    local reverse = (AnimMini == 3) or (AnimMini == 5)
    for i = 0,limit do
        local index = reverse and (limit - i) or i
        local delay = index * delayInc
        local scaleTime = baseTime + delay
        for j = 0, (isColumn and 17 or 31) do
            local id = 'sq'..(isColumn and (i * 18 + j) or (j * 18 + i))
            doTweenX(id..'_scX',id..'.scale',0.01,scaleTime)
            doTweenY(id..'_scY',id..'.scale',0.01,scaleTime)
            runTimer(id..'_fade',delay + alphaDelay)
        end
    end
end
function onTimerCompletedIntro(t)
    if t:find('_fade') then
        local id = tag:gsub('_fade','')
        doTweenAlpha(id..'_alpha',id,0,0.5)
  end
end
local activeTexts = {}
local maxTexts, textDuration,yOffsetStep,baseX,baseY,offsetXNewText = 6,5,25,0,200,400
local eventCooldown = {}
function customPrint(message)
    if #activeTexts >= maxTexts then
        local oldestText = table.remove(activeTexts,1)
        doTweenAlpha(oldestText.tag..'FadeQuick',oldestText.tag,0,0.15,'linear')
        runTimer('removeOldText'..oldestText.tag,0.15)
    end
    local textTag = 'customText'..math.random(10000)
    for i, textData in ipairs(activeTexts) do
        doTweenY(textData.tag..'MoveDown',textData.tag,baseY + (i * yOffsetStep),0.3,'linear')
    end
    makeLuaText(textTag,message,1000,baseX + offsetXNewText,baseY + 300)
    setTextSize(textTag,14)
    setTextBorder(textTag,0.1,'000000')
    setTextColor(textTag,'00FF00')
    setTextAlignment(textTag,'left')
    setTextFont(textTag,TextoFont or 'vcr.ttf')
    setProperty(textTag..'.alpha',0)
    if version == '1.0' then
    setProperty(textTag..'.camera',instanceArg('camOther'),false,true)
    else
    setObjectCamera(textTag,'camOther')
    end
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
    camX_playerDefault = getMidpointX('boyfriend') - getProperty('boyfriend.cameraPosition[0]') - getProperty('boyfriendCameraOffset[0]') - 100
    camY_playerDefault = getMidpointY('boyfriend') + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]') - 100
    camX_opponentDefault = getMidpointX('dad') + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]') + 150
    camY_opponentDefault = getMidpointY('dad') + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]') - 100
    camX_gfDefault = getMidpointX('gf') + getProperty('gf.cameraPosition[0]') + getProperty('girlfriendCameraOffset[0]')
    camY_gfDefault = getMidpointY('gf') + getProperty('gf.cameraPosition[1]') + getProperty('girlfriendCameraOffset[1]')
    end
    camX_opponentEvent = CustomCam and camX_opponent or camX_opponentDefault
    camY_opponentEvent = CustomCam and camY_opponent or camY_opponentDefault
    camX_playerEvent = CustomCam and camX_player or camX_playerDefault
    camY_playerEvent = CustomCam and camY_player or camY_playerDefault
    camX_gfEvent = CustomCam and camX_gf or camX_gfDefault
    camY_gfEvent = CustomCam and camY_gf or camY_gfDefault
end
function onCamFollowPos()
    if not CameraSpeedOff then
    setProperty('cameraSpeed',cameraSpeed)
    end
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
            x,y = camX_opponentEvent,camY_opponentEvent
            offset = IndividualOffsets and offset_opponent or GeneralOffset
        elseif character == 'boyfriend' then
            x,y = camX_playerEvent,camY_playerEvent
            offset = IndividualOffsets and offset_player or GeneralOffset
        elseif character == 'gf' then
            x,y = camX_gfEvent,camY_gfEvent
            offset = IndividualOffsets and offset_gf or GeneralOffset
        end
        local anim = getProperty(character..'.animation.curAnim.name')
        if FlipDadX and character == 'dad' then
            if anim:find('LEFT') then
                x = x + offset
                angle = angle_right
            elseif anim:find('RIGHT') then
                x = x - offset
                angle = angle_left
            elseif anim:find('UP') then
                y = y - offset
                angle = angle_up
            elseif anim:find('DOWN') then
                y = y + offset
                angle = angle_down
            end
        else
            if anim:find('LEFT') then
                x = x - offset
                angle = angle_left
            elseif anim:find('RIGHT') then
                x = x + offset
                angle = angle_right
            elseif anim:find('UP') then
                y = y - offset
                angle = angle_up
            elseif anim:find('DOWN') then
                y = y + offset
                angle = angle_down
            end
        end
        setProperty('camFollow.x',x)
        setProperty('camFollow.y',y)
        if AngleSwitch then
            doTweenAngle('camGameAngle','camGame',angle,angleTime)
        else
            doTweenAngle('camGameAngle','camGame',0,angleTime)
        end
    end
end
function onEvent(n,v1,v2)
    if InfoEvent then
    if eventCooldown[n] and eventCooldown[n] > 0 then return end
    eventCooldown[n] = 0.2
    customPrint('Event: '..n..(v1 ~= '' and '  Value1: '..v1 or '')..(v2 ~= '' and '  Value2: '..v2 or ''))
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
        elseif v1 == 'io' then  -- IndividualOffsets
            IndividualOffsets = B
        elseif v1 == 'go' then  -- IndividualOffsets
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
            if string.find(v1, 'x') then  -- camX_gf
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
