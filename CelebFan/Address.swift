//
//  Address.swift
//  SwiftHappyLife
//
//  Created by MacStudent on 2019-06-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation


class Address {
    
    var houseNo : String
    var streetName  : String
    var city  : String
    var country  : String
    var postalCode : String
    
    
    init(houseNo : String , streetName : String , city : String , country : String , postalCode : String) throws {
        self.houseNo = houseNo
        self.streetName = streetName
        self.city = city
        self.country = country
        if postalCode.count < 6 {
            throw UserError.InvalidPostalCode(msg : "Invalid PostalCode")
        }
        self.postalCode = postalCode
    }
    
    init()  {
        self.houseNo = String()
        self.streetName = String()
        self.city = String()
        self.country = String()
        self.postalCode = String()
    }
}
