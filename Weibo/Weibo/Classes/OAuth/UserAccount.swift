//
//  UserAccount.swift
//  Weibo
//
//  Created by nsky on 16/4/19.
//  Copyright © 2016年 nsky. All rights reserved.
//

import UIKit
// Swift2.0 打印对象需要重写CustomStringConvertible 协议中的description
class UserAccount: NSObject, NSCoding {
    
    /// 接口授权后的RequestToken
    var access_token: String?
    /// access_token的生命周期，单位是秒数
    var expires_in: NSNumber?
    /// 授权用户的UID
    var uid: String?
    
    init(dict: [String: AnyObject]) {
        
        access_token = dict["access_token"] as? String
        expires_in = dict["expires_in"] as? NSNumber
        uid = dict["uid"] as? String

    }

    override var description: String{
        // 1.定义属性数组
        let properties = ["access_token","expires_in","uid"]
        // 2.根据属性数组,将属性转换为字典
        let dict = self.dictionaryWithValuesForKeys(properties)
        // 2.将字典转换为字符串
        return "\(dict)"
    }
    
    /**
     返回用户是否登录
     */
    
    class func userLogin() ->Bool
    {
        return UserAccount.loadAccount() != nil
    }
    
    
    // MARK: - 保存和读取 Keyed
    /**
     保存授权模型
     */
    func saveAccount()
    {
        let filePath = ("account.plist").cacheDir()
        print("filePath \(filePath)")
        NSKeyedArchiver.archiveRootObject(self, toFile: filePath)
    }
    
    // 加载授权模型
    static var account: UserAccount?
    class func loadAccount() -> UserAccount? {
        let filePath = ("account.plist").cacheDir()
        
        // 1.判断是否已经加载过
        if account != nil {
            return account
        }
        
        // 2.2加载授权模型
        account = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? UserAccount
        return account
    }
    
    
    
    // MARK: - NSCoding
    // 将对象写入到文件中
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeObject(expires_in, forKey: "expires_in")
        aCoder.encodeObject(uid, forKey: "uid")


    }
    //  从文件中读取对象
    required init?(coder aDecoder: NSCoder)
    {
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        expires_in = aDecoder.decodeObjectForKey("expires_in") as? NSNumber
        uid = aDecoder.decodeObjectForKey("uid") as? String

    }
    
}