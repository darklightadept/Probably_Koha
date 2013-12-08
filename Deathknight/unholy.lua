-- ProbablyEngine Rotation Packager
-- Custom Unholy Death Knight Rotation
-- Created on Nov 3rd 2013 6:30 am
ProbablyEngine.rotation.register_custom(252, "DKUnholyKoha", {

--Presence Checks
	{ "48265", "!player.buff(48265)" }, --Unholy Presence

--Trinket Procs
{ "#gloves" },
	{ "#trinket1", "player.buff(53365)" }, --trinket on Unholy Strength
	{ "#trinket2", "player.buff(53365)" },
	
	--Auto Target Enemy 
  { "!/targetenemy [noharm]", {
	"target.range < 8",
    "!target.alive", 
	"!target.enemy",
	"!target.exists",
  }},

--Racial Cooldowns
	{ "26297", { "player.spell(26297).exists", "modifier.cooldowns" }}, --Berserking
	{ "20572", { "player.spell(20572).exists", "modifier.cooldowns" }}, --Blood Fury
--Pet
	{ "46584", "!pet.exists" }, --raise ghoul

-- Cooldowns
  	{ "49016", "modifier.cooldowns" }, --unholy frenzy
  	{ "49206", "modifier.cooldowns" }, --Summon Gargoye
	{ "Empower Rune Weapon", { 
	"modifier.cooldowns", 
	"player.runicpower <= 25", 
	"player.runes(death).count = 0", 
	"player.runes(frost).count = 0", 
	"player.runes(unholy).count = 0" 
	}}, 

-- hard cast dnd
  	{ "43265", "modifier.shift", "ground" }, --Death and Decay

--Interupts
	{ "47528", "modifier.interrupts" },  --MindFreeze
	{ "108194", { "player.spell(108194).exists", "modifier.interrupts" }}, --Asphyxiate

 -- Survival
	{ "48707", "player.health < 70" }, --Anti-Magic Shell
	{ "49998", "player.health < 50" }, --Death Strike
	{ "108196", "player.health < 80" }, --Death Siphon
	{ "48792", "player.health < 30" }, --Icebound Foritude1

  --Dots Tracking
	{ "77575", {
	"!target.debuff(Frost Fever)",
	}},

-- Refresh dots with hard casts
	{ "45462", "target.debuff(Blood Plague).duration < 4" },
 --Plauge Leech Support
	{ "123693", {
	"player.spell(123693).exists",
	"target.debuff(Frost Fever)",
	"target.debuff(Blood Plague).duration < 7",
	"player.rune(Unholy).count <= 1",
	"player.rune(Frost).count <= 1",
	}},

--AOE
{{
{ "115989", {
	"player.spell(115989).exists",
	"target.range <= 8",
	}},
{ "Blood Boil", {
	"target.range <= 5",
	"target.debuff(Frost Fever)",
	"target.debuff(Blood Plague)",
	}},
	{ "Death Coil", "player.buff(Sudden Doom)" },
{ "Death Coil", "player.runicpower >= 32"},
}, "modifier.multitarget", },
-- Rotation
{ "Dark Transformation" },
{ "Death Coil", "player.buff(Sudden Doom)" },
{ "Death Coil", "player.runicpower >= 32"},
{ "Soul Reaper", "target.health < 35" },
{ "Festering Strike", {
	"player.runes(Blood).count >= 1",
	"player.runes(frost).count >= 1",
	}},
{ "Scourge Strike" },
{ "45529", "player.buff(114851).count >= 5" },
{ "57330" },

-- Out Of Combat
},
{
--Presence Checks
{ "48265", "!player.buff(48265)" },
{ "42650", "modifier.alt" },
{ "59057", "modifier.shift", "ground" },

  }
)