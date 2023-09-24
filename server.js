require('dotenv').config()
const express = require('express');
const app = express();
const expressLayouts = require('express-ejs-layouts');
const bodyParser = require('body-parser');
const methodOverride = require('method-override');

const indexRouter = require('./routers/index');
const authorRouter = require('./routers/authors');
const bookRouter = require('./routers/books');


app.set('view engine','ejs')
app.set('layout','layouts/layout')
app.set('views', __dirname+'/views')

app.use(methodOverride('_method'))
app.use(expressLayouts)
app.use(express.static('public'))
app.use(bodyParser.urlencoded({ limit: '10mb', extended: false }))

app.use('/',indexRouter)
app.use('/authors',authorRouter)
app.use('/books',bookRouter)

const mongoose = require('mongoose')
mongoose.connect(process.env.DATABASE_URL,{
    useNewUrlParser:true,
    useUnifiedTopology: true,})

const db = mongoose.connection
db.on('error',error=>console.error('error'))
db.once('open',()=> console.log('connected to mongoose'))



app.listen(process.env.PORT || 3000,()=>{
    console.log("localhost:"+3000);
})