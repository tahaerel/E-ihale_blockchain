const mongoose = require('mongoose')

const PostSchema = new mongoose.Schema({
    title:{type:String, required:true},  
    content:{type:String, required:true},
    date:{type:Date, default: Date.now},
    post_image: {type:String,require:true}
})



//const Postlar = mongoose.model('Posts,',PostSchema)

module.exports = mongoose.model('Post',PostSchema)