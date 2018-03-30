//
//  Datasource.swift
//  MultiScreenInOne
//
//  Created by Ky Nguyen Coinhako on 3/30/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import Foundation

struct Datasource {
    private let maxItemCount = 20
    private let names = [
        "Olivia", "Ava", "Sophia", "Isabella", "Mia",
        "Charlotte", "Abigail", "Emily", "Harper", "Amelia",
        "Evelyn", "Elizabeth", "Sofia", "Madison", "Avery",
        "Ella", "Scarlett", "Grace", "Chloe", "Victoria",
        "Riley", "Aria", "Lily", "Aubrey", "Zoey",
        "Penelop", "Lillian", "Addison","Layla", "Natalie",
        "Camila", "Hannah", "Brookly", "Zoe", "Nora",
        "Leah", "Savannah", "Audrey", "Claire", "Eleanor",
        "Skylar", "Ellie", "Samantha", "Stella", "Paisley",
        "Violet", "Mila", "Allison", "Alexa", "Anna",
        "Hazel", "Aaliyah", "Ariana", "Lucy", "Caroline",
        "Sarah", "Genesis", "Kennedy", "Sadie", "Gabriell",
        "Madelyn", "Adeline", "Maya", "Autumn", "Aurora",
        "Piper", "Hailey", "Arianna", "Kaylee", "Ruby",
        "Serenity", "Eva", "Naomi", "Nevaeh", "Alice",
        "Luna", "Bella", "Quinn", "Lydia", "Peyton",
        "Melanie", "Kylie", "Aubree", "Mackenzi", "Kinsley",
        "Cora", "Julia", "Taylor", "Katherin", "Madeline",
        "Gianna", "Eliana", "Elena", "Vivian", "Willow",
        "Reagan", "Brianna", "Clara", "Faith", "Karen"
    ]
    
    private let cities = [
        "Bangkok", "London", "Paris", "Dubai", "New York",
        "Singapore", "Kuala Lumpur", "Istanbul", "Tokyo",
        "Seoul", "Hong Kong", "Barcelona", "Amsterdam", "Milan",
        "Taipei", "Rome", "Osaka", "Vienna", "Shanghai", "Prague",
        "Los Angeles", "Madrid", "Munich", "Miami", "Dublin"
    ]
    
    func getPendingList(page: Int) -> [String] {
        let startIndex = maxItemCount * page
        var endIndex = startIndex + maxItemCount
        if endIndex < names.count { endIndex = names.count }
        return Array(names[startIndex ..< endIndex])
    }
    
    func getCompletedList(page: Int) -> [String] {
        let startIndex = maxItemCount * page
        var endIndex = startIndex + maxItemCount
        if endIndex < cities.count { endIndex = cities.count }
        return Array(cities[startIndex ..< endIndex])
    }
    
    func getFilterList() -> [String] {
        let filterCities = Array(cities[0 ..< 10])
        let filterNames = Array(names[10 ..< 30])
        return filterCities + filterNames
    }
    
    
    
}
