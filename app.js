const path = require('path')
const express = require('express')
const exphbs = require('express-handlebars')
const app = express()
const port = 3000
const hostname = '127.0.0.1'
const mongoose = require('mongoose')

mongoose.connect('mongodb://127.0.0.1/ihale');

app.use(express.static('public'))
app.engine('handlebars',exphbs.engine())
app.set('view engine','handlebars')
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.get('/', (req, res) => {
    res.render('index')
  
    })
    
app.listen(port,hostname,()=>{
    console.log(`Server çalışıyor, http://${hostname}:${port}/`)
})