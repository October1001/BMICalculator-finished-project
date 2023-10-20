//
//  BMICalculatorTests.swift
//  BMICalculatorTests
//
//  Created by khoirunnisa' rizky noor fatimah on 18/10/23.
//

import XCTest
@testable import BMICalculator

final class BMICalculatorTests: XCTestCase {
    var bmiViewModel: BodyMassIndexViewModel?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        bmiViewModel = BodyMassIndexViewModel()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        bmiViewModel = nil
        
    }

    func testBMIResult() throws {
        // Below is the logic we are going to measure
        let result1  = bmiViewModel?.getBMIResult(weight: 50, height: 155)
        let result2 = bmiViewModel?.getBMIResult(weight: 65, height: 155)
        let result3 = bmiViewModel?.getBMIResult(weight: 60, height: 155)
        
        XCTAssertEqual(result1!, 50/(1.55 * 1.55), accuracy: .greatestFiniteMagnitude, "Test 1 is failed")
        XCTAssertEqual(result2!, 65/(1.55 * 1.55), accuracy: .greatestFiniteMagnitude, "Test 2 is failed")
        XCTAssertEqual(result3!, 60/(1.55 * 1.55), accuracy: .greatestFiniteMagnitude, "Test 3 is failed")
        
    }

    func testBMIScale() throws {
        // Below is the logic we are going to measure
        let result1 = 50/(1.55 * 1.55)
        let scale1  = bmiViewModel?.getBMIScale(result: result1)
                       
        let result2 = 65/(1.55 * 1.55)
        let scale2 = bmiViewModel?.getBMIScale(result: result2)
                       
        let result3 = 60/(1.55 * 1.55)
        let scale3 = bmiViewModel?.getBMIScale(result: result3)
        
        assert(scale1! == .normal, "Test 1 is failed")
        assert(scale2! == .overweight, "Test 2 is failed")
        assert(scale3! != .obese, "Test 3 is failed")
        
    }
}
