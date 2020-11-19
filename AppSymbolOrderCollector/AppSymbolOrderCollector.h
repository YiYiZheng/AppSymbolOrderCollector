//
//  AppSymbolOrderCollector.h
//  AppSymbolOrderCollector
//
//  Created by 郑尧元 on 2020/05/10.
//  Copyright © 2020 郑尧元. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for AppSymbolOrderCollector.
FOUNDATION_EXPORT double AppSymbolOrderCollectorVersionNumber;

//! Project version string for AppSymbolOrderCollector.
FOUNDATION_EXPORT const unsigned char AppSymbolOrderCollectorVersionString[];

extern void exportOrderFile(void(^completion)(NSString *orderFilePath));

