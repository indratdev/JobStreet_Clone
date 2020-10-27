//
//  Notif.swift
//  JobStreet_Clone
//
//  Created by IndratS on 27/10/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import Foundation
import NotificationBannerSwift

struct Notif {
    
    func showLocalNotif(title: String, subtitle: String, style: BannerStyle){
        let banner = NotificationBanner(title: title, subtitle: subtitle, style: style)
        banner.show()
    }
    
}
