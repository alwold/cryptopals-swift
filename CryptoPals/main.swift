//
//  main.swift
//  CryptoPals
//
//  Created by Al Wold on 1/17/18.
//  Copyright © 2018 Al Wold. All rights reserved.
//

import Foundation



//try findEncrypted()

// decryptXor(hexStrings: ["1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"])

let url = URL(fileURLWithPath: "/Users/alwold/Downloads/6-encrypted.txt")
let base64Data = try Data(contentsOf: url)
let base64String = String(data: base64Data, encoding: .utf8)!
let cleanedBase64String = base64String.replacingOccurrences(of: "\n", with: "")
let data = Data(base64Encoded: cleanedBase64String.data(using: .utf8)!)!
let size = findKeySize(data: data)
print("best size: \(size)")
