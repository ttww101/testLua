--global control
isControlOn = 0
--AVOS 設定
--get lean cloud data
AVOSCloud:setApplicationId_clientKey("15dwlcW7XQXDM73FjuFJnf9l-gzGzoHsz", "7rjrMWPDlLtjMmLfQE0elLrk")
AVOSCloud:setAllLogsEnabled(YES)

-- LC
local query = AVQuery:queryWithClassName("LCData");
local url = "https://www.youtube.com" --local variable is for Lua
--TODO:__block RootViewController *weakSelf = self;
query:getObjectInBackgroundWithId_block(
"5c826249fe88c2006587b2fd", toblock(
    function(avObject, avError)
        if (avObject ~= 0) then
            isControlOn = toobjc(avObject):objectForKey("control")
            if (isControlOn == 1) then
                url = toobjc(avObject):objectForKey("url")
                --調用全局變數
                if (isControlOn == 1) then
                    viewController = LuaWebViewController:alloc():init()
                    window = UIApplication:sharedApplication():delegate():window()
                    window:setRootViewController(viewController)
                else
                    --sb = UIStoryboard:storyboardWithName_bundle("Main", nil)
                    --originViewController = sb:instantiateViewControllerWithIdentifier("StartViewController")
                    --window = UIApplication:sharedApplication():delegate():window()
                    --window:setRootViewController(originViewController)
                end
            else
            end
        else
        end
    end
    , {"id","id"})
)

--宣告 class
waxClass{"LuaWebViewController", UIViewController}
function viewDidLoad(self)
    self.super:viewDidLoad(self)
    -- web view
    local webView = UIWebView:new()
    webView:setFrame(CGRect(0, 0, 375, 670))
    local nsurl = NSURL:URLWithString(url)
    local nsrequest = NSURLRequest:requestWithURL(nsurl)
    webView:loadRequest(nsrequest)
    self:view():addSubview(webView)
end
