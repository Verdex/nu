
function make_fire( x, y )
    return { t = "fire" 
           ; x = x or 0 
           ; y = y or 0 
           ; lines = {}
           ; updated = 0
           }
           -- TODO collision
           -- TODO type of fire
end

function display_fire( f )

    local length = 10
    local mid = math.floor( length / 2 )
    love.graphics.setColor( 1, 0.647, 0, 0.75 ) -- TODO have multi colored fire

    for i, l in ipairs( f.lines ) do
        local i = i - 1
        love.graphics.line( f.x + i, f.y - l, f.x + i, f.y )
    end
end

function update_fire( f, delta )
    f.updated = f.updated + delta

    if f.updated > 0.1 then -- TODO experiment with different times
        f.updated = 0
    
        f.lines[1] = love.math.random( 1, 2 ) -- TODO experiment with different random ranges
        f.lines[2] = love.math.random( 4, 6 )
        f.lines[3] = love.math.random( 4, 7 )
        f.lines[4] = love.math.random( 5, 9 )
        f.lines[5] = love.math.random( 7, 10 )
        f.lines[6] = love.math.random( 8, 10 )
        f.lines[7] = love.math.random( 5, 9 )
        f.lines[8] = love.math.random( 4, 7 )
        f.lines[9] = love.math.random( 3, 6 )
        f.lines[10] = love.math.random( 1, 2 )

    end
     
end
