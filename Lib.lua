local PlaceName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

repeat wait() until game:GetService("Players")

if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") end

wait(1)

do local GUI = game.CoreGui:FindFirstChild("Haunter");if GUI then GUI:Destroy();end;if getgenv().Color == nil then
    getgenv().Color = Color3.fromRGB(147,112,219)
end 
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
        local Tween = TweenService:Create(object, TweenInfo.new(0.15), {Position = pos})
        Tween:Play()
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

local HaunterX = {}

function HaunterX:ToggleUi()
    if game.CoreGui:FindFirstChild("Haunter").Enabled == true then
        game.CoreGui:FindFirstChild("Haunter").Enabled = false
    else
        game.CoreGui:FindFirstChild("Haunter").Enabled = true
    end
end

function HaunterX:Window(text,gamenme,logo,keybind)
    local hubname = text
    local gamename = gamenme
    local uihide = false
    local abc = false
    local logo = logo or 0
    local currentpage = ""
    local keybind = keybind or Enum.KeyCode.RightControl
    local yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")
    if gamename == "" then 
        gamename = ""..PlaceName.Name
    end

    local Haunter = Instance.new("ScreenGui")
    Haunter.Name = "Haunter"
    Haunter.Parent = game.CoreGui
    Haunter.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = Haunter
    Main.ClipsDescendants = true
    Main.AnchorPoint = Vector2.new(0.5,0.5)
    Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)

    Main:TweenSize(UDim2.new(0, 328, 0, 200),"Out","Quad",0.4,true) -- Reduced Main size

    local MCNR = Instance.new("UICorner")
    MCNR.Name = "MCNR"
    MCNR.Parent = Main

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Top.Size = UDim2.new(0, 328, 0, 20) -- Reduced Top Height

    local TCNR = Instance.new("UICorner")
    TCNR.Name = "TCNR"
    TCNR.Parent = Top

    local Logo = Instance.new("ImageLabel")
    Logo.Name = "Logo"
    Logo.Parent = Top
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.Position = UDim2.new(0, 5, 0, 1) -- Adjusted logo position
    Logo.Size = UDim2.new(0, 18, 0, 18) -- Reduced Logo Size
    Logo.Image = ""

    local Name = Instance.new("TextLabel")
    Name.Name = "Name"
    Name.Parent = Top
    Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Name.BackgroundTransparency = 1.000
    Name.Position = UDim2.new(0.05, 0, 0, 0) -- Adjusted Name position
    Name.Size = UDim2.new(0, 40, 0, 20) -- Reduced Name Size
    Name.Font = Enum.Font.GothamSemibold
    Name.Text = hubname
    Name.TextColor3 = Color3.fromRGB(147,112,219)
    Name.TextSize = 12.000 -- Reduced Text Size

    local Hub = Instance.new("TextLabel")
    Hub.Name = "Hub"
    Hub.Parent = Top
    Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Hub.BackgroundTransparency = 1.000
    Hub.Position = UDim2.new(0, 60, 0, 0) -- Adjusted Hub Position
    Hub.Size = UDim2.new(0, 50, 0, 20) -- Reduced Hub Size
    Hub.Font = Enum.Font.GothamSemibold
    Hub.Text = "  | "..gamename
    Hub.TextColor3 = Color3.fromRGB(147,112,219)
    Hub.TextSize = 12.000 -- Reduced Text Size
    Hub.TextXAlignment = Enum.TextXAlignment.Left

    local BindButton = Instance.new("TextButton")
    BindButton.Name = "BindButton"
    BindButton.Parent = Top
    BindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BindButton.BackgroundTransparency = 1.000
    BindButton.Position = UDim2.new(0.8, 0, 0, 0) -- Adjusted BindButton position
    BindButton.Size = UDim2.new(0, 60, 0, 20) -- Reduced BindButton Size
    BindButton.Font = Enum.Font.GothamSemibold
    BindButton.Text = "["..yoo.."]"
    BindButton.TextColor3 = Color3.fromRGB(147,112,219)
    BindButton.TextSize = 10.000 -- Reduced Text Size

    local Tab = Instance.new("Frame")
    Tab.Name = "Tab"
    Tab.Parent = Main
    Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Tab.Position = UDim2.new(0, 3, 0, 23) -- Adjusted Tab position
    Tab.Size = UDim2.new(0, 75, 0, 175) -- Reduced Tab size

    local TCNR = Instance.new("UICorner")
    TCNR.Name = "TCNR"
    TCNR.Parent = Tab

    local ScrollTab = Instance.new("ScrollingFrame")
    ScrollTab.Name = "ScrollTab"
    ScrollTab.Parent = Tab
    ScrollTab.Active = true
    ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollTab.BackgroundTransparency = 1.000
    ScrollTab.Size = UDim2.new(0, 75, 0, 175) -- Reduced ScrollTab Size
    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollTab.ScrollBarThickness = 0

    local PLL = Instance.new("UIListLayout")
    PLL.Name = "PLL"
    PLL.Parent = ScrollTab
    PLL.SortOrder = Enum.SortOrder.LayoutOrder
    PLL.Padding = UDim.new(0, 5) -- Reduced Padding

    local PPD = Instance.new("UIPadding")
    PPD.Name = "PPD"
    PPD.Parent = ScrollTab
    PPD.PaddingLeft = UDim.new(0, 5) -- Reduced Left Padding
    PPD.PaddingTop = UDim.new(0, 5) -- Reduced Top Padding

    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Page.Position = UDim2.new(0.235, 0, 0.0625, 0) -- Adjusted Page position
    Page.Size = UDim2.new(0, 240, 0, 175) -- Reduced Page size

    local PCNR = Instance.new("UICorner")
    PCNR.Name = "PCNR"
    PCNR.Parent = Page

    local MainPage = Instance.new("Frame")
    MainPage.Name = "MainPage"
    MainPage.Parent = Page
    MainPage.ClipsDescendants = true
    MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainPage.BackgroundTransparency = 1.000
    MainPage.Size = UDim2.new(0, 240, 0, 175) -- Reduced MainPage size

    local PageList = Instance.new("Folder")
    PageList.Name = "PageList"
    PageList.Parent = MainPage

    local UIPageLayout = Instance.new("UIPageLayout")

    UIPageLayout.Parent = PageList
    UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
    UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
    UIPageLayout.FillDirection = Enum.FillDirection.Vertical
    UIPageLayout.Padding = UDim.new(0, 5) -- Reduced Padding
    UIPageLayout.TweenTime = 0.400
    UIPageLayout.GamepadInputEnabled = false
    UIPageLayout.ScrollWheelInputEnabled = false
    UIPageLayout.TouchInputEnabled = false

    MakeDraggable(Top,Main)

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode[yoo] then
            if uihide == false then
                uihide = true
                Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
            else
                uihide = false
                Main:TweenSize(UDim2.new(0, 328, 0, 200),"Out","Quad",0.4,true) -- Reduced Size
            end
        end
    end)

    local uitab = {}

    function uitab:Tab(text)
        local TabButton = Instance.new("TextButton")
        TabButton.Parent = ScrollTab
        TabButton.Name = text.."Server"
        TabButton.Text = text
        TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabButton.BorderColor3 = Color3.fromRGB(147,112,219)
        TabButton.BorderSizePixel = 2
        TabButton.Size = UDim2.new(0, 70, 0, 18) -- Reduced Button Size
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
        TabButton.TextSize = 10.000 -- Reduced Text Size
        TabButton.TextTransparency = 0.500

        local MainFramePage = Instance.new("ScrollingFrame")
        MainFramePage.Name = text.."_Page"
        MainFramePage.Parent = PageList
        MainFramePage.Active = true
        MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainFramePage.BackgroundTransparency = 1.000
        MainFramePage.BorderSizePixel = 0
        MainFramePage.Size = UDim2.new(0, 240, 0, 175) -- Reduced MainFramePage size
        MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
        MainFramePage.ScrollBarThickness = 0

        local UIPadding = Instance.new("UIPadding")
        local UIListLayout = Instance.new("UIListLayout")

        UIPadding.Parent = MainFramePage
        UIPadding.PaddingLeft = UDim.new(0, 5) -- Reduced Padding
        UIPadding.PaddingTop = UDim.new(0, 5) -- Reduced Padding

        UIListLayout.Padding = UDim.new(0,5) -- Reduced Padding
        UIListLayout.Parent = MainFramePage
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        
        TabButton.MouseButton1Click:Connect(function()
            for i,v in next, ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
            for i,v in next, PageList:GetChildren() do
                currentpage = string.gsub(TabButton.Name,"Server","").."_Page"
                if v.Name == currentpage then
                    UIPageLayout:JumpTo(v)
                end
            end
        end)

        if abc == false then
            for i,v in next, ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
            UIPageLayout:JumpToIndex(1)
            abc = true
        end
        
        game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                MainFramePage.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
                ScrollTab.CanvasSize = UDim2.new(0,0,0,PLL.AbsoluteContentSize.Y + 20)
            end)
        end)
        
        local main = {}
        function main:Button(text,callback)
            local Button = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local TextBtn = Instance.new("TextButton")
            local UICorner_2 = Instance.new("UICorner")
            local Black = Instance.new("Frame")
            local UICorner_3 = Instance.new("UICorner")
            
            Button.Name = "Button"
            Button.Parent = MainFramePage
            Button.BackgroundColor3 = getgenv().Color
            Button.Size = UDim2.new(0, 230, 0, 22) -- Reduced Size
            
            UICorner.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            UICorner.Parent = Button
            
            TextBtn.Name = "TextBtn"
            TextBtn.Parent = Button
            TextBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            TextBtn.Position = UDim2.new(0, 1, 0, 1)
            TextBtn.Size = UDim2.new(0, 228, 0, 20) -- Reduced Size
            TextBtn.AutoButtonColor = false
            TextBtn.Font = Enum.Font.GothamSemibold
            TextBtn.Text = text
            TextBtn.TextColor3 = Color3.fromRGB(225, 225, 225)
            TextBtn.TextSize = 10.000 -- Reduced Text Size
            
            UICorner_2.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            UICorner_2.Parent = TextBtn
            
            Black.Name = "Black"
            Black.Parent = Button
            Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Black.BackgroundTransparency = 1.000
            Black.BorderSizePixel = 0
            Black.Position = UDim2.new(0, 1, 0, 1)
            Black.Size = UDim2.new(0, 228, 0, 20) -- Reduced Size
            
            UICorner_3.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            UICorner_3.Parent = Black

            TextBtn.MouseEnter:Connect(function()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.7}
                ):Play()
            end)
            TextBtn.MouseLeave:Connect(function()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()
            end)
            TextBtn.MouseButton1Click:Connect(function()
                TextBtn.TextSize = 0
                TweenService:Create(
                    TextBtn,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextSize = 10} -- Reduced Text Size
                ):Play()
                callback()
            end)
        end
        function main:Toggle(text,config,callback)
            config = config or false
            local toggled = config
            local Toggle = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local Button = Instance.new("TextButton")
            local UICorner_2 = Instance.new("UICorner")
            local Label = Instance.new("TextLabel")
            local ToggleImage = Instance.new("Frame")
            local UICorner_3 = Instance.new("UICorner")
            local Circle = Instance.new("Frame")
            local UICorner_4 = Instance.new("UICorner")

            Toggle.Name = "Toggle"
            Toggle.Parent = MainFramePage
            Toggle.BackgroundColor3 = getgenv().Color
            Toggle.Size = UDim2.new(0, 230, 0, 22) -- Reduced Size

            UICorner.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            UICorner.Parent = Toggle

            Button.Name = "Button"
            Button.Parent = Toggle
            Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Button.Position = UDim2.new(0, 1, 0, 1)
            Button.Size = UDim2.new(0, 228, 0, 20) -- Reduced Size
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.SourceSans
            Button.Text = ""
            Button.TextColor3 = Color3.fromRGB(0, 0, 0)
            Button.TextSize = 11.000

            UICorner_2.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            UICorner_2.Parent = Button

            Label.Name = "Label"
            Label.Parent = Toggle
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.Position = UDim2.new(0, 1, 0, 1)
            Label.Size = UDim2.new(0, 228, 0, 20) -- Reduced Size
            Label.Font = Enum.Font.GothamSemibold
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(225, 225, 225)
            Label.TextSize = 10.000 -- Reduced Text Size

            ToggleImage.Name = "ToggleImage"
            ToggleImage.Parent = Toggle
            ToggleImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
            ToggleImage.Position = UDim2.new(0, 195, 0, 3) -- Adjusted position
            ToggleImage.Size = UDim2.new(0, 30, 0, 14) -- Reduced Size

            UICorner_3.CornerRadius = UDim.new(0, 7) -- Reduced Corner Radius
            UICorner_3.Parent = ToggleImage

            Circle.Name = "Circle"
            Circle.Parent = ToggleImage
            Circle.BackgroundColor3 = Color3.fromRGB(227, 60, 60)
            Circle.Position = UDim2.new(0, 1, 0, 1) -- Adjusted Position
            Circle.Size = UDim2.new(0, 10, 0, 10) -- Reduced Size

            UICorner_4.CornerRadius = UDim.new(0, 7) -- Reduced Corner Radius
            UICorner_4.Parent = Circle

            Button.MouseButton1Click:Connect(function()
                if toggled == false then
                    toggled = true
                    Circle:TweenPosition(UDim2.new(0,19,0,1),"Out","Sine",0.2,true) -- Adjusted position
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = getgenv().Color}
                    ):Play()
                else
                    toggled = false
                    Circle:TweenPosition(UDim2.new(0,1,0,1),"Out","Sine",0.2,true) -- Adjusted position
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(227, 60, 110)}
                    ):Play()
                end
                pcall(callback,toggled)
            end)

            if config == true then
                toggled = true
                Circle:TweenPosition(UDim2.new(0,19,0,1),"Out","Sine",0.4,true) -- Adjusted position
                TweenService:Create(
                    Circle,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundColor3 = getgenv().Color}
                ):Play()
                pcall(callback,toggled)
            end
        end
        function main:Dropdown(text,option,callback)
            local isdropping = false
            local Dropdown = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local DropTitle = Instance.new("TextLabel")
            local DropScroll = Instance.new("ScrollingFrame")
            local UIListLayout = Instance.new("UIListLayout")
            local UIPadding = Instance.new("UIPadding")
            local DropButton = Instance.new("TextButton")
            local DropImage = Instance.new("ImageLabel")
            
            Dropdown.Name = "Dropdown"
            Dropdown.Parent = MainFramePage
            Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Dropdown.ClipsDescendants = true
            Dropdown.Size = UDim2.new(0, 230, 0, 22) -- Reduced Size
            
            UICorner.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            UICorner.Parent = Dropdown
            
            DropTitle.Name = "DropTitle"
            DropTitle.Parent = Dropdown
            DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropTitle.BackgroundTransparency = 1.000
            DropTitle.Size = UDim2.new(0, 230, 0, 22) -- Reduced Size
            DropTitle.Font = Enum.Font.GothamSemibold
            DropTitle.Text = text.. " : "
            DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
            DropTitle.TextSize = 10.000 -- Reduced Text Size
            
            DropScroll.Name = "DropScroll"
            DropScroll.Parent = DropTitle
            DropScroll.Active = true
            DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropScroll.BackgroundTransparency = 1.000
            DropScroll.BorderSizePixel = 0
            DropScroll.Position = UDim2.new(0, 0, 0, 22) -- Adjusted Position
            DropScroll.Size = UDim2.new(0, 230, 0, 75) -- Reduced Size
            DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
            DropScroll.ScrollBarThickness = 3
            
            UIListLayout.Parent = DropScroll
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 3) -- Reduced Padding
            
            UIPadding.Parent = DropScroll
            UIPadding.PaddingLeft = UDim.new(0, 3) -- Reduced Padding
            UIPadding.PaddingTop = UDim.new(0, 3) -- Reduced Padding
            
            DropImage.Name = "DropImage"
            DropImage.Parent = Dropdown
            DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropImage.BackgroundTransparency = 1.000
            DropImage.Position = UDim2.new(0, 210, 0, 4) -- Adjusted Position
            DropImage.Rotation = 180.000
            DropImage.Size = UDim2.new(0, 13, 0, 13) -- Reduced Size
            DropImage.Image = "rbxassetid://6031090990"
            
            DropButton.Name = "DropButton"
            DropButton.Parent = Dropdown
            DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropButton.BackgroundTransparency = 1.000
            DropButton.Size = UDim2.new(0, 230, 0, 22) -- Reduced Size
            DropButton.Font = Enum.Font.SourceSans
            DropButton.Text = ""
            DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropButton.TextSize = 14.000

            for i,v in next,option do
                local Item = Instance.new("TextButton")

                Item.Name = "Item"
                Item.Parent = DropScroll
                Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Item.BackgroundTransparency = 1.000
                Item.Size = UDim2.new(0, 225, 0, 20) -- Reduced Size
                Item.Font = Enum.Font.GothamSemibold
                Item.Text = tostring(v)
                Item.TextColor3 = Color3.fromRGB(225, 225, 225)
                Item.TextSize = 9.000 -- Reduced Text Size
                Item.TextTransparency = 0.500

                Item.MouseEnter:Connect(function()
                    TweenService:Create(
                        Item,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                end)

                Item.MouseLeave:Connect(function()
                    TweenService:Create(
                        Item,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end)

                Item.MouseButton1Click:Connect(function()
                    isdropping = false
                    Dropdown:TweenSize(UDim2.new(0,230,0,22),"Out","Quad",0.3,true) -- Reduced Size
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Rotation = 180}
                    ):Play()
                    callback(Item.Text)
                    DropTitle.Text = text.." : "..Item.Text
                end)
            end

            DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

            DropButton.MouseButton1Click:Connect(function()
                if isdropping == false then
                    isdropping = true
                    Dropdown:TweenSize(UDim2.new(0,230,0,100),"Out","Quad",0.3,true) -- Reduced Size
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                else
                    isdropping = false
                    Dropdown:TweenSize(UDim2.new(0,230,0,22),"Out","Quad",0.3,true) -- Reduced Size
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Rotation = 180}
                    ):Play()
                end
            end)

            local dropfunc = {}
            function dropfunc:Add(t)
                local Item = Instance.new("TextButton")
                Item.Name = "Item"
                Item.Parent = DropScroll
                Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Item.BackgroundTransparency = 1.000
                Item.Size = UDim2.new(0, 225, 0, 20) -- Reduced Size
                Item.Font = Enum.Font.GothamSemibold
                Item.Text = tostring(t)
                Item.TextColor3 = Color3.fromRGB(225, 225, 225)
                Item.TextSize = 9.000 -- Reduced Text Size
                Item.TextTransparency = 0.500

                Item.MouseEnter:Connect(function()
                    TweenService:Create(
                        Item,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                end)

                Item.MouseLeave:Connect(function()
                    TweenService:Create(
                        Item,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end)

                Item.MouseButton1Click:Connect(function()
                    isdropping = false
                    Dropdown:TweenSize(UDim2.new(0,230,0,22),"Out","Quad",0.3,true) -- Reduced Size
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Rotation = 180}
                    ):Play()
                    callback(Item.Text)
                    DropTitle.Text = text.." : "..Item.Text
                end)
            end
            function dropfunc:Clear()
                DropTitle.Text = tostring(text).." : "
                isdropping = false
                Dropdown:TweenSize(UDim2.new(0,230,0,22),"Out","Quad",0.3,true) -- Reduced Size
                TweenService:Create(
                    DropImage,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {Rotation = 180}
                ):Play()
                for i,v in next, DropScroll:GetChildren() do
                    if v:IsA("TextButton") then
                        v:Destroy()
                    end
                end
            end
            return dropfunc
        end

        function main:Slider(text,min,max,set,callback)
            local Slider = Instance.new("Frame")
            local slidercorner = Instance.new("UICorner")
            local sliderr = Instance.new("Frame")
            local sliderrcorner = Instance.new("UICorner")
            local SliderLabel = Instance.new("TextLabel")
            local HAHA = Instance.new("Frame")
            local AHEHE = Instance.new("TextButton")
            local bar = Instance.new("Frame")
            local bar1 = Instance.new("Frame")
            local bar1corner = Instance.new("UICorner")
            local barcorner = Instance.new("UICorner")
            local circlebar = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local slidervalue = Instance.new("Frame")
            local valuecorner = Instance.new("UICorner")
            local TextBox = Instance.new("TextBox")
            local UICorner_2 = Instance.new("UICorner")

            Slider.Name = "Slider"
            Slider.Parent = MainFramePage
            Slider.BackgroundColor3 = getgenv().Color
            Slider.BackgroundTransparency = 0
            Slider.Size = UDim2.new(0, 230, 0, 37) -- Reduced Size

            slidercorner.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            slidercorner.Name = "slidercorner"
            slidercorner.Parent = Slider

            sliderr.Name = "sliderr"
            sliderr.Parent = Slider
            sliderr.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            sliderr.Position = UDim2.new(0, 1, 0, 1)
            sliderr.Size = UDim2.new(0, 228, 0, 35) -- Reduced Size

            sliderrcorner.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            sliderrcorner.Name = "sliderrcorner"
            sliderrcorner.Parent = sliderr

            SliderLabel.Name = "SliderLabel"
            SliderLabel.Parent = sliderr
            SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderLabel.BackgroundTransparency = 1.000
            SliderLabel.Position = UDim2.new(0, 8, 0, 0) -- Adjusted Position
            SliderLabel.Size = UDim2.new(0, 100, 0, 18) -- Reduced Size
            SliderLabel.Font = Enum.Font.GothamSemibold
            SliderLabel.Text = text
            SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
            SliderLabel.TextSize = 11.000 -- Reduced Text Size
            SliderLabel.TextTransparency = 0
            SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

            HAHA.Name = "HAHA"
            HAHA.Parent = sliderr
            HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HAHA.BackgroundTransparency = 1.000
            HAHA.Size = UDim2.new(0, 228, 0, 20) -- Reduced Size

            AHEHE.Name = "AHEHE"
            AHEHE.Parent = sliderr
            AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            AHEHE.BackgroundTransparency = 1.000
            AHEHE.Position = UDim2.new(0, 5, 0, 23) -- Adjusted Position
            AHEHE.Size = UDim2.new(0, 218, 0, 3) -- Reduced Size
            AHEHE.Font = Enum.Font.SourceSans
            AHEHE.Text = ""
            AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
            AHEHE.TextSize = 14.000

            bar.Name = "bar"
            bar.Parent = AHEHE
            bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bar.Size = UDim2.new(0, 218, 0, 3) -- Reduced Size

            bar1.Name = "bar1"
            bar1.Parent = bar
            bar1.BackgroundColor3 = getgenv().Color
            bar1.BackgroundTransparency = 0
            bar1.Size = UDim2.new(set/max, 0, 0, 3) -- Reduced Size

            bar1corner.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            bar1corner.Name = "bar1corner"
            bar1corner.Parent = bar1

            barcorner.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            barcorner.Name = "barcorner"
            barcorner.Parent = bar

            circlebar.Name = "circlebar"
            circlebar.Parent = bar1
            circlebar.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
            circlebar.Position = UDim2.new(1, -2, 0, -2) -- Adjusted Position
            circlebar.Size = UDim2.new(0, 8, 0, 8) -- Reduced Size

            UICorner.CornerRadius = UDim.new(0, 100)
            UICorner.Parent = circlebar

            slidervalue.Name = "slidervalue"
            slidervalue.Parent = sliderr
            slidervalue.BackgroundColor3 = getgenv().Color
            slidervalue.BackgroundTransparency = 0
            slidervalue.Position = UDim2.new(0, 190, 0, 0) -- Adjusted Position
            slidervalue.Size = UDim2.new(0, 30, 0, 14) -- Reduced Size

            valuecorner.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            valuecorner.Name = "valuecorner"
            valuecorner.Parent = slidervalue

            TextBox.Parent = slidervalue
            TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            TextBox.Position = UDim2.new(0, 1, 0, 1)
            TextBox.Size = UDim2.new(0, 28, 0, 12) -- Reduced Size
            TextBox.Font = Enum.Font.GothamSemibold
            TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
            TextBox.TextSize = 8.000 -- Reduced Text Size
            TextBox.Text = set
            TextBox.TextTransparency = 0

            UICorner_2.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            UICorner_2.Parent = TextBox

            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")

            if Value == nil then
                Value = set
                pcall(function()
                    callback(Value)
                end)
            end
            
            AHEHE.MouseButton1Down:Connect(function()
                Value = math.floor((((tonumber(max) - tonumber(min)) / 218) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
                pcall(function()
                    callback(Value)
                end)
                bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 218), 0, 3) -- Adjusted Size
                circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 208), 0, -2) -- Adjusted Position
                moveconnection = mouse.Move:Connect(function()
                    TextBox.Text = Value
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 218) * bar1.AbsoluteSize.X) + tonumber(min))
                    pcall(function()
                        callback(Value)
                    end)
                    bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 218), 0, 3) -- Adjusted Size
                    circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 208), 0, -2) -- Adjusted Position
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 218) * bar1.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 218), 0, 3) -- Adjusted Size
                        circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 208), 0, -2) -- Adjusted Position
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch  then
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 218) * bar1.AbsoluteSize.X) + tonumber(min))
                    TextBox.Text = Value
                end
            end)

            TextBox.FocusLost:Connect(function()
                if tonumber(TextBox.Text) > max then
                    TextBox.Text  = max
                end
                bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 3) -- Adjusted Size
                circlebar.Position = UDim2.new(1, -2, 0, -2) -- Adjusted Position
                TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / max) * (max - min) + min) )
                pcall(callback, TextBox.Text)
            end)
        end

        function main:Textbox(text,disappear,callback)
            local Textbox = Instance.new("Frame")
            local TextboxCorner = Instance.new("UICorner")
            local Textboxx = Instance.new("Frame")
            local TextboxxCorner = Instance.new("UICorner")
            local TextboxLabel = Instance.new("TextLabel")
            local txtbtn = Instance.new("TextButton")
            local RealTextbox = Instance.new("TextBox")
            local UICorner = Instance.new("UICorner")

            Textbox.Name = "Textbox"
            Textbox.Parent = MainFramePage
            Textbox.BackgroundColor3 = getgenv().Color
            Textbox.BackgroundTransparency = 0
            Textbox.Size = UDim2.new(0, 230, 0, 22) -- Reduced Size

            TextboxCorner.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            TextboxCorner.Name = "TextboxCorner"
            TextboxCorner.Parent = Textbox

            Textboxx.Name = "Textboxx"
            Textboxx.Parent = Textbox
            Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Textboxx.Position = UDim2.new(0, 1, 0, 1)
            Textboxx.Size = UDim2.new(0, 228, 0, 20) -- Reduced Size

            TextboxxCorner.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            TextboxxCorner.Name = "TextboxxCorner"
            TextboxxCorner.Parent = Textboxx

            TextboxLabel.Name = "TextboxLabel"
            TextboxLabel.Parent = Textbox
            TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxLabel.BackgroundTransparency = 1.000
            TextboxLabel.Position = UDim2.new(0, 8, 0, 0) -- Adjusted Position
            TextboxLabel.Text = text
            TextboxLabel.Size = UDim2.new(0, 100, 0, 22) -- Reduced Size
            TextboxLabel.Font = Enum.Font.GothamSemibold
            TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
            TextboxLabel.TextSize = 11.000 -- Reduced Text Size
            TextboxLabel.TextTransparency = 0
            TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

            txtbtn.Name = "txtbtn"
            txtbtn.Parent = Textbox
            txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            txtbtn.BackgroundTransparency = 1.000
            txtbtn.Position = UDim2.new(0, 1, 0, 1)
            txtbtn.Size = UDim2.new(0, 228, 0, 20) -- Reduced Size
            txtbtn.Font = Enum.Font.SourceSans
            txtbtn.Text = ""
            txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            txtbtn.TextSize = 14.000

            RealTextbox.Name = "RealTextbox"
            RealTextbox.Parent = Textbox
            RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            RealTextbox.BackgroundTransparency = 0
            RealTextbox.Position = UDim2.new(0, 175, 0, 3) -- Adjusted Position
            RealTextbox.Size = UDim2.new(0, 50, 0, 16) -- Reduced Size
            RealTextbox.Font = Enum.Font.GothamSemibold
            RealTextbox.Text = ""
            RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
            RealTextbox.TextSize = 9.000 -- Reduced Text Size
            RealTextbox.TextTransparency = 0

            RealTextbox.FocusLost:Connect(function()
                callback(RealTextbox.Text)
                if disappear then
                    RealTextbox.Text = ""
                end
            end)

            UICorner.CornerRadius = UDim.new(0, 3) -- Reduced Corner Radius
            UICorner.Parent = RealTextbox
        end
        function main:Label(text)
            local Label = Instance.new("TextLabel")
            local PaddingLabel = Instance.new("UIPadding")
            local labelfunc = {}
    
            Label.Name = "Label"
            Label.Parent = MainFramePage
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.Size = UDim2.new(0, 230, 0, 15) -- Reduced Size
            Label.Font = Enum.Font.GothamSemibold
            Label.TextColor3 = Color3.fromRGB(225, 225, 225)
            Label.TextSize = 10.000 -- Reduced Text Size
            Label.Text = text
            Label.TextXAlignment = Enum.TextXAlignment.Left

            PaddingLabel.PaddingLeft = UDim.new(0,5) -- Reduced Padding
            PaddingLabel.Parent = Label
            PaddingLabel.Name = "PaddingLabel"
    
            function labelfunc:Set(newtext)
                Label.Text = newtext
            end
            return labelfunc
        end

        function main:Seperator(text)
            local Seperator = Instance.new("Frame")
            local Sep1 = Instance.new("Frame")
            local Sep2 = Instance.new("TextLabel")
            local Sep3 = Instance.new("Frame")
            
            Seperator.Name = "Seperator"
            Seperator.Parent = MainFramePage
            Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Seperator.BackgroundTransparency = 1.000
            Seperator.Size = UDim2.new(0, 230, 0, 15) -- Reduced Size
            
            Sep1.Name = "Sep1"
            Sep1.Parent = Seperator
            Sep1.BackgroundColor3 = getgenv().Color
            Sep1.BorderSizePixel = 0
            Sep1.Position = UDim2.new(0, 0, 0, 8) -- Adjusted Position
            Sep1.Size = UDim2.new(0, 40, 0, 1) -- Reduced Size
            
            Sep2.Name = "Sep2"
            Sep2.Parent = Seperator
            Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sep2.BackgroundTransparency = 1.000
            Sep2.Position = UDim2.new(0, 90, 0, 0) -- Adjusted Position
            Sep2.Size = UDim2.new(0, 50, 0, 15) -- Reduced Size
            Sep2.Font = Enum.Font.GothamSemibold
            Sep2.Text = text
            Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
            Sep2.TextSize = 10.000 -- Reduced Text Size
            
            Sep3.Name = "Sep3"
            Sep3.Parent = Seperator
            Sep3.BackgroundColor3 = getgenv().Color
            Sep3.BorderSizePixel = 0
            Sep3.Position = UDim2.new(0, 180, 0, 8) -- Adjusted Position
            Sep3.Size = UDim2.new(0, 40, 0, 1) -- Reduced Size
        end

        function main:Line()
            local Linee = Instance.new("Frame")
            local Line = Instance.new("Frame")
            
            Linee.Name = "Linee"
            Linee.Parent = MainFramePage
            Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Linee.BackgroundTransparency = 1.000
            Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
            Linee.Size = UDim2.new(0, 230, 0, 15) -- Reduced Size
            
            Line.Name = "Line"
            Line.Parent = Linee
            Line.BackgroundColor3 = getgenv().Color
            Line.BorderSizePixel = 0
            Line.Position = UDim2.new(0, 0, 0, 8) -- Adjusted Position
            Line.Size = UDim2.new(0, 230, 0, 1) -- Reduced Size
        end
        return main
    end
    return uitab
end
return HaunterX
