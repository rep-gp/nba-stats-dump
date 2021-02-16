import Service from '.'

export default class PlayerService {
    static async getPlayers (): Promise<Array<any>> {
        return await Service.get('scores/json/Players')
    }

    static async getPlayersStats (season: string): Promise<Array<any>> {
        return await Service.get(`stats/json/PlayerSeasonStats/${season}`)
    }
}