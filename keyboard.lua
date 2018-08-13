
local move_mode = {}

north = {}
east = {}
south = {}
west = {}

function init_keyboard()
    mode_keyboard = move_mode
end

function handle_keypress( key, hero )
    if mode_keyboard == move_mode then
        handle_move( key, hero )
    end
end

function handle_keyrelease( key, hero )
    if mode_keyboard == move_mode then
        handle_stop( key, hero )
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
