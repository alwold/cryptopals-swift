//
//  CryptoPalsTests.swift
//  CryptoPalsTests
//
//  Created by Al Wold on 1/17/18.
//  Copyright © 2018 Al Wold. All rights reserved.
//

import XCTest
@testable import CryptoPals

class CryptoPalsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  func testConversion() {
    let f = Data.convertToInt(hexChar: "f")
    XCTAssertEqual(f, 15)
    
    let one = Data.convertToInt(hexChar: "1")
    XCTAssertEqual(one, 1)

    let capitalF = Data.convertToInt(hexChar: "F")
    XCTAssertEqual(capitalF, 15)
  }
  
  func testSimpleHex() {
    XCTAssertEqual(Data(hexString: "ff"), Data(bytes: [255]))
  }
    
    func testDataFromHex() {
      let data = Data(hexString: "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d")!
      let expected = Data(bytes: [0x49, 0x27, 0x6d, 0x20, 0x6b, 0x69, 0x6c, 0x6c, 0x69, 0x6e, 0x67, 0x20, 0x79, 0x6f, 0x75, 0x72, 0x20, 0x62, 0x72, 0x61, 0x69, 0x6e, 0x20, 0x6c, 0x69, 0x6b, 0x65, 0x20, 0x61, 0x20, 0x70, 0x6f, 0x69, 0x73, 0x6f, 0x6e, 0x6f, 0x75, 0x73, 0x20, 0x6d, 0x75, 0x73, 0x68, 0x72, 0x6f, 0x6f, 0x6d])
      XCTAssertEqual(data, expected)
    }
  
  func testHexToBase64() {
    let data = Data(hexString: "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d")!
    let base64 = data.base64EncodedString()
    XCTAssertEqual(base64, "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t")
  }
  
  func testXor() {
    let data1 = Data(hexString: "1c0111001f010100061a024b53535009181c")!
    let data2 = Data(hexString: "686974207468652062756c6c277320657965")!
    let xored = data1.xor(with: data2)!
    XCTAssertEqual(xored.hexString, "746865206b696420646f6e277420706c6179")
  }
  
  func testScore() {
    XCTAssertEqual("ETAOIN".score, 45)
  }
  
  func testRepeatingXor() {
    let plaintext = """
      Burning 'em, if you ain't quick and nimble
      I go crazy when I hear a cymbal
      """
    let encrypted = plaintext.data(using: .utf8)!.repeatingXor(with: "ICE".data(using: .utf8)!)
    let expected = Data(hexString: "0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f")
    XCTAssertEqual(encrypted, expected)
  }
  
  func testHammingDistance() {
    let string1 = "this is a test"
    let string2 = "wokka wokka!!!"
    XCTAssertEqual(string1.hammingDistance(to: string2), 37)
  }
    

}
