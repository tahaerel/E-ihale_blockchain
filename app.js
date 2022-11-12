const express = require('express')
const exphbs = require('express-handlebars')
const app = express()
const port = 3000
const hostname = '127.0.0.1'
const mongoose = require('mongoose')
const bodyParser = require('body-parser')
const fileUpload = require('express-fileupload')
const moment = require('moment')
moment.locale('tr')
const expressSession = require('express-session')
const connectMongo = require('connect-mongo')
//const { Router } = require('express')
const Post = require('./models/Post')
//mongoose.connect('mongodb+srv://mongotuna:Mongotuna.12@cluster0.9mpmtwt.mongodb.net/?retryWrites=true&w=majority')
//app.set('view engine','ejs')
mongoose.connect('mongodb://127.0.0.1/ihale')


app.use(fileUpload())

app.use(express.static('public'))

const hbs = exphbs.create({
helpers:{
    generateDate :(date, format) => {
        return moment(date).format(format)
    }
}

})

app.engine('handlebars',hbs.engine)
app.set('view engine','handlebars')


// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

const main = require('./routes/main')
const posts = require('./routes/posts')
const users = require('./routes/users')
app.use('/',main)
app.use('/ihaleler',posts)
app.use('/users',users)



/*
app.get('/', (req, res) => {
res.render('index')
//res.sendFile(path.resolve(__dirname,'public/index.ejs'))
})

app.get('/register', (req, res) => {
    res.render('register')
    })
    
app.get('/create-item', (req, res) => { res.render('create-item')})      
app.get('/login', (req, res) => {res.render('login') })
app.get('/details', (req, res) => {res.render('details') })
app.get('/profile', (req, res) =>  {res.render('profile') })
app.get('/contact', (req, res) =>  {res.render('contact') })

app.post('/ihaleler/test',(req,res) =>
{
    Post.create(req.body)
    res.redirect('/')
})
*/
app.listen(port,hostname,()=>{
    console.log(`Server çalışıyor, http://${hostname}:${port}/`)
})


