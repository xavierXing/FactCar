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
  case hotSpot
}

extension MoyaNewsCar: TargetType {
  /// 设置 baseURL
  var baseURL: URL {
    return URL(string: baseLink)!
    
  }
  
  /// 设置拼接上的 URL
  var path: String {
    switch self {
    case .hotSpot:
      return "init.php"
    }
  }
  
  /// 设置请求方式: .get .post
  var method: Moya.Method {
    switch self {
    case .hotSpot:
      return .get
    }
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
  
  public func getHotSpotData(success: @escaping (_ result : NSDictionary) -> (), failed: @escaping (_ error : String) -> ()) -> Void {
    MoyaNewsCarProvider.request(.hotSpot) { result in
        print("当前线程:\(Thread.current)")
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

//#MARK: - 自定义转换 -
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

//#MARK: - 发射器 -
let MoyaNewsCarProvider = MoyaProvider<MoyaNewsCar>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

// #MARK: - 打印LOG -
private func JSONResponseDataFormatter(_ data: Data) -> Data {
  do {
    let dataAsJSON = try JSONSerialization.jsonObject(with: data)
    let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
    return prettyData
  } catch {
    return data
  }
}

