extends Node

var running = false

const max_scraps = 100

const potatoWin = 10000
const scrapWin = 10000

var totalPotato = 0
var totalScrap = 0
var totalRobots = 0

var upkeep = 0
var robot_upkeep = 0

var potatoCount = 0
var scrapCount = 0

var names = ["Bolt", "Circuit", "Nova", "Titan", "Spark", "Electron", "Nexus", "Zenith", "Byte", "Luna", "Blaze", "Quantum", "Orion", "Matrix", "Zen", "Cypher", "Phoenix", "Galaxia", "Tesla", "Astro", "Cosmo", "Omega", "Astra", "Synth", "Vortex", "Aurora", "Draco", "Nebula", "Pulse", "Comet", "Zephyr", "Celestia", "Cyborg", "Stellar", "Infinity", "Cogs", "Radiant", "Glyph", "Sirius", "Flux", "Dynamo", "Eclipse", "Vector", "Kepler", "Astral", "Horizon", "Galactica", "Spectra", "Helix", "Lumina", "Aether", "Atom", "Pulsar", "Synapse", "Atmos", "Vesper", "Arc", "Chronos", "Epoch", "Helios", "Quasar", "Solstice", "Tempest", "Valkyrie", "Wavelength", "Xenon", "Ypsilon", "Zircon", "Apex", "Cygnus", "Droid", "Eon", "Genesis", "Halcyon", "Icarus", "Jett", "Kinesis", "Luminex", "Metrix", "Nucleus", "Ozone", "Prism", "Quanta", "Radiex", "Sol", "Tron", "Unity", "Vortex", "Wisp", "Xylon", "Yuga", "Zephyrus", "Andromeda", "Blitz", "Equinox", "Fission", "Graviton", "Hyperion"]

var potatoQuantity = 2
var potatoValue = 1
var potatoTimer = 5

var scrapQuantity = 1
var scrapValue = 1
var scrapTimer = 8

var planterSpeed = 30
var planterProductivity = 5
var planterUpkeep = 1

var harvesterSpeed = 20
var harvesterProductivity = 2.5
var harvesterUpkeep = 1

var collectorSpeed = 10
var collectorCapacity = 256
var collectorRange = 1
var collectorUpkeep = 1

var scavengerSpeed = 40
var scavengerCapacity = 2
var scavengerUpkeep = 1

var menu_active = false

func reset():
	running = true
	
	totalPotato = 0
	totalScrap = 0
	totalRobots = 0
	potatoCount = 0
	scrapCount = 0
	
	upkeep = 0
	robot_upkeep = 0
	
	potatoQuantity = 2
	potatoValue = 1
	potatoTimer = 5

	scrapQuantity = 1
	scrapValue = 1
	scrapTimer = 8

	planterSpeed = 30
	planterProductivity = 5
	planterUpkeep = 1

	harvesterSpeed = 20
	harvesterProductivity = 2.5
	harvesterUpkeep = 1

	collectorSpeed = 10
	collectorCapacity = 256
	collectorRange = 1
	collectorUpkeep = 1

	scavengerSpeed = 40
	scavengerCapacity = 2
	scavengerUpkeep = 1
	
	menu_active = false
	
