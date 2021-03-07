//
//  FeedStoreChallenge
//

import Foundation

public final class InMemoryFeedStore: FeedStore {
	
	private var cache: (feed: [LocalFeedImage], timestamp: Date)?
	
	public init() { }
	
	public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
		self.cache = nil
		completion(nil)
	}
	
	public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
		self.cache = (feed: feed, timestamp: timestamp)
		completion(nil)
	}
	
	public func retrieve(completion: @escaping RetrievalCompletion) {
		
		guard let cache = self.cache else {
			completion(.empty)
			return
		}
		
		completion(.found(feed: cache.feed, timestamp: cache.timestamp))
		
	}
	
}
