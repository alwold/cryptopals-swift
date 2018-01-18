//
//  String+Score.swift
//  CryptoPals
//
//  Created by Al Wold on 1/17/18.
//  Copyright © 2018 Al Wold. All rights reserved.
//

import Foundation

let letterScores: [Character: Int] = [
  "E": 10,
  "T": 9,
  "A": 8,
  "O": 7,
  "I": 6,
  "N": 5,
  "S": 4,
  "H": 3,
  "R": 2,
  "L": 1,
  "U": 0
]

extension String {
  public var score: Int {
    get {
      var score = 0
      for ch in self.uppercased() {
        if let letterScore = letterScores[ch] {
          score += letterScore
        }
      }
      return score
    }
  }
}
