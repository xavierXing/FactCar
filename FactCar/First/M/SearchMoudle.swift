//
//  SearchMoudle.swift
//  FactCar
//
//  Created by LeoTai on 2017/9/4.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit
import ObjectMapper

class SearchMoudle: Mappable {
  var status: String!
  var data: SearchData!
  var code: Int = 0
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    status <- map["status"]
    data <- map["data"]
    code <- map["code"]
  }
  
}

class SearchData: Mappable {
  var story: [Story]!
  var search_ad: Search_ad!
  var tagHotArr: [TagHotArr]!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    story <- map["story"]
    search_ad <- map["search_ad"]
    tagHotArr <- map["tagHotArr"]
  }
}

class Story: Mappable {
  var source: String!
  var story_date: String!
  var title_pic1: String!
  var title_pic2: String!
  var story_id: String!
  var title: String!
  var shorttitle: String!
  var source_id: String!
  var top: String!
  var short_summary: String!
  var url: String!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    source <- map["source"]
    story_date <- map["story_date"]
    title_pic1 <- map["title_pic1"]
    title_pic2 <- map["title_pic2"]
    story_id <- map["story_id"]
    title <- map["title"]
    shorttitle <- map["shorttitle"]
    source_id <- map["source_id"]
    top <- map["top"]
    short_summary <- map["short_summary"]
    url <- map["url"]
  }
}

class Search_ad: Mappable {
  var url: String!
  var img: String!
  var alt: String!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    url <- map["url"]
    img <- map["img"]
    alt <- map["alt"]
  }
}

class TagHotArr: Mappable {
  var userid: String!
  var color: String!
  var time: String!
  var shorttitle: String!
  var title: String!
  var is_ad: String!
  var act_date: String!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    userid <- map["userid"]
    color <- map["color"]
    time <- map["time"]
    shorttitle <- map["shorttitle"]
    title <- map["title"]
    is_ad <- map["is_ad"]
    act_date <- map["act_date"]
  }
}

