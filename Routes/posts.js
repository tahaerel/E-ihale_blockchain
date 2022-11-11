const express = require('express')
const router = express.Router()
const Post = require('../models/Post')

    router.get('/yeni', (req, res) => { res.render('create-item')})     



    router.get('/:id',(req,res) =>
    {   Post.findById(req.params.id).then(post=> {
        res.render('details',{ post: post.toJSON() });

    })
    })

    router.post('/test',(req,res) =>
    {   
         Post.create(req.body)
         console.log(req.files.post_image)
         res.redirect('/')
    })

    module.exports = router