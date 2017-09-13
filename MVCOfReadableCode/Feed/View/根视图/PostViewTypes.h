//
//  PostViewTypes.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/17.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#ifndef PostViewTypes_h
#define PostViewTypes_h

typedef NS_ENUM(NSInteger, PostViewEventHandlerTag) {
    /* 图片显示 */
    PostViewEventHandlerTagImagesView = 1,
    
    /* 用户信息界面 */
    PostViewEventHandlerTagUserInfoProfile ,
    PostViewEventHandlerTagUserInfoFollow,
    PostViewEventHandlerTagUserInfoNickname,
    
    /* 内容操作界面 */
    PostViewEventHandlerTagActionViewLike,
    PostViewEventHandlerTagActionViewAddComment,
    PostViewEventHandlerTagActionViewMore,
    PostViewEventHandlerTagActionViewShare,
    
    /* 评论cell */
    PostViewEventHandlerTagCommentTableViewCellMore,
    
    PostViewTableViewCellLikeUsers,
    
    /* 键盘输入 */
    PostViewEventHandlerTagEmojiInputView,
    /* 添加评论 */
    PostViewEventHandlerTagAddComment,
};

typedef NS_ENUM(NSInteger, PostViewCollectionViewTag) {
    PostViewCollectionViewTagLikeUsers = 1,
    PostViewCollectionViewTagDescription,
    
};

typedef NS_ENUM(NSInteger, PostViewTableViewSectionIndex) {
    PostViewTableViewSectionIndexActionTag,
    PostViewTableViewSectionIndexLikeUsers,
    PostViewTableViewSectionIndexComments,
    PostViewTableViewSectionCount
};

#endif /* PostViewTypes_h */
