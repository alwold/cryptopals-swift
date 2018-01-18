//
//  String+Hamming.swift
//  CryptoPals
//
//  Created by Al Wold on 1/17/18.
//  Copyright © 2018 Al Wold. All rights reserved.
//

import Foundation

extension String {
  public func hammingDistance(to other: String) -> Int {
    return data(using: .utf8)!.hammingDistance(to: other.data(using: .utf8)!)
  }
}
