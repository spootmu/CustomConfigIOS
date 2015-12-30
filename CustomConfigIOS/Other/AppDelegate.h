//
//  AppDelegate.h
//  CustomConfigIOS
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class MainViewController;
@class LanuchViewController;
@class GuideViewController,MainTabViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property(nonatomic,strong) GuideViewController *GuideView;
@property(nonatomic,strong) MainViewController *MainView;
@property(nonatomic,strong) LanuchViewController *LanuchView;
@property(nonatomic,strong) MainTabViewController *MainTab;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
+ (AppDelegate *)globalDelegate;

@end

