//
//  DiscountFunctionTest.swift
//  product_discountTests
//
//  Created by Jonathan Phouminh on 7/16/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import XCTest
@testable import product_discount  // importing the project into a testable suite


class DiscountFunctionTest: XCTestCase {
    
    func testDiscountMethod(){
        //given
        let product = Product("Clorox", 10.0)
         
         // when
        let discountPrice = product.calculateDiscount(0.1)
        
         
        XCTAssertEqual(discountPrice, 9.0)
        
    }
        
}
