
dofile "effects.lua"
dofile "keyboard.lua"



function love.load()

    init_keyboard()

    hero = { x = 0; y = 0; move = false; speed = 5 }

    fire = make_fire( 300, 300 )
   
end

function love.update( delta )

    update_fire( fire, delta )

    if hero.move then
        if hero.move == north then hero.y = hero.y - hero.speed 
        elseif hero.move == east then hero.x = hero.x + hero.speed
        elseif hero.move == south then hero.y = hero.y + hero.speed
        elseif hero.move == west then hero.x = hero.x - hero.speed 
        end
    end
end

function love.draw()


-- TODO need display  order

    love.graphics.setColor( 1, 1, 1 )
    love.graphics.print( "@", hero.x, hero.y )

    display_fire( fire )

    -- TODO need facing
    -- TODO need world redraw

end

function love.keypressed( key )
    handle_keypress( key, hero )
end

function love.keyreleased( key )
    handle_keyrelease( key, hero )
end
