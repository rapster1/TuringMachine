//The Turing virtual machine
import Foundation

class TuringVM {

  var ttuplesArray: [TTuple]

  func tupleReport() -> String {
    var tuple = ""
    for  i  in ttuplesArray {
      tuple += "\(i)"
      tuple += "\n"
    }
    return tuple
  }

  func nakedTupleReport() -> String {
    var nakedTuple = "cs ic ns oc di\n"
    for i in ttuplesArray {
      nakedTuple += "\(i.nakedTuple())"
      nakedTuple += "\n"
    }
    return nakedTuple
  }

  init (ttuplesArray: [TTuple]) {
    self.ttuplesArray = ttuplesArray
  }
/*
  private(set) numberTuples: Int
*/
  func tapeAsString(tape: [Character]) -> String {
    var tapeString = ""
    for i in tape {
      tapeString.append(i)
    }
    return tapeString
  }

  func tapeArray(tape: String) -> [Character] {
    var tapeArray: [Character] = []
    for i in tape {
      tapeArray.append(i)
    }
    return tapeArray
  }

  func runTuring (initialTape: String, initialState: Int, initialHead: Int) -> (numberSteps: Int, finalTape: String, trace: [String]) {
    var currentState = initialState
    var headIndex = initialHead
    var steps = 0
    var tracy: [String] = []
    var tape = tapeArray(tape: initialTape)
    var inputCharacter = tape[headIndex]

    var tapeWithBracket = ""

    var TTuplesDictionary: [String: TTuple] = [:]
    for i in ttuplesArray {
      TTuplesDictionary[i.getKey()] = i
    }

    while TTuplesDictionary["\(currentState) \(inputCharacter)"] != nil {

      steps += 1

      let tempTTuple = TTuplesDictionary["\(currentState) \(inputCharacter)"]!

      currentState = tempTTuple.newState
      tape[headIndex] = tempTTuple.outputChar
      if tempTTuple.direction == Direction.right {
        headIndex += 1
      }
      else {
        headIndex -= 1
      }

      for i in 0..<headIndex {
        tapeWithBracket.append(tape[i])
      }
      
      tapeWithBracket += "["
      tapeWithBracket.append(tape[headIndex])
      tapeWithBracket += "]"
      for i in headIndex...tape.count-1 {
        tapeWithBracket.append(tape[i])
      }

      tracy.append("\(steps): \(tempTTuple) \(tapeWithBracket)")

      tapeWithBracket = ""

      if headIndex >= 0 && headIndex <= tape.count-1 {
        inputCharacter = tape[headIndex]
      }
      else {
        currentState = 99999
      }
    }

    return (numberSteps: steps, finalTape: tapeAsString(tape: tape), trace: tracy)
  }
}
