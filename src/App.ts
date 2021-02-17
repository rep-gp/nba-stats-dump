import Database from "./Database"
import PlayerService from "./Service/PlayerService"
import TeamService from "./Service/TeamService"
import { changeObjectKeys } from './Utils'

export default class App {
    static season: string
    static routes = [
        { name: 'players', method: () => PlayerService.getPlayers() },
        { name: 'playersStats', method: (season: string) => PlayerService.getPlayersStats(season) },
        { name: 'teams', method: () => TeamService.getTeams() },
        { name: 'teamsStats', method: (season: string) => TeamService.getTeamsStats(season) }
    ]
    data: any

    constructor (season: string) {
        App.season = season
    }

    async dumpToDatabase () {
        Database.dumpFromFile(process.argv[2])
    }

    fetchRoutes () {
        this.data = {}

        App.routes.map(async (route) => {
            const responseObj = await route.method(App.season)
            this.data[route.name] = responseObj.map((el: any) => changeObjectKeys(el))

            if (this.data.teamsStats) console.log(this.data.teamsStats[1])
        })

    }
}
