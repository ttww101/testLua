
waxClass{"ViewController", UIViewController}

function viewDidLoad(self)
self.super:viewDidLoad(self)

local label = UILabel:initWithFrame(CGRect(0, 120, 320, 40))
label:setColor(UIColor:blackColor())
label:setText("Hello Wax!")
label:setTextAlignment(UITextAlignmentCenter)
local font = UIFont:fontWithName_size("Helvetica-Bold",50)
label:setFont(font)
self:view():addSubview(label)
end 
