# LGW_AppStoreGrade
App Store评分方式

目前方式（无版本限制）

只能通过APP内部打开网页形式，直接跳转到App Store 编辑评论。在评分页面，可以评分和评价，评论更有价值。缺点是跳转到App Store，用户的操作场景的转换，会造成部分用户使用的困扰，可能需要花费较长的等待时间，甚至加载失败等，造成评价数量少。
iOS6 +

在APP内部加载App Store 展示APP信息，但不能直接跳转到评论编辑页面。再加载处App Store展示页面后，需要手动点击 评论→ 撰写评论，多两步操作，部分用户可能存在操作障碍（找不到）。
iOS10.3 +

APP内评分机制是iOS 10.3 中新添功能。用户可以直接在 App 内进行评分，开发者可以对用户在 App Store 的评论进行回复。
APP内评分调用API [SKStoreReviewController requestReview]; (目前唯一)，应用会自动弹窗请求用户评分，弹窗不可定制，对处理过程和处理结果无法监控。只能使用该 API 请求评分，不能请求评价和反馈。
一个应用内每年最多使用 3 次弹窗，滥用弹窗，会引起不少用户的反感，甚至因此给应用差评。
iOS10.3版本以前的评分方式依然可以使用。
