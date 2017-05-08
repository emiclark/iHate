//
//  GameListViewController.h
//  iHate
//
//  Created by Emiko Clark on 5/4/17.
//
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "WAMGameViewController.h"

@interface GameListViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) DAO *dao;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *audioButton;
@property (strong, nonatomic) NSString *game;
@property (weak, nonatomic) UIImage *victimPhoto;
@property UIImage *chosenImage;

- (IBAction)audioButtonTapped:(UIButton *)sender;
- (IBAction)continuePressed:(id)sender;

@end
