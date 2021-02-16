import PlayerService from './src/Service/PlayerService'
import TeamService from './src/Service/TeamService'

import Database from './src/Database'

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
