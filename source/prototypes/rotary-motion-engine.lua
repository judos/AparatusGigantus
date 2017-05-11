require "libs.prototypes.all"

-- Item
local indicator = deepcopy(data.raw["item"]["steam-turbine"])
overwriteContent(indicator, {
	name = "rotary-motion-engine",
	order = "b[steam-power]-d[steam-turbine]",
	place_result = "rotary-motion-engine",
	icon = "__AparatusGigantus__/graphics/icons/rotary-motion-engine.png",
})
data:extend({	indicator })

-- Recipe
data:extend({
	{
		type = "recipe",
		name = "rotary-motion-engine",
		enabled = false,
		ingredients = {
			{"steam-turbine", 12}, {"iron-gear-wheel", 200}, {"pipe", 250},
		},
		result = "rotary-motion-engine"
	}
})


-- Entity
local engine = deepcopy(data.raw["generator"]["steam-turbine"])
overwriteContent(engine, {
	name = "rotary-motion-engine",
	icon = "__base__/graphics/icons/steam-turbine.png",
  max_health = 3000,
	effectivity = 1,
	fluid_usage_per_tick = 20,
	fast_replaceable_group = nil,
	collision_box = {{-3.4, -7.4}, {3.4, 7.4}},
	selection_box = {{-3.5, -7.5}, {3.5, 7.5}},
	energy_consumption = "200MW",
})
engine.fluid_box.pipe_connections = {
	{ type = "input-output", position = {0, 8} },
  { type = "input-output", position = {0, -8} },
}

engine.energy_source.max_transfer = "40GW"
engine.energy_source.pipe_covers = nil
for _,sprite in pairs(engine.horizontal_animation.layers) do
	sprite.scale = (sprite.scale or 1) * 3
	sprite.hr_version.scale = (sprite.hr_version.scale or 1) * 3
end
for _,sprite in pairs(engine.vertical_animation.layers) do
	sprite.scale = (sprite.scale or 1) * 3
	sprite.hr_version.scale = (sprite.hr_version.scale or 1) * 3
end

engine.minable.result = "rotary-motion-engine"
data:extend({	engine })


addTechnologyUnlocksRecipe("nuclear-power","rotary-motion-engine")
