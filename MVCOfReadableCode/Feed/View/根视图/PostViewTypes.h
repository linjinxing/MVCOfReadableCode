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
    /* 用户信息界面 */
    PostViewTagUserInfoProfile = 1,
    PostViewTagUserInfoFollow,
    PostViewTagUserInfoNickname,
    
    /* 内容操作界面 */
    PostViewTagActionViewLike,
    PostViewTagActionViewAddComment,
    PostViewTagActionViewMore,
    
    /* 评论cell */
    PostViewTagCommentTableViewCellMore,
    
    /* 键盘输入 */
    PostViewTagEmojiInputView,/* */
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
