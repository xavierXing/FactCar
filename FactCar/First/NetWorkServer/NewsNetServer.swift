//
//  NewsNetServer.swift
//  FactCar
//
//  Created by 邢浩 on 2017/8/4.
//  Copyright © 2017年 邢浩. All rights reserved.
//

import UIKit
import Moya
import Alamofire

var baseLink: String = "http://api.news18a.com/"

enum MoyaNewsCar {
  case hotSpot,video,live,business,evaluating,shopping,newCar,useCar,calture,travel,technology,market
}

extension MoyaNewsCar: TargetType {
  /// 设置 baseURL
  var baseURL: URL {
    return URL(string: baseLink)!
    
  }
  
  /// 设置拼接上的 URL
  var path: String {
      return "init.php"
  }
  
  /// 设置请求方式: .get .post
  var method: Moya.Method {
      return .get
  }
  
  /// 设置链接中是否携带参数
  var parameters: [String: Any]? {
    switch self {
    case .hotSpot:
      return [
        "m": "ina_app",
        "c": "index",
        "a": "index_new"
      ]
    case .video:
      return [
        "m": "ina_app",
        "c": "vedio",
        "a": "focus"
      ]
    case .live:
      return [
        "m": "ina_app",
        "c": "vedio",
        "a": "new_live"
      ]
    case .business: 
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "industry"
      ]
    case .evaluating:
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "evaluation"
      ]
    case .shopping:
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "guide"
      ]
    case .newCar:
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "newCar"
      ]
    case .useCar:
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "useCar"
      ]
    case .calture:
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "culture"
      ]
    case .travel:
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "travel"
      ]
    case .technology:
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "technology"
      ]
    case .market:
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "market"
      ]
    }
    
  }
  
  /// 设置参数转码方式
  var parameterEncoding: ParameterEncoding {
    return URLEncoding.default
  }
  
  var sampleData: Data {
    return "{}".data(using: String.Encoding.utf8)!
  }
  
  /// 设置task
  var task: Task {
    return .request
  }
  
  /// 是否执行Alamofire验证。默认为"false"
  var validate: Bool {
    return true
  }
}

class NewsNetServer: NSObject {
  
  /// 请求类型枚举
  var netWorkDataType: MoyaNewsCar! = .hotSpot
  
  /// 获取网络数据
  public func moyaGetData(type: MoyaNewsCar, success: @escaping (_ result : NSDictionary) -> (),failed: @escaping (_ error : String) -> ()) -> Void {
    MoyaNewsCarProvider.request(type) { (result) in
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

//MARK: - Private Method -
extension NewsNetServer {
  
}


//MARK: - 自定义转换 -
extension Moya.Response {
  func mapNSDictionary() throws -> NSDictionary {
    let any = try self.mapJSON()
    guard let dictionary = any as? NSDictionary else {
      throw MoyaError.jsonMapping(self)
      
    }
    return dictionary
  }
  
  func mapNSArray() throws -> NSArray {
    let any = try self.mapJSON()
    guard let array = any as? NSArray else {
      throw MoyaError.jsonMapping(self)
    }
    return array
  }
  
}

//MARK: - 发射器 -
let MoyaNewsCarProvider = MoyaProvider<MoyaNewsCar>(endpointClosure: endpointClosure ,plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

//MARK: - 设置请求头信息 -
let endpointClosure = { (target: MoyaNewsCar) -> Endpoint<MoyaNewsCar> in
  let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
  return defaultEndpoint.adding(newHTTPHeaderFields: ["User-Agent": "VersionCode=\(swiftGetCFBundleVersion())"])
}

//MARK: - 打印LOG -
private func JSONResponseDataFormatter(_ data: Data) -> Data {
  do {
    let dataAsJSON = try JSONSerialization.jsonObject(with: data)
    let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
    return prettyData
  } catch {
    return data
  }
}

