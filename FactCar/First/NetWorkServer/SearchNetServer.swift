//
//  SearchNetServer.swift
//  FactCar
//
//  Created by LeoTai on 2017/8/30.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit
import Moya
import Alamofire

enum MoyaSearch {
  case searchContent(page:Int),searchStory(page:Int,keyWord:String,storyType:String),searchCarMoudle(page:Int,keyWord:String),searchVideo(page:Int,keyWord:String)
}

extension MoyaSearch: TargetType {
  
  var baseURL: URL {
    return URL(string: baseLink)!
  }
  
  var path: String {
    return basePath
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var parameters: [String: Any]? {
    switch self {
    case .searchContent(let page):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "search",
        "storyPage": page
      ]
    case .searchStory(let page, let keyWord, let storyType):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "search",
        "storyPage": page,
        "keyword": keyWord,
        "type": "story",
        "story_type": storyType
      ]
    case .searchCarMoudle(let page,let keyWord):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "search",
        "storyPage": page,
        "keyword": keyWord,
        "type": "bseries",
      ]
    case .searchVideo(let page,let keyWord):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "search",
        "storyPage": page,
        "keyword": keyWord,
        "type": "vedio",
      ]
    }
  }
  
  var parameterEncoding: ParameterEncoding {
    return URLEncoding.default
  }
  
  var sampleData: Data {
    return "{}".data(using: String.Encoding.utf8)!
  }
  
  var task: Task {
    return .request
  }
  
  var validate: Bool {
    return true
  }
}

class SearchNetServer: NewsNetServer {
  public func moyaGetSearchData(type:MoyaSearch,success:@escaping (_ result:NSDictionary) -> (),failed:@escaping (_ error:String) -> ()) -> Void {
    MoyaSearchProvider.request(type) { (result) in
      do {
        let response = try result.dematerialize()
        let value = try response.mapNSDictionary()
        success(value)
      } catch {
        let errorPrint = error as CustomStringConvertible
        let errorMessage = errorPrint.description
        failed(errorMessage)
      }
    }
    
  }
}

let MoyaSearchProvider = MoyaProvider<MoyaSearch>(endpointClosure: endpointSearchClosure, plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter:JSONResponseDataFormatter)])


let endpointSearchClosure = { (target: MoyaSearch) -> Endpoint<MoyaSearch> in
  let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
  return defaultEndpoint.adding(newHTTPHeaderFields: ["User-Agent": "VersionCode=\(swiftGetCFBundleVersion())"])
}

let netWorkManager:SearchNetServer = SearchNetServer()




