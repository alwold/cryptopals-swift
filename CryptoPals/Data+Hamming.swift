//
//  Data+Hamming.swift
//  CryptoPals
//
//  Created by Al Wold on 1/17/18.
//  Copyright © 2018 Al Wold. All rights reserved.
//

import Foundation

extension Data {
  public func hammingDistance(to other: Data) -> Int {
    // xor
    let xor = self.xor(with: other)!
    // count the bits set - keep shifting right and checking for odd number
    var distance = 0
    for byte in xor {
      var testing: UInt8 = byte
      for _ in 1...8 {
        if testing % 2 == 1 {
          distance += 1
        }
        testing = testing >> 1
      }
    }
    return distance
  }
}
