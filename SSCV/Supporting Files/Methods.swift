//
//  GlobalMethods.swift
//  SSCV
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation

func createLocation(city: String, country: String) -> String{
    return "\(city),\(country)"
}

func getPeriod(from: String, to: String) -> String?{
    var periodText : String? = nil
    if let stringFromDate = getStringDateFromString(serviceDate: from), let stringToDate = getStringDateFromString(serviceDate: to){
        periodText = "(\(stringFromDate) - \(stringToDate))"
    }
    return periodText
}

func getStringDateFromString(serviceDate: String) -> String?{
    guard let date = DateFormatter.serviceDateFormatter.date(from: serviceDate) else{
        return nil
    }
    return DateFormatter.customDateFormatter.string(from: date)
}
