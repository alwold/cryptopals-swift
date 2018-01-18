//
//  Data+XOR.swift
//  CryptoPals
//
//  Created by Al Wold on 1/17/18.
//  Copyright © 2018 Al Wold. All rights reserved.
//

import Foundation

extension Data {
  func xor(with other: Data) -> Data? {
    if count != other.count {
      print("Error: length mismatch")
      return nil
    }
    return repeatingXor(with: other)
  }
  
  func repeatingXor(with key: Data) -> Data? {
    var newbytes = [UInt8]()
    
    var keyIndex = 0
    for byte in self {
      newbytes.append(byte ^ key[keyIndex])
      if keyIndex < key.count-1 {
        keyIndex += 1
      } else {
        keyIndex = 0
      }
    }
    return Data(bytes: newbytes)
  }
}
