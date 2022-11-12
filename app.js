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


app.listen(port,hostname,()=>{
    console.log(`Server çalışıyor, http://${hostname}:${port}/`)
})