import { load } from 'ts-dotenv';
import axios from 'axios';

const env = load({
    API_KEY: String,
    API_URL: String
});

export default class Service {
    static client = axios.create({
        baseURL: env.API_URL,
        headers: {
            'Ocp-Apim-Subscription-Key': env.API_KEY
        }
    })

    static async get (url: string, params?: any) {
        try {
            return (await this.client.get(url, params)).data
        } catch (e) {
            throw new Error(e.message)
        }
    }
}