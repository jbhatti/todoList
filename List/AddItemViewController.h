//
//  AddItemViewController.h
//  List
//
//  Created by Jaison Bhatti on 2017-08-21.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddItemViewControllerDelegate <NSObject>

- (void)didSaveNewTodo:(NSString*)todoText;

@end

@interface AddItemViewController : UIViewController

@property (nonatomic, strong) id <AddItemViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
