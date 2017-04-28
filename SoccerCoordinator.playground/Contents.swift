//: Playground - noun: a place where people can play
import UIKit

//PART - 1 Creating Array and Dictionaries for Players

var players: [String] = ["Joe Smith", "Jill Tanner", "Bill Bon", "Eva Gordon", "Matt Gill", "Kimmy Stein", "Sammy Adams", "Karl Saygan", "Suzane Greenberg", "Sal Dali", "Joe Kavalier", "Ben Finkelstein", "Diego Soto", "Chloe Alaska", "Arnold Willis", "Phillip Helm", "Les Clay", "Herschel Krustofski"]

var soccerExperience: [String: Bool] = ["Joe Smith": true, "Jill Tanner": true, "Bill Bon": true, "Eva Gordon": false, "Matt Gill": false, "Kimmy Stein": false, "Sammy Adams": false, "Karl Saygan": true, "Suzane Greenberg": true, "Sal Dali": false, "Joe Kavalier": false, "Ben Finkelstein": false, "Diego Soto": true, "Chloe Alaska": false, "Arnold Willis": false, "Phillip Helm": true, "Les Clay": true, "Herschel Krustofski": true]

var playersHeight: [String: Int] = ["Joe Smith": 42, "Jill Tanner": 36, "Bill Bon": 43, "Eva Gordon": 45, "Matt Gill": 40, "Kimmy Stein": 41, "Sammy Adams": 45, "Karl Saygan": 42, "Suzane Greenberg": 44, "Sal Dali": 41, "Joe Kavalier": 39, "Ben Finkelstein": 44, "Diego Soto": 41, "Chloe Alaska": 47, "Arnold Willis": 43, "Phillip Helm": 44, "Les Clay": 42, "Herschel Krustofski": 45]

var guardianNames: [String: String] = ["Joe Smith": "Jim and Jan Smith", "Jill Tanner": "Clara Tanner", "Bill Bon": "Sara and Jenny Bon", "Eva Gordon": "Wendy and Mike Gordon", "Matt Gill": "Charles and Silva Gill", "Kimmy Stein": "Bill and Hillary Stein", "Sammy Adams": "Jeff Adams", "Karl Saygan": "Heather Bledsome", "Suzane Greenberg": "Henrietta Dumas", "Sal Dali": "Gala Dali", "Joe Kavalier": "Sam and Elaine Kavalier", "Ben Finkelstein": "Aaron and Jill Finkelstein", "Diego Soto": "Robin and Sarika Soto", "Chloe Alaska": "David and Jamie Alaska", "Arnold Willis": "Claire Willis", "Phillip Helm": "Thomas Helm and Eva Iones", "Les Clay": "Wynonna Brown", "Herschel Krustofski": "Hyman and Rachel Krustofski"]

//PART - 2 Creting Arrays for the soccer teams
var teamSharks: [String] = []
var teamDragons: [String] = []
var teamRaptors: [String] = []

//PART - 3.1 Creating Arrays for soccer experience
var hasSoccerExperience: [String] = []
var noSoccerExperience: [String] = []

//PART - 3.2 Separating playes that has experience and no experience
for(playerName, experience) in soccerExperience {
    if (experience == true){
        hasSoccerExperience.append(playerName);
    } else {
        noSoccerExperience.append(playerName);
    }
}

//For Debug
/*print(hasSoccerExperience)
print(noSoccerExperience)*/

//PART - 3.3 Creating Varibles to use in the height aaverage process
var teamsAverageHeightLimit: Double = 1.5
var teamsAverageHeightChecker: Bool = false

var teamSharkAverageHeight: Double = 0.0
var teamDragonsAverageHeight: Double = 0.0
var teamRaptorsAverageHeight: Double = 0.0

//PART - 3.4 Creating functions of average calculation, average comparison and arrayShuffle

//Just culculate the average height of team based on Teams array.Getting height value by player name
func calcTeamAverageHeight (teamName: [String]) -> Double{
    var teamAverageHeight: Double = 0.0
    
    for playerName in teamName{
        teamAverageHeight += Double(playersHeight[playerName]!)
    }
    teamAverageHeight = teamAverageHeight / Double(teamName.count)
    
    return teamAverageHeight
}

//Compare the average height in range of average < 1.5 and average > -1.5
func compareAverageHeight (averageHeight: Double, averageHeight2: Double) -> Bool{
    if(averageHeight - averageHeight2 <= teamsAverageHeightLimit && averageHeight - averageHeight2 >= -teamsAverageHeightLimit){
        return true
    }
    return false
}

//Extension for Array for do shuffle
extension Array {
    mutating func shuffle () {
        for i in (0..<self.count).reversed() {
            let ix1 = i
            let ix2 = Int(arc4random_uniform(UInt32(i+1)))
            (self[ix1], self[ix2]) = (self[ix2], self[ix1])
        }
    }
}

//PART - 3.5 Logic for making team based on experience and height
while(teamsAverageHeightChecker != true){
    //First making teams only with soccer experienced playes
    for (index, playerName) in hasSoccerExperience.enumerated() {
        if(teamSharks.count < teamRaptors.count && teamSharks.count < teamDragons.count){
            teamSharks.append(playerName)
        } else if(teamDragons.count < teamRaptors.count){
            teamDragons.append(playerName)
        } else {
            teamRaptors.append(playerName)
        }
    }
    
    //Then making teams with left players
    for (index, playerName) in noSoccerExperience.enumerated() {
        if(teamSharks.count < teamRaptors.count && teamSharks.count < teamDragons.count){
            teamSharks.append(playerName)
        } else if(teamDragons.count < teamRaptors.count){
            teamDragons.append(playerName)
        } else {
            teamRaptors.append(playerName)
        }
    }
    
    //Calculate average for each team
    teamSharkAverageHeight = calcTeamAverageHeight(teamName: teamSharks)
    teamDragonsAverageHeight = calcTeamAverageHeight(teamName: teamDragons)
    teamRaptorsAverageHeight = calcTeamAverageHeight(teamName: teamRaptors)

    //If average range is in 1.5 between teams get out loop, if not shuffle array to make new team again until hit range of 1.5
    if  compareAverageHeight(averageHeight: teamSharkAverageHeight, averageHeight2: teamDragonsAverageHeight) &&
        compareAverageHeight(averageHeight: teamSharkAverageHeight, averageHeight2: teamRaptorsAverageHeight) &&
        compareAverageHeight(averageHeight: teamRaptorsAverageHeight, averageHeight2: teamDragonsAverageHeight) {
        
        teamsAverageHeightChecker = true
        
    } else {
        hasSoccerExperience.shuffle()
        noSoccerExperience.shuffle()
        teamsAverageHeightChecker = false
    }
}

print("Team Sharks Average Height: \(teamSharkAverageHeight)")
print("Team Dragons Average Height: \(teamDragonsAverageHeight)")
print("Team Raptors Average Height: \(teamRaptorsAverageHeight)")

//For Debug
/*print(teamSharks)
print(teamDragons)
print(teamRaptors)*/

for playerName in teamSharks{
    print("To: \(guardianNames[playerName]!), Your child \(playerName) from Team Sharks will attend their first team practice on March 17, 3pm")
}

for playerName in teamDragons{
    print("To: \(guardianNames[playerName]!), Your child \(playerName) from Team Dragons will attend their first team practice on March 17, 1pm")
}

for playerName in teamRaptors{
    print("To: \(guardianNames[playerName]!), Your child \(playerName) from Team Raptors will attend their first team practice on March 18, 1pm")
}


