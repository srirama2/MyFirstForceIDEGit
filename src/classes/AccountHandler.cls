public class AccountHandler {
    public static void postToChatterAfterCreation(Account acc) {
        
ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(null, 
                                                                             acc.Id,
                                                                             ConnectApi.FeedElementType.FeedItem,
                                                                             'Account has been created');
    }
}