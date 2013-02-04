# Load Libraries

# Load mode
launchMode = process.argv[2]
if not launchMode
    console.log "Please launch in a valid mode. Ships with 'dev' and 'prod'."
    process.exit 1

# Load configuration
configbase = require('../config')
config = configbase.default
for key of configbase[launchMode]
    config[key] = configbase[launchMode][key]

# Express Setup
# (uncomment to use express)
###
app = express()
app.configure ->
    app.use express.cookieParser()
    app.use express.bodyParser()
    app.use express.session
        secret: config.secretkey
    app.use app.router
    app.use express.static '../public'

routes = require('./routes') app

app.listen config.port
###

console.log "Application listening for requests on port "+config.port
