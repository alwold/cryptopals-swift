//
//  Data+Encoding.swift
//  CryptoPals
//
//  Created by Al Wold on 1/17/18.
//  Copyright © 2018 Al Wold. All rights reserved.
//

import Foundation

extension Data {
  public init?(hexString: String) {
    var bytes = [UInt8]()
    var index = hexString.startIndex
    while index < hexString.endIndex {
      guard let msb = Data.convertToInt(hexChar: hexString[index]) else {
        return nil
      }
      index = hexString.index(index, offsetBy: 1)
      guard let lsb = Data.convertToInt(hexChar: hexString[index]) else {
        return nil
      }
      index = hexString.index(index, offsetBy: 1)
      let byte = msb << 4 + lsb
      bytes.append(byte)
    }
    self.init(bytes: bytes)
  }
  
  static func convertToInt(hexChar: Character) -> UInt8? {
    if hexChar.unicodeScalars.count < 1 {
      // only ascii is supported
      return nil
    }
    if let firstUnicodeScalar = hexChar.unicodeScalars.first?.value {
      if firstUnicodeScalar >= 48 && firstUnicodeScalar <= 57 {
        return UInt8(firstUnicodeScalar - 48)
      } else if firstUnicodeScalar >= 65 && firstUnicodeScalar <= 70 {
        // capital A-F
        return UInt8(firstUnicodeScalar - 65) + 10
      } else if firstUnicodeScalar >= 97 && firstUnicodeScalar <= 102 {
        // lowercase a-f
        return UInt8(firstUnicodeScalar - 97) + 10
      } else {
        // invalid value
        return nil
      }
    } else {
      // no scalars
      return nil
    }
  }
  
  var hexString: String {
    get {
      var hexString = ""
      for byte in self {
        hexString.append(String(format: "%02x", byte))
      }
      return hexString
    }
  }
}
