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
var basePath: String = "init.php"

enum MoyaNewsCar {
  case hotSpot(index: NSNumber),video(index: NSNumber),live(index: NSNumber),business(index: NSNumber),evaluating(index: NSNumber),shopping(index: NSNumber),newCar,useCar(index: NSNumber),calture(index: NSNumber),travel(index: NSNumber),technology(index: NSNumber),market(index: NSNumber)
}

extension MoyaNewsCar: TargetType {
  /// 设置 baseURL
  var baseURL: URL {
    return URL(string: baseLink)!
    
  }
  
  /// 设置拼接上的 URL
  var path: String {
      return basePath
  }
  
  /// 设置请求方式: .get .post
  var method: Moya.Method {
      return .get
  }
  
  /// 设置链接中是否携带参数
  var parameters: [String: Any]? {
    switch self {
    case .hotSpot(let index):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "index_new",
        "page": index
      ]
    case .video(let index):
      return [
        "m": "ina_app",
        "c": "vedio",
        "a": "focus",
        "page": index
      ]
    case .live(let index):
      return [
        "m": "ina_app",
        "c": "vedio",
        "a": "new_live",
        "page": index
      ]
    case .business(let index):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "industry",
        "page": index
      ]
    case .evaluating(let index):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "evaluation",
        "page": index
      ]
    case .shopping(let index):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "guide",
        "page": index
      ]
    case .newCar:
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "newCar"
      ]
    case .useCar(let index):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "useCar",
        "page": index
      ]
    case .calture(let index):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "culture",
        "page": index
      ]
    case .travel(let index):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "travel",
        "page": index
      ]
    case .technology(let index):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "technology",
        "page": index
      ]
    case .market(let index):
      return [
        "m": "ina_app",
        "c": "index",
        "a": "storylist",
        "storyType": "market",
        "page": index
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
  var netWorkDataType: MoyaNewsCar! = .hotSpot(index: 0)
  
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
  
  /// 修改page参数:自增
  public func moyaChangeEnumIndex(vcType:MoyaNewsCar) -> MoyaNewsCar {
    let index = (vcType.parameters?["page"] as! Int) + 1
    switch vcType {
    case .hotSpot(_):
      return MoyaNewsCar.hotSpot(index: index as NSNumber)
    case .video(_):
      return MoyaNewsCar.video(index: index as NSNumber)
    case .live(_):
      return MoyaNewsCar.live(index: index as NSNumber)
    case .business(_):
      return MoyaNewsCar.business(index: index as NSNumber)
    case .evaluating(_):
      return MoyaNewsCar.evaluating(index: index as NSNumber)
    case .shopping(_):
      return MoyaNewsCar.shopping(index: index as NSNumber)
    case .useCar(_):
      return MoyaNewsCar.useCar(index: index as NSNumber)
    case .calture(_):
      return MoyaNewsCar.calture(index: index as NSNumber)
    case .travel(_):
      return MoyaNewsCar.travel(index: index as NSNumber)
    case .technology(_):
      return MoyaNewsCar.technology(index: index as NSNumber)
    case .market(_):
      return MoyaNewsCar.market(index: index as NSNumber)
    default:
      return MoyaNewsCar.hotSpot(index: index as NSNumber)
    }
  }
  /// 修改page参数:原始
  public func moyaOriginalIndex(vcType:MoyaNewsCar) -> MoyaNewsCar {
    let index = 1
    switch vcType {
    case .hotSpot(_):
      return MoyaNewsCar.hotSpot(index: index as NSNumber)
    case .video(_):
      return MoyaNewsCar.video(index: index as NSNumber)
    case .live(_):
      return MoyaNewsCar.live(index: index as NSNumber)
    case .business(_):
      return MoyaNewsCar.business(index: index as NSNumber)
    case .evaluating(_):
      return MoyaNewsCar.evaluating(index: index as NSNumber)
    case .shopping(_):
      return MoyaNewsCar.shopping(index: index as NSNumber)
    case .useCar(_):
      return MoyaNewsCar.useCar(index: index as NSNumber)
    case .calture(_):
      return MoyaNewsCar.calture(index: index as NSNumber)
    case .travel(_):
      return MoyaNewsCar.travel(index: index as NSNumber)
    case .technology(_):
      return MoyaNewsCar.technology(index: index as NSNumber)
    case .market(_):
      return MoyaNewsCar.market(index: index as NSNumber)
    default:
      return MoyaNewsCar.hotSpot(index: index as NSNumber)
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
func JSONResponseDataFormatter(_ data: Data) -> Data {
  do {
    let dataAsJSON = try JSONSerialization.jsonObject(with: data)
    let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
    return prettyData
  } catch {
    return data
  }
}

