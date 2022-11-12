const express = require('express')
const router = express.Router()
const Post = require('../models/Post')


/*
app.get('/', (req, res) => {
    res.render('index')
    //res.sendFile(path.resolve(__dirname,'public/index.ejs'))
    })
*/    
    router.get('/', (req, res) => {
        Post.find({}).then(posts => {
            res.render('index',{posts:posts.map(item =>item.toJSON())})
        })
   })


    router.get('/register', (req, res) => {res.render('register')})
 
    router.get('/login', (req, res) => {res.render('login') })
    router.get('/details', (req, res) => {res.render('details') })
    router.get('/profile', (req, res) =>  {res.render('profile') })
    router.get('/contact', (req, res) =>  {res.render('contact') })
    

    module.exports = router