import PlayerService from './src/Service/PlayerService'
import TeamService from './src/Service/TeamService'

import Database from './src/Database'

import { changeObjectKeys } from './src/Utils'

const fetchRoutes = async (season: string) => {
    const players = await PlayerService.getPlayers()
    const playersStats = await PlayerService.getPlayersStats(season)

    const teams = await TeamService.getTeams()
    const teamsStats = await TeamService.getTeamsStats(season)

    return teamsStats
}

const dumpToDatabase = () => {
    Database.dumpFromFile(process.argv[2])
}

// fetchRoutes('REG2020').then((response) => console.log(response))
let teamsStats = []

fetchRoutes('REG2020').then(response => {
    response.map((element: any) => {
        teamsStats.push(changeObjectKeys(element))
    })
    console.log(teamsStats[1])
})