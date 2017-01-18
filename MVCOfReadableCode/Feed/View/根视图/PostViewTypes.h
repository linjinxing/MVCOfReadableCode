//
//  PostViewTypes.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/17.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#ifndef PostViewTypes_h
#define PostViewTypes_h

typedef NS_ENUM(NSInteger, PostViewTag) {
    PostViewTagLikeButton = 1 ,
    PostViewTagInputEmotionView,
    PostViewTagShareButton,
    PostViewTagUserInfoProfile,
    PostViewTagUserInfoFollow,
    PostViewTagUserInfoNickname,
    PostViewTagActionViewLike,
    PostViewTagActionViewAddComment,
    PostViewTagActionViewMore,
};

typedef NS_ENUM(NSInteger, PostViewCollectionViewTag) {
    PostViewCollectionViewTagLikeUsers = 1,
    PostViewCollectionViewTagDescription,
    
};

typedef NS_ENUM(NSInteger, PostViewTableViewSectionIndex) {
    PostViewTableViewSectionIndexActionTag = 1,
    PostViewTableViewSectionIndexLikeUsers,
    PostViewTableViewSectionIndexComments,
    PostViewTableViewSectionCount = PostViewTableViewSectionIndexComments
};

#endif /* PostViewTypes_h */
