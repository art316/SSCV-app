//
//  Enums.swift
//  SSCV
//
//  Created by dev ios on 9/2/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation

enum ProfileTableViewType {
    case imageProfile
    case summary
    case skills
    case experience
    case education
}

enum SSCVServicesError: Error{
    case InvalidUrl
    case serverError
    case jsonError
    case requestError
}

enum Result<TalentManifesto,Error> {
    case success(TalentManifesto)
    case failure(SSCVServicesError)
}
