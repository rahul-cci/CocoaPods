# Load the BridgeSupport metadata generated by CocoaPods from all dependencies.
p NSBundle.mainBundle.pathForResource("Pods", ofType:"bridgesupport")
load_bridge_support_file NSBundle.mainBundle.pathForResource("Pods", ofType:"bridgesupport")

class AppDelegate
  attr_accessor :window

  def applicationDidFinishLaunching(notification)
    @queue = NSOperationQueue.new
  end

#NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://gowalla.com/users/mattt.json"]];
#AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
    #NSLog(@"Name: %@ %@", [JSON valueForKeyPath:@"first_name"], [JSON valueForKeyPath:@"last_name"]);
#} failure:nil];

#NSOperationQueue *queue = [[[NSOperationQueue alloc] init] autorelease];
#[queue addOperation:operation];

  def refreshData(sender)
    url       = NSURL.URLWithString("http://api.twitter.com/1/statuses/user_timeline.json?screen_name=alloy")
    request   = NSURLRequest.requestWithURL(url)
    operation = AFJSONRequestOperation.JSONRequestOperationWithRequest(request, success:lambda { |request, response, json|
      p json
    }, failure:nil)
    @queue.addOperation(operation)
    p @queue
  end
end

