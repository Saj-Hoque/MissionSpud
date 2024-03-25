extends Node

var max_scraps = 100

var upkeep = 0
var robot_upkeep = 0

var potatoCount = 0
var scrapCount = 0

var names = ["Bolt", "Circuit", "Nova", "Titan", "Spark", "Electron", "Nexus", "Zenith", "Byte", "Luna", "Blaze", "Quantum", "Orion", "Matrix", "Zen", "Cypher", "Phoenix", "Galaxia", "Tesla", "Astro", "Cosmo", "Omega", "Astra", "Synth", "Vortex", "Aurora", "Draco", "Nebula", "Pulse", "Comet", "Zephyr", "Celestia", "Cyborg", "Stellar", "Infinity", "Cogs", "Radiant", "Glyph", "Sirius", "Flux", "Dynamo", "Eclipse", "Vector", "Kepler", "Astral", "Horizon", "Galactica", "Spectra", "Helix", "Lumina", "Aether", "Atom", "Pulsar", "Synapse", "Atmos", "Vesper", "Arc", "Chronos", "Epoch", "Helios", "Quasar", "Solstice", "Tempest", "Valkyrie", "Wavelength", "Xenon", "Ypsilon", "Zircon", "Apex", "Cygnus", "Droid", "Eon", "Genesis", "Halcyon", "Icarus", "Jett", "Kinesis", "Luminex", "Metrix", "Nucleus", "Ozone", "Prism", "Quanta", "Radiex", "Sol", "Tron", "Unity", "Vortex", "Wisp", "Xylon", "Yuga", "Zephyrus", "Andromeda", "Blitz", "Equinox", "Fission", "Graviton", "Hyperion"]

var potatoQuantity = 2
var potatoValue = 1
var potatoTimer = 10

var scrapQuantity = 1
var scrapValue = 1
var scrapTimer = 8

var planterSpeed = 30
var planterProductivity = 10
var planterUpkeep = 5

var harvesterSpeed = 30
var harvesterProductivity = 10
var harvesterUpkeep = 5

var collectorSpeed = 20
var collectorCapacity = 256
var collectorRange = 1
var collectorUpkeep = 5

var scavengerSpeed = 50
var scavengerCapacity = 1
var scavengerUpkeep = 5

