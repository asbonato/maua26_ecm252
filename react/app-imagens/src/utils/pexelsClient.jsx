/* eslint-disable react-refresh/only-export-components */
import axios from 'axios'

export default axios.create({
    baseURL: 'https://api.pexels.com/v1/',
    headers : {
        Authorization: import.meta.env.VITE_PEXELS_KEY
    }
})
