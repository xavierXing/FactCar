//
//  WTSNewsMoudleS.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/18.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit
import ObjectMapper

// MARK: - 热点Moudle -
class WTSHotSpotMoudle: Mappable {
  var status: String!
  var data: [WTSHSMData]!
  var code: Int = 0
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    status <- map["status"]
    data <- map["data"]
    code <- map["code"]
  }
}

class WTSHSMData: Mappable {
  var button: String!
  var top_ad: WTSHSMDTopAd!
  var focus: [WTSHSMDFocus]!
  var topNewsData: [WTSHSMDNewsData]!
  var four_button: [WTSHSMDFourBtn]!
  var hotNewsData: [WTSHSMDNewsData]!
  var first_ad: WTSHSMDFirstAd!
  var news_ad: WTSHSMDNewsAd!
  var down_ad: WTSHSMDDownAd!
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    button <- map["button"]
    top_ad <- map["top_ad"]
    focus <- map["focus"]
    topNewsData <- map["topNewsData"]
    four_button <- map["four_button"]
    hotNewsData <- map["hotNewsData"]
    first_ad <- map["first_ad"]
    news_ad <- map["news_ad"]
    down_ad <- map["down_ad"]
  }
}

class WTSHSMDTopAd: Mappable {
  var url: String!
  var img: String!
  var s_img: String!
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    url <- map["url"]
    img <- map["img"]
    s_img <- map["s_img"]
  }
}

class WTSHSMDFocus: Mappable {
  var img: String!
  var alt: String!
  var url: String!
  var type: String!
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    img <- map["img"]
    alt <- map["alt"]
    url <- map["url"]
    type <- map["type"]
  }
  
}

class WTSHSMDNewsAd :Mappable {
  var url: String!
  var img: String!
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    url <- map["url"]
    img <- map["img"]
  }
  
}


///里面包括top && hot两组
class WTSHSMDNewsData: Mappable {
  var id: Int = 0
  var base_count: Int = 0
  var islike: String!
  var title_pic1: String!
  var islike_count: Int = 0
  var author: String!
  var column_id: String!
  var collection: String!
  var url: String!
  var time: String!
  var type: String!
  var title: String!
  var title_pic2: String!
  var publish_time: String!
  var story_date: String!
  var pub: String!
  var imgs: [WTSNewsMoudle_imgs]!
  var short_summary: String!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    base_count <- map["base_count"]
    islike <- map["islike"]
    title_pic1 <- map["title_pic1"]
    islike_count <- map["islike_count"]
    author <- map["author"]
    column_id <- map["column_id"]
    collection <- map["collection"]
    url <- map["url"]
    time <- map["time"]
    type <- map["type"]
    title <- map["title"]
    title_pic2 <- map["title_pic2"]
    publish_time <- map["publish_time"]
    story_date <- map["story_date"]
    pub <- map["pub"]
    imgs <- map["imgs"]
    short_summary <- map["short_summary"]
  }
}

class WTSHSMDFourBtn: Mappable {
  var name: String!
  var url: String!
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    name <- map["name"]
    url <- map["url"]
  }
}

class WTSHSMDFirstAd: Mappable {
  var img: String!
  var alt: String!
  var url: String!
  var title: String!
  var s_img: String!
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    img <- map["img"]
    alt <- map["alt"]
    url <- map["url"]
    title <- map["title"]
    s_img <- map["s_img"]
  }
}

class WTSHSMDDownAd :Mappable {
  var url: String!
  var img: String!
  var s_img: String!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    url <- map["url"]
    img <- map["img"]
    s_img <- map["s_img"]
  }
  
  
}

// MARK: - 视频Moudle -
class WTSVideoMoudle: Mappable {
  var status: String!
  var data: WTSVMData!
  var code: Int = 0
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    status <- map["status"]
    data <- map["data"]
    code <- map["code"]
  }
}

class WTSVMData: Mappable {
  var focus: [WTSVMDFocus]!
  var config: [WTSVMDConfig]!
  var vedio_list: [WTSVMDVideoList]!
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    focus <- map["focus"]
    config <- map["config"]
    vedio_list <- map["vedio_list"]
  }
}

class WTSVMDFocus: Mappable {
  var id: String!
  var img: String!
  var is_ad: String!
  var url: String!
  var type: String!
  var alt: String!
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    id <- map["id"]
    img <- map["img"]
    is_ad <- map["is_ad"]
    url <- map["url"]
    type <- map["type"]
    alt <- map["alt"]
  }
}

class WTSVMDConfig: Mappable {
  var url: String!
  var name: String!
  var type: String!
  var cid: Int = 0
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    url <- map["url"]
    name <- map["name"]
    type <- map["type"]
    cid <- map["cid"]
  }
}

class WTSVMDVideoList: Mappable {
  var id: String!
  var title_pic1: String!
  var column_id: String!
  var time: String!
  var url: String!
  var title: String!
  var share: WTSVMDVLShare!
  var publish_time: String!
  var islike_count: Int = 0
  var islike: String!
  var base_count: String!
  var collection: String!
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    id <- map["id"]
    title_pic1 <- map["title_pic1"]
    column_id <- map["column_id"]
    time <- map["time"]
    url <- map["url"]
    title <- map["title"]
    share <- map["share"]
    publish_time <- map["publish_time"]
    islike_count <- map["islike_count"]
    islike <- map["islike"]
    base_count <- map["base_count"]
    collection <- map["collection"]
    
  }
}

class WTSVMDVLShare: Mappable {
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

// MARK: - 直播Moudle -
class WTSLiveMoudle: Mappable {
  var status: String!
  var code: Int = 0
  var data: Data!
  var message: String!
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    status <- map["status"]
    code <- map["code"]
    data <- map["data"]
    message <- map["message"]
  }
}

class WTSLData: Mappable {
  var is_show: String!
  var vedio_list: [WTSLVideoList]!
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    is_show <- map["is_show"]
    vedio_list <- map["vedio_list"]
  }
}

class WTSLVideoList: Mappable {
  var id: Int = 0
  var anchor: String!
  var title_pic: String!
  var column_id: Int = 0
  var url: String!
  var type: String!
  var title: String!
  var flash_player: String!
  var platform: String!
  var columns: String!
  var shorttitle: String!
  var is_ad: String!
  var publish_time: String!
  var base_count: String!
  var status: String!
  required init?(map: Map) {
    
  }
  func mapping(map: Map) {
    id <- map["id"]
    anchor <- map["anchor"]
    title_pic <- map["title_pic"]
    column_id <- map["column_id"]
    url <- map["url"]
    type <- map["type"]
    title <- map["title"]
    flash_player <- map["flash_player"]
    platform <- map["platform"]
    columns <- map["columns"]
    shorttitle <- map["shorttitle"]
    is_ad <- map["is_ad"]
    publish_time <- map["publish_time"]
    base_count <- map["base_count"]
    status <- map["status"]
  }
}


// MARK: - 通用Moudle -
class WTSNewsMoudleS: Mappable {
  var status: String!
  var code: Int = 0
  var data: [WTSNewsMoudle_data]!
  var message: String!
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    status <- map["status"]
    code <- map["code"]
    data <- map["data"]
    message <- map["message"]
  }
}

class WTSNewsMoudle_data: Mappable {
  var id: String!
  var imgs: [WTSNewsMoudle_imgs]!
  var title_pic1: String!
  var author: String!
  var column_id: String!
  var url: String!
  var source: String!
  var title: String!
  var addeditor: String!
  var shorttitle: String!
  var title_pic2: String!
  var is_private: String!
  var is_ad: String!
  var pub: String!
  var story_date: String!
  var site_id: String!
  var short_summary: String!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    imgs <- map["imgs"]
    title_pic1 <- map["title_pic1"]
    author <- map["author"]
    column_id <- map["column_id"]
    url <- map["url"]
    source <- map["source"]
    title <- map["title"]
    addeditor <- map["addeditor"]
    shorttitle <- map["shorttitle"]
    title_pic2 <- map["title_pic2"]
    is_private <- map["is_private"]
    is_ad <- map["is_ad"]
    pub <- map["pub"]
    story_date <- map["story_date"]
    site_id <- map["site_id"]
    short_summary <- map["short_summary"]
  }
  
}

class WTSNewsMoudle_imgs: NSObject {
  
}



