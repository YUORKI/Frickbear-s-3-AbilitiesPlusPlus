---------------------------------------- PARAMETERS ----------------------------------------

"animatronics":
	Your starting roster of animatronics. Defaults to [ 16 ] (the Marionette). Every extra animatronic added will lower the round 1 quota by 1, so be sure to modify "starting_quota_increase" if you want to force the player to take on more animatronics.

"unkillable_animatronics":
	Makes these animatronics unable to be removed through any means (Browboy, Ultra Deathcoin, Ultra Hook, Deathcoin, Mini-Reaper, Ultra Bomb, Prize King).

"upgrades":
	The upgrades you start out with. These will remain in your inventory even if you switch to another guard. Be careful about giving the player multiple upgrades from the same upgrade tree (i.e. having both Overcharge and Overcharge+); It could lead to some unforeseen issues!

"minigames":
	The minigames you start out with. Leaving this array blank will leave you with no minigames to start out with. Default is [ 1 , 2 , 8 ] for Air Adventure, Chomping With Chica and Mangle Tangle Mania respectively.

"blacklist_minigames":
	The minigames you want to disable from appearing in the shop.

"consumables":
	The consumables you start out with. These will remain in your inventory even if you switch to another guard.

"perma_challenge":
	Applies a permanent Eleanor challenge. This can stack with other Eleanor challenges gotten ingame.

"extra_money":
	The amount of extra money on top of the base $30 (or $50 in party mode) you start out with. Can be negative.

"boosted_animatronics":
	Animatronics that will have a boosted appearance rate during selection, effectively allowing you to give your guard a custom Bobbiedot regimen.

"boosted_shops":
	Shops that will be guaranteed to appear between rounds whenever possible. 

"disabled_shops":
	Shops that will be made inaccessible via the selection and Ultra Doorway menu. 

"natural_regimen":
	Provides the effect of any Bobbiedot regimen, and can stack with abilities and regimens gotten ingame. 

"upgrades_purchasable":
	If set to false, upgrades will no longer be acquirable, and Rockstar Freddy's shop will be disabled.

"cartridges_purchasable":
	If set to false, minigame cartridges will no longer be acquirable, and Rockstar Bonnie and Carnie's shops will be disabled. Also prevents the Flashcart upgrade from appearing.

"consumables_purchasable":
	If set to false, consumables will no longer be acquirable, and Rockstar Chica's shop will be disabled.

"starting_power":
	The amount of power you start with each night.

"starting_tokens":
	The amount of tokens you start with each night. Can be negative. 

"starting_hour":
	Sets what hour you start in. 1 - 12 AM | 2 - 3 AM | 3 - 4 AM | 4 - 4:30 AM

"inventory_size":
	The amount of items you can carry during the office section.  

"minigame_token_multiplier":
	A multiplier applied to token earnings from minigames. 

"blocked_token_multiplier":
	A multiplier applied to token earnings from minigames. 

"minigame_power_gain":
	The amount of power gained for each token earned from minigames. Default is 0 for most guards, except for Sally whose default is 0.25.

"power_bonus_multiplier":
	A multiplier applied to the end-of-night bonus for leftover power. 

"token_bonus_multiplier":
	A multiplier applied to the end-of-night bonus for leftover tokens. 

"salvage_bonus_multiplier":
	A multiplier applied to the salvage values of animatronics picked during selection or in FazEnt Representative's shop. 

"shop_discount":
	A multiplier applied to shop prices.

"power_rate":
	The rate at which your power decreases during nights.

"temperature_rate":
	The rate at which your temperature increases during nights.

"aggro_multiplier":
	A multiplier applied to the AI levels of animatronics. Cannot set active characters' AI levels any lower than 1 or any higher than 20.

"ai_limit":
	Changes the limit of the AI levels of animatronics. Cannot set active characters' AI levels any lower than 1 or any higher than 35.

"starting_quota_increase":
	The amount to increase your starting quota by. Determines the amount of animatronics you need to select on Round 1. Can be negative.

"nightly_quota_increase":
	The amount to increase your nightly quota by. Determines the amount of animatronics you need to select each round past Round 1. Can be negative.

"point_goal_base":
	Only used for abilities 8 (The Boss) and 19 (Sally); Determines your base point quota. Can be negative.

"point_goal_nightly":
	Only used for abilities 8 (The Boss) and 19 (Sally); Determines how much your point quota increases each round. Can be negative.

"randomize_minigames":
	Determines if your set of minigames is set or randomized (like Sally) each round. If set to false, all minigames will be set even if using Sally's ability.

"panic_meter_tied": --- WIP currently having issues with the mask
	Determines where or how you can decrease the panic meter. 0 - Windows | 1 - Mask 

---- IDs (NOTE: This category contains the names of EVERY animatronic and guard in the name. Don't read any further if you wanna avoid spoilers!) ----

ANIMATRONICS:

 0. Freddy
 1. Bonnie
 2. Chica
 3. Foxy
 4. GoldenFreddy
 5. Endoskeleton
 6. ToyFreddy
 7. ToyBonnie
 8. ToyChica
 9. Mangle
10. WitheredFreddy
11. WitheredBonnie
12. WitheredChica
13. WitheredFoxy
14. BB
15. JJ
16. Marionette
17. ShadowFreddy
18. RWQFSFASXC
19. Phantoms
20. Springtrap
21. Plushtrap
22. NightmareFredbear
23. NightmareBB
24. Nightmarionne
25. Lolbit
26. Baby
27. FuntimeFreddy
28. FuntimeFoxy
29. Ballora
30. Helpy
31. MusicMan
32. MrHippo
33. Lefty
34. MoltenFreddy
35. ScrapBaby
36. Wolf
37. Malhare
38. Dreadbear
39. LolzHax
40. Coffee
41. Animdude
42. Chipper
43. Sparky
44. Candy
45. Popgoes
46. Rodney
47. JackOBonnie
48. JackOChica
49. NightmareMangle
50. Security
51. Deedee
52. ChicasMagicRainbow
53. Ennard
54. Yenndo
55. Bonnet
56. Electrobab
57. TrashGang
58. MrHugs
59. HappyFrog
60. Pigpatch
61. NeddBear
62. Orville
63. Scraptrap
64. GrimmFoxy
65. FreddyFrostbear
66. GlamrockFreddy
67. Roxy
68. Monty
69. GlamrockChica
70. SunMoon
71. MXES
72. VeryInformativePig
73. Mimic
74. Jackie
75. BigTop
76. CaptainCobalt
77. WhiteTiger
78. SleepyMoon
79. Doofas
80. Blank
81. Archie
82. Bon
83. VladClara
84. Reagent
85. IgnitedFreddy
86. SpringBonnie

GUARD ABILITIES:

 0. Jeremy
 1. Mike
 2. Vanessa
 3. Fritz
 4. Michael
 5. Vannabelle
 6. Clark
 7. Frank
 8. The Boss
 9. Billy
10. Henry
11. William
12. Edwin
13. Fiona
14. Elizabeth
15. Cassie
16. Hudson
17. Mary
18. Strings
19. Sally
20. Old Man Consequences

UPGRADES:

 0. Overcharge
 1. OverchargeP
 2. PowerHour
 3. MiniMultiplier
 4. MiniMultiplierP
 5. MiniMultiplierPP
 6. EmployeeDiscount
 7. EmployeeDiscountP
 8. BackdoorTrading
 9. BackdoorTradingP
10. BackdoorTradingPP
11. CamRadar
12. CamRadarP
13. Superfan
14. SuperfanP
15. HeadStart
16. HeadStartP
17. LateStart
18. Overstock
19. OverstockP
20. EarlyInvestment
21. EarlyInvestmentP
22. EarlyInvestmentPP
23. TastyInvestment
24. FelixsLoan
25. FelixsLoanP
26. FelixsLoanPP
27. MangleCartridge
28. CupcakeCartridge
29. AnimdudeCartridge
30. FuzzyDice
31. UpgradeCommander
32. PowerAC
33. PowerACP
34. BearChange
35. BearChangeP
36. AllEars
37. CoolGlasses
38. RetinaBurner
39. RetinaBurnerP
40. Spawnkiller
41. TalbertsFiles
42. Crud2Cash
43. Crud2CashP
44. NewBulbs
45. Elongator
46. ElongatorP
47. ChildrensDrawings
48. MidasTouch
49. SupplyCloset
50. SupplyClosetP
51. Block1
52. FredTV
53. FredTVP
54. ImprovedInsulation
55. ImprovedInsulationP
56. Flashcart
57. LockdownProtocol
58. LockdownProtocolP
59. LockdownProtocolPP
60. DeadRinger
61. SurroundSound
62. SurroundSoundP
63. RASC
64. MiniReaper
65. MiniReaperP

MINIGAMES:

 0. Fredsweeper
 1. AirAdventure
 2. ChicasFeedingFrenzy
 3. PuppetPatrol
 4. HarePairs
 5. PiratePlunder
 6. CircusSorter
 7. GoldenFredsweeper
 8. MangleTangleMania
 9. CupcakeClicker
10. ScottsSlots
11. TipsyTapper
12. MidnightMotorist
13. DoofPix
14. TrashStacker
15. EndoChase

SHOPS:

 0. Rockstar Freddy
 1. Rockstar Bonnie
 2. Rockstar Chica
 3. Rockstar Foxy
 4. Dollie
 5. Browboy
 6. Bobbiedots
 7. Carnie
 8. Eleanor
 9. Morse
10. FazEnt Representative
11. Tipsy Bird
12. El Chip

CONSUMABLES:

 0. Ultra Clock
 1. Ultra Battery
 2. Ultra Snowcone
 3. Ultra Cupcake
 4. Ultra Beartrap
 5. Ultra Doorway
 6. Ultra Dice
 7. Ultra Giftbox
 8. Ultra Picker
 9. Ultra Deathcoin
10. Ultra Mimic Ball
11. Ultra Bomb

CHALLENGES:

 0. Mendo's shop is disabled
 1. Start each round 15 tokens in debt
 2. Reduced power
 3. Half of your minigames are disabled
 4. Permanent darkness
 5. Disables jumpscare blockers ; Any jumpscare is an instant game over
 6. Animatronic selections are anonymized
 7. Phony Boss is active
 8. Retro
 9. Nights are longer
10. Prize King activates every so often
11. A random animatronic is added
12. Upgrades are disabled
13. Underwater
14. Beat Eleanor's high score
15. Upside-down
16. Revive Removed Animatronics

REGIMENS:

 0. Door
 1. Vent
 2. Mask
 3. Office
 4. Camera
 5. Turnaround
 6. Point & Click
 7. Token
 8. Flashlight
 9. Sticker
10. Lethal
11. Nonlethal
12. Cheap
13. Pricey
14. Classic
15. Modern
16. Upgrade
17. Consumable
18. Minigame
19. Challenge
20. Green

