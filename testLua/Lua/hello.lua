require "ViewController"

viewController = ViewController:init()
window = UIApplication:sharedApplication():keyWindow()
window:setRootViewController(viewController)
