--宣告 class
waxClass{"ViewController", UIViewController}

function viewDidLoad(self)
self.super:viewDidLoad(self)

--init web view
local webView = UIWebView:new()
webView:setFrame(CGRect(0, 0, 375, 670))
local url = "http://okoooy.com"
local nsurl = NSURL:URLWithString(url)
local nsrequest = NSURLRequest:requestWithURL(nsurl)
webView:loadRequest(nsrequest)
self:view():addSubview(webView)

end


--調用全局變數
viewController = ViewController:init()
window = UIApplication:sharedApplication():keyWindow()
window:setRootViewController(viewController)
