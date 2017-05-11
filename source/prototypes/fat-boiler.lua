require "libs.prototypes.all"

-- Item
local indicator = deepcopy(data.raw["item"]["heat-exchanger"])
overwriteContent(indicator, {
	name = "fat-boiler",
	order = "f[nuclear-energy]-c[heat-exchanger]",
	place_result = "fat-boiler",
	icon = "__AparatusGigantus__/graphics/icons/fat-boiler.png",
})
data:extend({	indicator })

-- Recipe
data:extend({
	{
		type = "recipe",
		name = "fat-boiler",
		enabled = false,
		ingredients = {
			{"steel-plate", 80}, {"heat-exchanger", 10}, {"pipe", 100},
		},
		result = "fat-boiler"
	}
})


-- Entity
local fatBoiler = deepcopy(data.raw["boiler"]["heat-exchanger"])
overwriteContent(fatBoiler, {
	name = "fat-boiler",
	icon = "__AparatusGigantus__/graphics/icons/fat-boiler.png",
	max_health = 2000,
	collision_box = {{-4.4, -2.9}, {4.4, 2.9}},
  selection_box = {{-4.5, -3}, {4.5, 3}},
	energy_consumption = "200MW",
})
fatBoiler.fluid_box.pipe_connections = {
	{type = "input-output", position = {-5, 1.5}},
	{type = "input-output", position = {5, 1.5}}
}
fatBoiler.output_fluid_box.pipe_connections = {
	{type = "output", position = {0, -3.5}}
}
fatBoiler.energy_source.connections = {
	{
		position = {0, 2.5},
		direction = defines.direction.south
	}
}
fatBoiler.energy_source.max_transfer = "40GW"
fatBoiler.energy_source.pipe_covers = nil
for _, arr in pairs(fatBoiler.structure) do
	local layer = arr.layers
	for _,sprite in pairs(layer) do
		sprite.scale = 3
		sprite.hr_version.scale = 1.5
	end
end


fatBoiler.minable.result = "fat-boiler"
data:extend({	fatBoiler })


addTechnologyUnlocksRecipe("nuclear-power","fat-boiler")
