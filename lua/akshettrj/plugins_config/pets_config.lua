if not pcall(require, "pets") then
    return
end

local pets = require("pets")

pets.setup({
    row = 3, -- the row (height) to display the pet at (must be at least 1 and at most 10)
    col = 0, -- the column to display the pet at (set to high number to have it stay still on the right side)
    speed_multiplier = 1, -- you can make your pet move faster/slower. If slower the animation will have lower fps.
    default_pet = "cat", -- the pet to use for the PetNew command
    default_style = "brown", -- the style of the pet to use for the PetNew command
    random = true, -- wether to use a random pet for the PetNew command, ovverides default_pet and default_style
    death_animation = false, -- animate the pet's death, set to false to feel less guilt
    popup = { -- popup options, try changing these if you see a rectangle around the pets
        width = "30%", -- can be a string with percentage like "45%" or a number of columns like 45
        winblend = 100, -- winblend value - see :h 'winblend' - only used if avoid_statusline is false
        hl = { Normal = "Normal" }, -- hl is only set if avoid_statusline is true, you can put any hl group instead of "Normal"
        avoid_statusline = false, -- if winblend is 100 then the popup is invisible and covers the statusline, if that
        -- doesn't work for you then set this to true and the popup will use hl and will be spawned above the statusline (hopefully)
    }
})
