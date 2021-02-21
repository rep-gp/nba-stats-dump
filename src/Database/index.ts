import { load } from 'ts-dotenv';
import { Pool } from 'pg'
import * as fs from 'fs'
import * as path from 'path'

const env = load({
    PG_HOST: String,
    PG_PORT: Number,
    PG_DATABASE: String,
    PG_USER: String,
    PG_PASSWORD: String
});

export default class Database {
    static pool = new Pool({
        host: env.PG_HOST,
        database: env.PG_DATABASE,
        user: env.PG_USER,
        password: env.PG_PASSWORD,
        port: env.PG_PORT
    })

    static async query(query: string) {
        return (await this.pool.query(query)).rows
    }

    static async dumpFromFile(filename: string) {
        const sql = fs.readFileSync(filename).toString()

        return this.pool.query(sql)
    }

    static async insertRows(table: string, rows: any[]) {
        const query = `
            INSERT INTO ${table}(${Object.keys(rows[1])})
            VALUES
            ${rows.map(row => `(${Object.values(row).map(value => `'${String(value).replace("'", "''")}'`)})`).join(',\n')}
        `

        await this.pool.query(query)
        // fs.writeFile(path.resolve(__dirname, '..', '..', 'player_stats_query.txt'), query, () => { })
    }
}