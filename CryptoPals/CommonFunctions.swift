//
//  CommonFunctions.swift
//  CryptoPals
//
//  Created by Al Wold on 1/17/18.
//  Copyright © 2018 Al Wold. All rights reserved.
//

import Foundation
let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"

func decryptXor(hexStrings: [String]) {
  var candidates = [String]()
  
  for hexString in hexStrings {
    let encrypted = Data(hexString: hexString)!
    
    
    for char in characters {
      let key = String(repeating: "\(char)", count: encrypted.count).data(using: .utf8)!
      let decrypted = encrypted.xor(with: key)!
      
      if let string = String(data: decrypted, encoding: .utf8) {
        candidates.append(string)
      } else {
        print("Unable to encode a string")
      }
    }
  }
  candidates.sort { string1, string2 -> Bool in
    string1.score > string2.score
  }
  for candidate in candidates[0..<5] {
    print("\(candidate.score): \(candidate)")
  }
}

func findEncrypted() throws {
  let url = URL(fileURLWithPath: "/Users/alwold/Downloads/encrypted.txt")
  let data = try Data(contentsOf: url)
  let lines = String(data: data, encoding: .ascii)!.split(separator: "\n")
  decryptXor(hexStrings: lines.map { substring in return String(substring)})
  
}
