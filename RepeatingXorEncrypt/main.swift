//
//  main.swift
//  RepeatingXorEncrypt
//
//  Created by Al Wold on 1/17/18.
//  Copyright © 2018 Al Wold. All rights reserved.
//

import Foundation

if CommandLine.arguments.count < 2 {
  print("Usage: \(CommandLine.arguments.first!) <file>")
  exit(1)
}

let file = CommandLine.arguments[1]

let data = try Data(contentsOf: URL(fileURLWithPath: file))

if let keyData = "ICE".data(using: .utf8), let hexString = data.repeatingXor(with: keyData)?.hexString {
  print(hexString)
}
