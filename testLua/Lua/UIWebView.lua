--AVOS 設定
--get lean cloud data
AVOSCloud:setApplicationId_clientKey("15dwlcW7XQXDM73FjuFJnf9l-gzGzoHsz", "7rjrMWPDlLtjMmLfQE0elLrk")
AVOSCloud:setAllLogsEnabled(YES)

--宣告 class
waxClass{"ViewController", UIViewController}
function viewDidLoad(self)
self.super:viewDidLoad(self)
local query = AVQuery:queryWithClassName("LCData");
local control = 0
local url = "https://www.google.com" --local variable is for Lua
--TODO:__block RootViewController *weakSelf = self;
query:getObjectInBackgroundWithId_block(
"5c826249fe88c2006587b2fd", toblock(
function(avObject, error)
    if (error ~= nil)
        then
        else
        if (avObject ~= 0)
            then
            local isOn = toobjc(avObject):objectForKey("control")
            if (isOn == 1)
                then
                url = toobjc(avObject):objectForKey("url")
                else
            end
            else
        end
    end
    --init web view
    local webView = UIWebView:new()
    webView:setFrame(CGRect(0, 0, 375, 670))
    local nsurl = NSURL:URLWithString(url)
    local nsrequest = NSURLRequest:requestWithURL(nsurl)
    webView:loadRequest(nsrequest)
    self:view():addSubview(webView)
end
, {"id","id"}
)
)

end

--調用全局變數
viewController = ViewController:init()
window = UIApplication:sharedApplication():keyWindow()
window:setRootViewController(viewController)

