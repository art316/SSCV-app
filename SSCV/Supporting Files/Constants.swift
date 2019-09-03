//
//  Constants.swift
//  SSCV
//
//  Created by dev ios on 8/31/19.
//  Copyright © 2019 sasv. All rights reserved.
//

import Foundation
//let ImageUrl = "https://scontent.fmex2-1.fna.fbcdn.net/v/t1.0-9/53050733_10157400441146742_2895345038869397504_o.jpg?_nc_cat=101&_nc_oc=AQlHGESBftHntdxo8Gix00b5RAvG78VrGM7_ah9G3Gqv0WAe-FXjJdZw14kNkbqARJg&_nc_ht=scontent.fmex2-1.fna&oh=d835be3330e3de1ac188e4f1c5e113d9&oe=5E08C769"

struct ProfileUrls{
    static let sscv = "https://gist.githubusercontent.com/art316/aa4249d1d15163d6de0a522a9e632377/raw/4093a90851b632d730dcce3a73925d249694dc9f/xcv"
}

struct EnvironmentKeys{
    static var mock = "useMockServices"
    static var mockTrueValue =  "true"
}

struct JSONFileNames {
    static var sscv = "sscvData"
}

struct ProfileICelldentifier{
    static let Image = "ImageProfileCellIdentifier"
    static let Summary = "SummaryProfileIdentifier"
    static let Education = "EducationProfileIdentifier"
    static let Skill = "SkillProfileIdentifier"
}

struct ViewControllerIdentifiers{
    static let cvViewController = "CVViewControllerID"
}


struct StoryboardNames {
    static let MainStoryboar = "Main"
}

struct ProfileICellName {
    static let Image = "ImageProfileTableViewCell"
    static  let Summary = "SumaryTableViewCell"
    static  let Education = "EducationTableViewCell"
    static  let Skill = "SkillTableViewCell"
}

func getIdentifiersAndClassName() -> [(String,String)]{
    return [(ProfileICelldentifier.Image,ProfileICellName.Image), (ProfileICelldentifier.Summary,ProfileICellName.Summary), (ProfileICelldentifier.Skill,ProfileICellName.Skill), (ProfileICelldentifier.Education,ProfileICellName.Education)]
}

struct ProfileCellHeight{
    static let education  = 101
    static let image = 158
}

struct ProfileCellTitle {
    static let Image = ""
    static let Summary = "Summary"
    static let Experience = "Experience"
    static let Skills = "Skills"
    static let Education = "Education"
}

struct ErrorMessage{
    static var CantAccessMail = "Sorry, it appears you can't send any email from this device, but don't worry the email address have been copied to your clipborad"
    static var CantAccessPhoneUrl = "Sorry, it appears you can't make calls from this device,  but don't worry the phone number have been copied to your clipborad"
    static var ServiceError = " There has been an error with your connection, please check your internet connection"
    static var JSONError = " There has been an error with your recover the profile information, please try again later"
        static var RequestError = " There has been an error with the requested info"
}

struct EmailComponents{
    static var Globant =  "Globant"
    static func getBodyEmailMessageWithName(_ name: String) -> String{
        let message = "Hi \(name)\n I am (name) from Globant, i has seeing your profile and.... "
        return message
    }
}

