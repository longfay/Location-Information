//
//  ViewController.swift
//  Localization
//
//  Created by 龙菲 on 2016-03-30.
//  Copyright © 2016 Fay. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    
    //定位管理器
    let locationManager:CLLocationManager = CLLocationManager()

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var label7: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        if !CLLocationManager.locationServicesEnabled()
  //      {
    //        dispatch_async(dispatch_get_main_queue())
      //      {
        //        SCMessageBox.showquick(self, contentMSG: "无法定位，因为您的设备没有启用定位服务，请设置")
          //  }
          //  return
       // }
        
        
        
        //设置定位服务管理器代理
        locationManager.delegate = self
        //设置定位精度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //更新距离
        locationManager.distanceFilter = 0.01
        
        //发送授权申请
        locationManager.requestAlwaysAuthorization()
        
        
        if (CLLocationManager.locationServicesEnabled())
        {
            //允许使用定位服务的话，开启定位服务更新
            locationManager.startUpdatingLocation()
            print("定位开始")
        }else{
            print("没有定位服务")
        }
    }
    
    
    
    //定位改变执行，可以得到新位置、旧位置
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        //获取最新的坐标
        let currLocation:CLLocation = locations.last!
        label1.text = "经度：\(currLocation.coordinate.longitude)"
        print(currLocation.coordinate.longitude)
        //获取纬度
        label2.text = "纬度：\(currLocation.coordinate.latitude)"
        //获取海拔
        label3.text = "海拔：\(currLocation.altitude)"
        //获取水平精度
        label4.text = "水平精度：\(currLocation.horizontalAccuracy)"
        //获取垂直精度
        label5.text = "垂直精度：\(currLocation.verticalAccuracy)"
        //获取方向
        label6.text = "方向：\(currLocation.course)"
        //获取速度
        label7.text = "速度：\(currLocation.speed)"
    }
}


