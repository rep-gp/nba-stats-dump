import Service from '.'

export default class PlayerService {
    static async getTeams () {
        return await Service.get('scores/json/teams')
    }

    static async getTeamsStats (season: string) {
        return await Service.get(`scores/json/TeamSeasonStats/${season}`)
    }
}