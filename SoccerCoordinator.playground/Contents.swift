//: Playground - noun: a place where people can play
import UIKit

//PART - 1.1 Creating players information Dictionaries
let player1: [String : Any] = [ "name": "Joe Smith", "height": 42, "experience": true, "guardians": "Jim and Jan Smith"]
let player2: [String : Any] = [ "name": "Jill Tanner", "height": 36, "experience": true, "guardians": "Clara Tanner"]
let player3: [String : Any] = [ "name": "Bill Bon", "height": 43, "experience": true, "guardians": "Sara and Jenny Bon"]
let player4: [String : Any] = [ "name": "Eva Gordon", "height": 45, "experience": false, "guardians": "Wendy and Mike Gordon"]
let player5: [String : Any] = [ "name": "Matt Gill", "height": 40, "experience": false, "guardians": "Charles and Silva Gill"]
let player6: [String : Any] = [ "name": "Kimmy Stein", "height": 41, "experience": false, "guardians": "Bill and Hillary Stein"]
let player7: [String : Any] = [ "name": "Sammy Adams", "height": 45, "experience": false, "guardians": "Jeff Adams"]
let player8: [String : Any] = [ "name": "Karl Saygan", "height": 42, "experience": true, "guardians": "Heather Bledsome"]
let player9: [String : Any] = [ "name": "Suzane Greenberg", "height": 44, "experience": true, "guardians": "Henrietta Dumas"]
let player10: [String : Any] = [ "name": "Sal Dali", "height": 41, "experience": false, "guardians": "Gala Dali"]
let player11: [String : Any] = [ "name": "Joe Kavalier", "height": 39, "experience": false, "guardians": "Sam and Elaine Kavalier"]
let player12: [String : Any] = [ "name": "Ben Finkelstein", "height": 44, "experience": false, "guardians": "Aaron and Jill Finkelstein"]
let player13: [String : Any] = [ "name": "Diego Soto", "height": 41, "experience": true, "guardians": "Robin and Sarika Soto"]
let player14: [String : Any] = [ "name": "Chloe Alaska", "height": 47, "experience": false, "guardians": "David and Jamie Alaska"]
let player15: [String : Any] = [ "name": "Arnold Willis", "height": 43, "experience": false, "guardians": "Claire Willis"]
let player16: [String : Any] = [ "name": "Phillip Helm", "height": 44, "experience": true, "guardians": "Thomas Helm and Eva Iones"]
let player17: [String : Any] = [ "name": "Les Clay", "height": 42, "experience": true, "guardians": "Wynonna Brown"]
let player18: [String : Any] = [ "name": "Herschel Krustofski", "height": 45, "experience": true, "guardians": "Hyman and Rachel Krustofski"]

//PART - 1.2 Creating array for contain players info
let players: [[String: Any]] = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]

//PART - 2 Creting Dictionary for the soccer teams
var teamSharks: [[String:Any]] = []
var teamDragons: [[String:Any]] = []
var teamRaptors: [[String:Any]] = []

//PART - 3.1 Creating Dictionary for soccer experience
var hasSoccerExperience: [[String:Any]] = []
var noSoccerExperience: [[String:Any]] = []

//PART - 3.2 Separating players based on experience and no experience
for playersInfo in players {
    if (playersInfo["experience"] as! Bool){
        hasSoccerExperience.append(playersInfo);
    }else{
        noSoccerExperience.append(playersInfo);
    }
}

//PART - 3.3 Sorting players based on height

var hasSoccerExperienceSorted = hasSoccerExperience.sorted{$1["height"] as! Int > $0["height"] as! Int}
var noSoccerExperienceSorted = noSoccerExperience.sorted{$0["height"] as! Int > $1["height"] as! Int}

//For Debug
//for debug in hasSoccerExperienceSorted { print(debug) }
//for debug in noSoccerExperienceSorted { print(debug) }

//PART - 3.4 Making Teams
//First making teams only with soccer experienced playes
for player in hasSoccerExperienceSorted {
    if(teamSharks.count <= teamRaptors.count && teamSharks.count <= teamDragons.count){
        teamSharks.append(player)
    } else if(teamDragons.count <= teamRaptors.count){
        teamDragons.append(player)
    } else {
        teamRaptors.append(player)
    }
}

//Then making teams with left players
for player in noSoccerExperienceSorted {
    if(teamSharks.count <= teamRaptors.count && teamSharks.count <= teamDragons.count){
        teamSharks.append(player)
    } else if(teamDragons.count <= teamRaptors.count){
        teamDragons.append(player)
    } else {
        teamRaptors.append(player)
    }
}

//For Debug
/*print("-----------------------------Team Sharks--------------------------------------------------------")
for teamSharksPlayer in teamSharks { print(teamSharksPlayer) }
print("----------------------------Team Dragons---------------------------------------------------------")
for teamDragonsPlayer in teamDragons { print(teamDragonsPlayer) }
print("-----------------------------Team Raptors--------------------------------------------------------")
for teamRaptorsPlayer in teamRaptors { print(teamRaptorsPlayer) }*/

//PART - 4 Output custom messages for each player and average height of each team

var teamSharksHeightTotal: Double = 0.0
var teamDragonsHeightTotal: Double = 0.0
var teamRaptorsHeightTotal: Double = 0.0

print("----------------------------Team Sharks----------------------------------------------------------")
for teamSharksPlayer in teamSharks{
    print("To: \(teamSharksPlayer["guardians"]!), Your child \(teamSharksPlayer["name"]!) from Team Sharks will attend their first team practice on March 17, 3pm")
    teamSharksHeightTotal += Double(teamSharksPlayer["height"] as! Int)
}
print("----------------------------Team Dragons---------------------------------------------------------")
for teamDragonsPlayer in teamDragons{
    print("To: \(teamDragonsPlayer["guardians"]!), Your child \(teamDragonsPlayer["name"]!) from Team Dragons will attend their first team practice on March 17, 1pm")
    teamDragonsHeightTotal += Double(teamDragonsPlayer["height"] as! Int)
}
print("-----------------------------Team Raptors--------------------------------------------------------")
for teamRaptorsPlayer in teamRaptors{
    print("To: \(teamRaptorsPlayer["guardians"]!), Your child \(teamRaptorsPlayer["name"]!) from Team Raptors will attend their first team practice on March 18, 1pm")
    teamRaptorsHeightTotal += Double(teamRaptorsPlayer["height"] as! Int)
}
print("-----------------------------Average Height------------------------------------------------------")
print("Team Sharks = \(teamSharksHeightTotal / Double(teamSharks.count))")
print("Team Dragons = \(teamDragonsHeightTotal / Double(teamDragons.count))")
print("Team Raptors = \(teamRaptorsHeightTotal / Double(teamRaptors.count))")
