const mongoose = require('mongoose')
const Post = require('./models/Post')

mongoose.connect('mongodb://127.0.0.1/ihaletest');

Post.create({
    title:'Post basligi',
    content: 'Post icerigi'

},(error,post) => {console.log(error,post)

})