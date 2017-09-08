//
//  SearchMoudle.swift
//  FactCar
//
//  Created by LeoTai on 2017/9/4.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit
import ObjectMapper

// MARK: - 搜索界面 -
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

// MARK: - 搜索 : 文章 -
class SearchStory: Mappable {
  var status: String!
  var data: SearchStoryData!
  var code: Int = 0
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    status <- map["status"]
    data <- map["data"]
    code <- map["code"]
  }
}

class SearchStoryData: Mappable {
  var story: [SearchStoryParameter]!
  var search_ad: searchStoryAD!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    story <- map["story"]
    search_ad <- map["search_ad"]
  }
}

class SearchStoryParameter: Mappable {
  var source: String!
  var main_column: Int = 0
  var title: String!
  var url: String!
  var keyword: String!
  var mobiletitle: String!
  var top: String!
  var is_ad: String!
  var shorttitle: String!
  var story_id: Int = 0
  var story_date: String!
  var column_id: Int = 0
  var short_summary: String!
  var is_private_int: Int = 0
  var source_id: String!
  var title_pic1: String!
  var title_pic2: String!
  var editor: String!
  var ad_type: Int = 0
  var author: String!
  var is_private: String!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    source <- map["source"]
    main_column <- map["main_column"]
    title <- map["title"]
    url <- map["url"]
    keyword <- map["keyword"]
    mobiletitle <- map["mobiletitle"]
    top <- map["top"]
    is_ad <- map["is_ad"]
    shorttitle <- map["shorttitle"]
    story_id <- map["story_id"]
    story_date <- map["story_date"]
    column_id <- map["column_id"]
    short_summary <- map["short_summary"]
    is_private_int <- map["is_private_int"]
    source_id <- map["source_id"]
    title_pic1 <- map["title_pic1"]
    title_pic2 <- map["title_pic2"]
    shorttitle <- map["shorttitle"]
    editor <- map["editor"]
    ad_type <- map["ad_type"]
    author <- map["author"]
    is_private <- map["is_private"]
  }
}

class searchStoryAD: Mappable {
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

// MARK: - 搜索: 车型 -
class SearchCarModuleModel: Mappable {
  var status: String!
  var data: CarModuleData!
  var code: Int = 0
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    status <- map["status"]
    data <- map["data"]
    code <- map["code"]
  }
  
}

class CarModuleData: Mappable {
  var bseries: [Bseries]!
  var search_ad: carMoudleAD!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    bseries <- map["bseries"]
    search_ad <- map["search_ad"]
  }
  
}

class Bseries: Mappable {
  var maxprice: String!
  var url: String!
  var salestate: String!
  var minprice: String!
  var bseries_id: String!
  var showname: String!
  var cspic: String!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    maxprice <- map["maxprice"]
    url <- map["url"]
    salestate <- map["salestate"]
    minprice <- map["minprice"]
    bseries_id <- map["bseries_id"]
    showname <- map["showname"]
    cspic <- map["cspic"]
  }
  
}

class carMoudleAD :Mappable {
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

// MARK: - 搜索: 视频 -
class Share :Mappable {
  var title: String!
  var pic: String!
  var intro: String!
  var url: String!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    title <- map["title"]
    pic <- map["pic"]
    intro <- map["intro"]
    url <- map["url"]
  }
  
}

class Video :Mappable {
  var vedio_type: String!
  var title_pic1: String!
  var id: Int = 0
  var time: String!
  var title: String!
  var base_count: String!
  var publish_time: String!
  var share: Share!
  var column_id: Int = 0
  var url: String!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    vedio_type <- map["vedio_type"]
    title_pic1 <- map["title_pic1"]
    id <- map["id"]
    time <- map["time"]
    title <- map["title"]
    base_count <- map["base_count"]
    publish_time <- map["publish_time"]
    share <- map["share"]
    column_id <- map["column_id"]
    url <- map["url"]
  }
  
}

class SearchVideoAD :Mappable {
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

class SearchVideoData :Mappable {
  var vedio: [Video]!
  var search_ad: SearchVideoAD!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    vedio <- map["vedio"]
    search_ad <- map["search_ad"]
  }
  
}

class SearchVideo :Mappable {
  var status: String!
  var data: SearchVideoData!
  var code: Int = 0
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    status <- map["status"]
    data <- map["data"]
    code <- map["code"]
  }
}

