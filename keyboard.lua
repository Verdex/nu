
local move_mode = {}
local command_mode = {}
local null_mode = {}

local command = ''
local rshift = false
local lshift = false

local keyShiftDict = { ['1'] = '!'
                     ; ['2'] = '@'
                     }

north = {}
east = {}
south = {}
west = {}

function init_keyboard()
    mode_keyboard = null_mode 
    command = ''
end

function shift_key( key )
    if string.match( key, '%a' ) then return string.upper( key )
    else return keyShiftDict[key]
    end
end

function handle_keypress( key, hero )
    if lshift or rshift then
        key = shift_key( key )
    end

    if key == "escape" then
        mode_keyboard = null_mode
    elseif key == "lshift" then 
        lshift = true
    elseif key == "rshift" then
        rshift = true
    elseif mode_keyboard == null_mode and key == ":" then
       mode_keyboard = command_mode
    elseif mode_keyboard == null_mode and key == "m" then
        mode_keyboard = move_mode 
    elseif mode_keyboard == move_mode then
        handle_move( key, hero )
    elseif mode_keyboard == command_mode then
        command = command .. key
    end
end

function handle_keyrelease( key, hero )
    if mode_keyboard == move_mode then
        handle_stop( key, hero )
    elseif key == "lshift" then
        lshift = false 
    elseif key == "rshift" then
        rshift = false 
    end
end

function handle_move( key, hero )
    if key == 'h' then
        hero.move = west
    elseif key == 'j' then
        hero.move = south 
    elseif key == 'k' then
        hero.move = north 
    elseif key == 'l' then
        hero.move = east 
    end
end

function handle_stop( key, hero )
    
    if     key == 'h' 
        or key == 'j'
        or key == 'k'
        or key == 'l' then

        hero.move = false
    end
end

function getCommand_keyboard()
    return command
end
