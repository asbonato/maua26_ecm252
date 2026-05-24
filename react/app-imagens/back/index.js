const express = require('express')
const cors = require('cors')
const axios = require('axios')
const dotenv = require('dotenv').config()
const app = express()
app.use(cors())
app.use(express.json())

app.get('/search', async (req, res) => {
    const pexelsClient = axios.create({
        baseURL: 'https://api.pexels.com/v1',
        headers: {
            Authorization: process.env.PEXELS_API_KEY
        }
    })
    const { data } = await pexelsClient.get('/search', {
        params: {
            query: req.query.query
        }
    })
    console.log(data)
    res.json(data)
})

const port = 3000
app.listen(port, ()=> console.log(`Back. ${port}`))