const express = require('express')
const router = express.Router()
const Post = require('../models/Post')
const path = require('path')


    router.get('/yeni', (req, res) => { 
        
            res.render('create-item')
        })
          



    router.get('/:id',(req,res) =>
    {   Post.findById(req.params.id).then(post=> {
        res.render('details',{ post: post.toJSON() });

    })
    })

    router.post('/test',(req,res) =>
    {   

        let post_image = req.files.post_image
        post_image.mv(path.resolve(__dirname,'../public/assets/images/postimages',post_image.name))
         Post.create(
            {
            ...req.body,
            post_image:`/assets/images/postimages/${post_image.name}`
            },)

            

         console.log(req.files.post_image.name)
         res.redirect('/')
    })

    module.exports = router