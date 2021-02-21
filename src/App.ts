import Database from "./Database"
import PlayerService from "./Service/PlayerService"
import TeamService from "./Service/TeamService"
import { changeObjectKeys } from './Utils'

export default class App {
    static season: string
    static routes = [
        { name: 'players', method: () => PlayerService.getPlayers() },
        { name: 'player_stats', method: (season: string) => PlayerService.getPlayersStats(season) },
        { name: 'teams', method: () => TeamService.getTeams() },
        { name: 'team_stats', method: (season: string) => TeamService.getTeamsStats(season) }
    ]
    data: any

    constructor(season: string) {
        App.season = season
    }

    async dumpToDatabase() {
        Database.dumpFromFile(process.argv[2])
    }

    async fetchRoutes() {
        this.data = {}

        await Promise.all(App.routes.map(async (route) => {
            const responseObj = await route.method(App.season)
            this.data[route.name] = responseObj.map((el: any) => changeObjectKeys(el))
        }))

        // for (const key in this.data) {
        //     await Database.insertRows(key, this.data[key])
        // }

        await Database.insertRows('player_stats', this.data['player_stats'])
    }
}
