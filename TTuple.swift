import Foundation

enum Direction {
  case left
  case right
}

struct TTuple: CustomStringConvertible {

  init (currentState: Int, inputChar: Character, newState: Int, outputChar: Character, direction: Direction) {
    self.currentState = currentState
    self.inputChar = inputChar
    self.newState = newState
    self.outputChar = outputChar
    self.direction = direction
  }

  let currentState: Int
  let inputChar: ``Character``
  let newState: Int
  let outputChar: Character
  let direction: Direction

  static func makeKey(state: Int, inputChar: Character) -> String {
    return "\(state) \(inputChar)"
  }

  func getKey() -> String {
    return "\(currentState) \(inputChar)"
  }

  var description: String {
    return "{cs: \(currentState), ic: \(inputChar), ns: \(newState), oc: \(outputChar), D: \(direction)}"
  }

  //Method helpful in neatly printing TTuples
  func nakedTuple() -> String {
    return "\(currentState) \(inputChar) \(newState) \(outputChar) \(direction)"
  }

}


