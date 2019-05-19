//
//  RawDataConvertor.swift
//  SalesArmy
//
//  Created by iOS on 2/20/19.
//  Copyright © 2019 iOS. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class RawdataConverter: NSObject {
    /**
     Convert if timestamp to date else return current date
     */
    class func date(_ timestamp: Any?) -> Date {
        if let any = timestamp {
            if let str = any as? String {
                return Date(timeIntervalSince1970: RawdataConverter.double(str))
            } else if let str = any as? NSNumber {
                return Date(timeIntervalSince1970: str.doubleValue)
            }
        }
        return Date()
    }
    /**
     Convert if Any object is timestamp then retuen date else check yyyy-MM-dd HH:mm:ss formate match then return date else return nil
     */
//    class func optionalDate(_ anything: Any?) -> Date? {
//        if let any = anything {
//            if let str = any as? String, !str.isEmpty {
//                if str.contains("-") || str.contains(":") {
//                    return Date.strringFormatted1ToDate(str)
//                }else{
//                    return Date(timeIntervalSince1970: RawdataConverter.double(str))
//                }
//            } else if let str = any as? NSNumber {
//                return Date(timeIntervalSince1970: str.doubleValue)
//            }
//        }
//        return nil
//    }
    /**
     Convert Any object to integer
     */
    class func integer(_ anything: Any?) -> Int {
        
        if let any = anything {
            if let num = any as? NSNumber {
                return num.intValue
            } else if let str = any as? NSString {
                return str.integerValue
            }
        }
        return 0
    }
    /**
     Convert if Any object is integer then return integer value else return nil
     */
    class func optionalInteger(_ anything: Any?) -> Int? {
        if let any = anything {
            if let num = any as? NSNumber {
                return num.intValue
            } else if let str = any as? NSString {
                return str.integerValue
            }
        }
        return nil
    }
    
    /**
     Convert Any object to integer16
     */
    class func integer16(_ anything: Any?) -> Int16 {
        
        if let any = anything {
            if let num = any as? NSNumber {
                return num.int16Value
            } else if let str = any as? NSString {
                return Int16(str.intValue)
            }
        }
        return 0
    }
    
    /**
     Convert if Any object is integer16 then return integer16 value else return nil
     */
    class func optionalInteger16(_ anything: Any?) -> Int16? {
        if let any = anything {
            if let num = any as? NSNumber {
                return num.int16Value
            } else if let str = any as? NSString {
                return Int16(str.intValue)
            }
        }
        return nil
    }
    /**
     Convert Any object to int32
     */
    class func int32(_ anything: Any?) -> Int32 {
        if let any = anything {
            if let num = any as? NSNumber {
                return num.int32Value
            } else if let str = any as? NSString {
                return str.intValue
            }
        }
        return 0
    }
    /**
     Convert if Any object is int32 then return int32 value else return nil
     */
    class func optionalInt32(_ anything: Any?) -> Int32? {
        if let any = anything {
            if let num = any as? NSNumber {
                return num.int32Value
            } else if let str = any as? NSString {
                return str.intValue
            }
        }
        return nil
    }
    
    /**
     Convert Any object to int64
     */
    class func int64(_ anything: Any?) -> Int64 {
        if let any = anything {
            if let num = any as? NSNumber {
                return num.int64Value
            } else if let str = any as? NSString {
                return Int64(str.intValue)
            }
        }
        return 0
    }
    /**
     Convert if Any object is int64 then return int64 value else return nil
     */
    class func optionalInt64(_ anything: Any?) -> Int64? {
        if let any = anything {
            if let num = any as? NSNumber {
                return num.int64Value
            } else if let str = any as? NSString {
                return Int64(str.intValue)
            }
        }
        return nil
    }
    /**
     Convert Any object to double
     */
    class func double(_ anything: Any?) -> Double {
        if let any = anything {
            if let num = any as? NSNumber {
                return num.doubleValue
            } else if let str = any as? NSString {
                return str.doubleValue
            }
        }
        return 0
    }
    /**
     Convert if Any object is double then return double value else return nil
     */
    class func optionalDouble(_ anything: Any?) -> Double? {
        if let any = anything {
            if let num = any as? NSNumber {
                return num.doubleValue
            } else if let str = any as? NSString {
                return str.doubleValue
            }
        }
        return nil
    }
    /**
     Convert Any object to float
     */
    class func float(_ anything: Any?) -> Float {
        if let any = anything {
            if let num = any as? NSNumber {
                return num.floatValue
            } else if let str = any as? NSString {
                return str.floatValue
            }
        }
        return 0
    }
    /**
     Convert if Any object is float then return float value else return nil
     */
    class func optionalFloat(_ anything: Any?) -> Float? {
        if let any = anything {
            if let num = any as? NSNumber {
                return num.floatValue
            } else if let str = any as? NSString {
                return str.floatValue
            }
        }
        return nil
    }
    /**
     Convert Any object to string
     */
    class func string(_ anything: Any?) -> String {
        if let any = anything {
            if let num = any as? NSNumber {
                return num.stringValue
            } else if let str = any as? String {
                return str
            }
        }
        return ""
    }
    /**
     Convert if Any object is string then return string else return nil
     */
    class func optionalString(_ anything: Any?, isEmpty: Bool = false) -> String? {
        if let any = anything {
            if let num = any as? NSNumber {
                if isEmpty{
                    return num.stringValue.isEmpty ? nil : num.stringValue
                }
                return num.stringValue
            } else if let str = any as? String {
                if isEmpty{
                    return str.isEmpty ? nil : str
                }
                return str
            }
        }
        return nil
    }
    /**
     Convert if Any object is boolean then return boolean value else return false
     */
    class func boolean(_ anything: Any?) -> Bool {
        if let any = anything {
            if let num = any as? NSNumber {
                return num.boolValue
            } else if let str = any as? NSString {
                return str.boolValue
            }
        }
        return false
    }
    /**
     Convert if Any object is data type dictionary and also is not empty then return dictionary else return nil
     */
    class func dictionary(_ anything: Any?) -> [String:Any]? {
        if let any = anything {
            if let dict = any as? [String:Any] {
                return !dict.isEmpty ? dict : nil
            }
        }
        return nil
    }
    /**
     Convert if Any object is data type array and is also is not empty then return array else return nil
     */
    class func array(_ anything: Any?) -> [Any]? {
        if let any = anything {
            if let arr = any as? [Any] {
                return !arr.isEmpty ? arr : nil
            }
        }
        
        return nil
    }
    
    
    /**
     Convert any object to Json formate string if any error occurs then return empty string
     */
    class func toJsonString(_ parm : Any) -> String{
        do{
            let jsonData: Data = try JSONSerialization.data(withJSONObject: parm, options: JSONSerialization.WritingOptions.prettyPrinted)
            if let datastring = String(data: jsonData, encoding: String.Encoding.utf8){
                return datastring
            }
        } catch let error {
            print("toJsonString ERROR :\(error.localizedDescription)")
        }
        return  ""
    }
    /**
     Convert JSON String to Any if any error occurs then return nil
     */
    class func jsonStringToAny(_ text: String) -> Any? {
        if let data = text.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                return json
            }  catch let error{
                print("jsonStringToAny ERROR :\(error.localizedDescription)")
            }
        }
        return nil
    }
}
