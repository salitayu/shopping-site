import { Pool } from 'pg'

let connection

if (!connection) {
    connection = new Pool({
        user: process.env.USER,
        password: process.env.PASSWORD,
        host: process.env.HOST,
        port: process.env.PORT,
        database: process.env.DB
    })
}

export default connection
