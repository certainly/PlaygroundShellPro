let roshamdo = ["rock", "paper", "scissors"]
func check(_ left: String, beats right: String) -> Bool {
    return (3 + roshamdo.firstIndex(of: left)! - roshamdo.firstIndex(of: right)! ) % 3 == 1
}
let computerMove = roshamdo.shuffled().first!
check("paper", beats: computerMove)

