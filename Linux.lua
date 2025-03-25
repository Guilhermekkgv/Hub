for _,v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "dark_UI" then
        v:Destroy()
    end
end

local dark_UI = Instance.new("ScreenGui")
dark_UI.Name = "dark_UI"
dark_UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
dark_UI.Parent = game.CoreGui

local Library = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function Library:Create(table)
    local windowName = table.Name
    local uiSize = table.Size or UDim2.fromOffset(500, 340)
    local themeName = table.Theme or "Blue"
    local transparency = table.Transparency or false

    local themes = {
        Blue = {
            MainBackground = Color3.fromRGB(40, 40, 40),
            TabContainerBackground = Color3.fromRGB(40, 40, 40),
            ContainerBackground = Color3.fromRGB(40, 40, 40),
            TitleLine = Color3.fromRGB(60, 60, 60),
            TitleText = Color3.fromRGB(255, 255, 255),
            TabNameText = Color3.fromRGB(255, 255, 255),
            TabButtonBackground = Color3.fromRGB(50, 50, 50),
            TabButtonHover = Color3.fromRGB(60, 60, 60),
            TabButtonActive = Color3.fromRGB(0, 120, 255),
            TabIcon = Color3.fromRGB(255, 255, 255),
            TabIconHover = Color3.fromRGB(255, 255, 255),
            TabIconActive = Color3.fromRGB(255, 255, 255),
            TabText = Color3.fromRGB(255, 255, 255),
            TabTextHover = Color3.fromRGB(255, 255, 255),
            TabTextActive = Color3.fromRGB(255, 255, 255),
            ElementBackground = Color3.fromRGB(50, 50, 50),
            ElementHover = Color3.fromRGB(60, 60, 60),
            ElementActive = Color3.fromRGB(70, 70, 70),
            ElementText = Color3.fromRGB(255, 255, 255),
            ElementTextHover = Color3.fromRGB(255, 255, 255),
            SliderTrack = Color3.fromRGB(50, 50, 50),
            SliderFill = Color3.fromRGB(0, 120, 255),
            ToggleOff = Color3.fromRGB(50, 50, 50),
            ToggleOn = Color3.fromRGB(255, 255, 255),
            ToggleKnobOff = Color3.fromRGB(255, 255, 255),
            ToggleKnobOn = Color3.fromRGB(0, 120, 255),
            DropdownListBackground = Color3.fromRGB(50, 50, 50),
            DropdownOptionBackground = Color3.fromRGB(60, 60, 60),
            DropdownOptionHover = Color3.fromRGB(70, 70, 70),
            TextboxInputBackground = Color3.fromRGB(50, 50, 50),
            CloseButtonIcon = Color3.fromRGB(255, 255, 255)
        }
    }

    local theme = themes[themeName] or themes.Blue

    local main = Instance.new("Frame")
    main.Name = "main"
    main.BackgroundColor3 = theme.MainBackground
    main.BackgroundTransparency = 0
    main.Position = UDim2.fromScale(0.5, 0.5)
    main.Size = uiSize
    main.Active = true
    main.Draggable = true
    main.AnchorPoint = Vector2.new(0.5, 0.5)

    local uICorner = Instance.new("UICorner")
    uICorner.CornerRadius = UDim.new(0, 8)
    uICorner.Parent = main

    local titleBar = Instance.new("Frame")
    titleBar.Name = "titleBar"
    titleBar.BackgroundTransparency = 1
    titleBar.Size = UDim2.fromScale(1, 0.1)
    titleBar.Position = UDim2.fromScale(0, 0)
    titleBar.Parent = main

    local title = Instance.new("TextLabel")
    title.Name = "title"
    title.Font = Enum.Font.GothamBold
    title.Text = windowName
    title.TextColor3 = theme.TitleText
    title.TextSize = 16
    title.BackgroundTransparency = 1
    title.Position = UDim2.fromScale(0.015, 0.25)
    title.Size = UDim2.fromOffset(200, 20)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = titleBar

    local closeButton = Instance.new("ImageButton")
    closeButton.Name = "closeButton"
    closeButton.BackgroundTransparency = 1
    closeButton.Size = UDim2.fromOffset(20, 20)
    closeButton.Position = UDim2.fromScale(0.95, 0.25)
    closeButton.Image = "rbxassetid://10747384394"
    closeButton.ImageColor3 = theme.CloseButtonIcon
    closeButton.Parent = titleBar

    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "contentFrame"
    contentFrame.BackgroundTransparency = 1
    contentFrame.Position = UDim2.fromScale(0, 0.1)
    contentFrame.Size = UDim2.fromScale(1, 0.9)
    contentFrame.Parent = main

    local titleLine = Instance.new("Frame")
    titleLine.Name = "titleLine"
    titleLine.BackgroundColor3 = theme.TitleLine
    titleLine.BackgroundTransparency = 0
    titleLine.Position = UDim2.fromScale(0.015, 0)
    titleLine.Size = UDim2.new(0.97, 0, 0, 1)
    titleLine.BorderSizePixel = 0
    titleLine.Parent = contentFrame

    local tabContainer = Instance.new("ScrollingFrame")
    tabContainer.Name = "tabContainer"
    tabContainer.BackgroundColor3 = theme.TabContainerBackground
    tabContainer.BackgroundTransparency = transparency and 0.2 or 0
    tabContainer.Position = UDim2.fromScale(0.03, 0.05)
    tabContainer.Size = UDim2.new(0.22, 0, 0.9, 0)
    tabContainer.ScrollBarThickness = 0
    tabContainer.ScrollingDirection = Enum.ScrollingDirection.Y
    tabContainer.Active = true
    tabContainer.CanvasSize = UDim2.fromOffset(0, 0)
    tabContainer.Parent = contentFrame

    local uICorner1 = Instance.new("UICorner")
    uICorner1.CornerRadius = UDim.new(0, 6)
    uICorner1.Parent = tabContainer

    local uIListLayout = Instance.new("UIListLayout")
    uIListLayout.Padding = UDim.new(0, 5)
    uIListLayout.FillDirection = Enum.FillDirection.Vertical
    uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uIListLayout.Parent = tabContainer

    local uIPadding = Instance.new("UIPadding")
    uIPadding.PaddingTop = UDim.new(0, 5)
    uIPadding.PaddingLeft = UDim.new(0, 5)
    uIPadding.Parent = tabContainer

    main.Parent = dark_UI

    local function updateTabCanvasSize()
        local contentHeight = uIListLayout.AbsoluteContentSize.Y
        tabContainer.CanvasSize = UDim2.fromOffset(0, contentHeight)
    end

    tabContainer.ChildAdded:Connect(updateTabCanvasSize)
    tabContainer:GetPropertyChangedSignal("CanvasPosition"):Connect(updateTabCanvasSize)

    local tabHandler = {}

    function tabHandler:Exit()
        dark_UI:Destroy()
    end

    closeButton.MouseButton1Click:Connect(function()
        tabHandler:Exit()
    end)

    UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
        if gameProcessedEvent then return end
        local platform = UserInputService:GetPlatform()
        local isPC = platform == Enum.Platform.Windows or platform == Enum.Platform.OSX or platform == Enum.Platform.Linux
        if isPC and input.KeyCode == Enum.KeyCode.K then
            tabHandler:Exit()
        end
    end)

    function tabHandler:Tab(name, iconId)
        local main1 = Instance.new("TextButton")
        main1.Name = name
        main1.Font = Enum.Font.Gotham
        main1.Text = name
        main1.TextColor3 = theme.TabText
        main1.TextSize = 14
        main1.TextTransparency = 0
        main1.BackgroundColor3 = theme.TabButtonBackground
        main1.BackgroundTransparency = transparency and 0.2 or 0
        main1.Size = UDim2.fromOffset(100, 30)
        main1.AutoButtonColor = false
        main1.TextXAlignment = Enum.TextXAlignment.Left
        main1.Parent = tabContainer

        local icon = Instance.new("ImageLabel")
        icon.Name = "icon"
        icon.Image = iconId or "rbxassetid://10709752996"
        icon.BackgroundTransparency = 1
        icon.Position = UDim2.fromScale(0.05, 0.25)
        icon.Size = UDim2.fromOffset(18, 18)
        icon.ImageColor3 = theme.TabIcon
        icon.Parent = main1

        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "textLabel"
        textLabel.Text = name
        textLabel.Font = Enum.Font.Gotham
        textLabel.TextColor3 = theme.TabText
        textLabel.TextSize = 14
        textLabel.BackgroundTransparency = 1
        textLabel.Position = UDim2.fromScale(0.3, 0)
        textLabel.Size = UDim2.fromOffset(65, 30)
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Parent = main1

        main1.Text = ""

        local uICornerTab = Instance.new("UICorner")
        uICornerTab.CornerRadius = UDim.new(0, 4)
        uICornerTab.Parent = main1

        local container = Instance.new("Frame")
        container.Name = "container"
        container.BackgroundColor3 = theme.ContainerBackground
        container.BackgroundTransparency = 0.4
        container.Position = UDim2.fromScale(0.26, 0.05)
        container.Size = UDim2.new(0.72, 0, 0.9, 0)
        container.Visible = false
        container.Parent = contentFrame

        local uICorner2 = Instance.new("UICorner")
        uICorner2.CornerRadius = UDim.new(0, 6)
        uICorner2.Parent = container

        local tabNameLabel = Instance.new("TextLabel")
        tabNameLabel.Name = "tabNameLabel"
        tabNameLabel.Font = Enum.Font.GothamBold
        tabNameLabel.Text = name
        tabNameLabel.TextColor3 = theme.TabNameText
        tabNameLabel.TextSize = 16
        tabNameLabel.BackgroundTransparency = 1
        tabNameLabel.Position = UDim2.fromScale(0.03, 0.01)
        tabNameLabel.Size = UDim2.fromOffset(340, 20)
        tabNameLabel.TextXAlignment = Enum.TextXAlignment.Left
        tabNameLabel.Parent = container

        local holder = Instance.new("ScrollingFrame")
        holder.ScrollBarThickness = 0
        holder.ScrollingDirection = Enum.ScrollingDirection.Y
        holder.Active = true
        holder.BackgroundTransparency = 1
        holder.Position = UDim2.fromScale(0.03, 0.1)
        holder.Size = UDim2.new(0.94, 0, 0.85, 0)
        holder.CanvasSize = UDim2.fromOffset(0, 0)
        holder.Parent = container

        local uIPadding1 = Instance.new("UIPadding")
        uIPadding1.PaddingLeft = UDim.new(0, 5)
        uIPadding1.PaddingTop = UDim.new(0, 5)
        uIPadding1.Parent = holder

        local uIListLayout1 = Instance.new("UIListLayout")
        uIListLayout1.Padding = UDim.new(0, 5)
        uIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
        uIListLayout1.Parent = holder

        local function updateCanvasSize()
            local contentHeight = uIListLayout1.AbsoluteContentSize.Y
            holder.CanvasSize = UDim2.fromOffset(0, contentHeight)
        end

        holder.ChildAdded:Connect(updateCanvasSize)
        holder:GetPropertyChangedSignal("CanvasPosition"):Connect(updateCanvasSize)

        main1.MouseEnter:Connect(function()
            if not container.Visible then
                main1.BackgroundColor3 = theme.TabButtonHover
                main1.BackgroundTransparency = transparency and 0.2 or 0
                icon.ImageColor3 = theme.TabIconHover
                textLabel.TextColor3 = theme.TabTextHover
            end
        end)

        main1.MouseLeave:Connect(function()
            if not container.Visible then
                main1.BackgroundColor3 = theme.TabButtonBackground
                main1.BackgroundTransparency = transparency and 0.2 or 0
                icon.ImageColor3 = theme.TabIcon
                textLabel.TextColor3 = theme.TabText
            end
        end)

        main1.MouseButton1Click:Connect(function()
            for _,v in pairs(contentFrame:GetChildren()) do
                if v.Name == "container" then
                    v.Visible = false
                end
            end
            for _,v in pairs(tabContainer:GetChildren()) do
                if v:IsA("TextButton") then
                    v.BackgroundColor3 = theme.TabButtonBackground
                    v.BackgroundTransparency = transparency and 0.2 or 0
                    v:FindFirstChild("icon").ImageColor3 = theme.TabIcon
                    v:FindFirstChild("textLabel").TextTransparency = 0
                    v:FindFirstChild("textLabel").TextColor3 = theme.TabText
                end
            end
            container.Visible = true
            main1.BackgroundColor3 = theme.TabButtonActive
            main1.BackgroundTransparency = transparency and 0.2 or 0
            icon.ImageColor3 = theme.TabIconActive
            textLabel.TextTransparency = 0
            textLabel.TextColor3 = theme.TabTextActive
        end)

        local ElementHandler = {}

        function ElementHandler:Section(text)
            local sectionLabel = Instance.new("TextLabel")
            sectionLabel.Font = Enum.Font.GothamBold
            sectionLabel.Text = text
            sectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            sectionLabel.TextSize = 16
            sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            sectionLabel.BackgroundTransparency = 1
            sectionLabel.Size = UDim2.fromOffset(340, 30)
            sectionLabel.Parent = holder
        end

        function ElementHandler:Label(text)
            local label = Instance.new("Frame")
            label.BackgroundColor3 = theme.ElementBackground
            label.BackgroundTransparency = 0.1
            label.Size = UDim2.fromOffset(340, 30)
            label.Parent = holder

            local uICorner3 = Instance.new("UICorner")
            uICorner3.CornerRadius = UDim.new(0, 4)
            uICorner3.Parent = label

            local textLabel = Instance.new("TextLabel")
            textLabel.Font = Enum.Font.Gotham
            textLabel.Text = text
            textLabel.TextColor3 = theme.ElementText
            textLabel.TextSize = 14
            textLabel.TextXAlignment = Enum.TextXAlignment.Left
            textLabel.BackgroundTransparency = 1
            textLabel.Position = UDim2.fromScale(0.02, 0)
            textLabel.Size = UDim2.fromOffset(330, 30)
            textLabel.Parent = label
        end

        function ElementHandler:Button(text, callback, iconId)
            text = text or "Button"
            callback = callback or function() end

            local button = Instance.new("TextButton")
            button.BackgroundColor3 = theme.ElementBackground
            button.BackgroundTransparency = 0.1
            button.Size = UDim2.fromOffset(340, 30)
            button.Text = ""
            button.AutoButtonColor = false
            button.Parent = holder

            local uICorner12 = Instance.new("UICorner")
            uICorner12.CornerRadius = UDim.new(0, 4)
            uICorner12.Parent = button

            local textLabel5 = Instance.new("TextLabel")
            textLabel5.Font = Enum.Font.Gotham
            textLabel5.Text = text
            textLabel5.TextColor3 = theme.ElementText
            textLabel5.TextSize = 14
            textLabel5.TextXAlignment = Enum.TextXAlignment.Left
            textLabel5.BackgroundTransparency = 1
            textLabel5.Position = UDim2.fromScale(0.02, 0)
            textLabel5.Size = UDim2.fromOffset(300, 30)
            textLabel5.Parent = button

            local icon = Instance.new("ImageLabel")
            icon.Name = "icon"
            icon.Image = iconId or "rbxassetid://117608025522073"
            icon.BackgroundTransparency = 1
            icon.Position = UDim2.fromScale(0.92, 0.25)
            icon.Size = UDim2.fromOffset(18, 18)
            icon.ImageColor3 = theme.TabIcon
            icon.Parent = button

            button.MouseEnter:Connect(function()
                button.BackgroundColor3 = theme.ElementHover
                button.BackgroundTransparency = 0.1
                icon.ImageColor3 = theme.TabIconHover
            end)

            button.MouseLeave:Connect(function()
                button.BackgroundColor3 = theme.ElementBackground
                button.BackgroundTransparency = 0.1
                icon.ImageColor3 = theme.TabIcon
            end)

            button.MouseButton1Click:Connect(callback)
        end

        function ElementHandler:Slider(text, default, min, max, callback)
            text = text or "Slider"
            default = default or 0
            min = min or 0
            max = max or 100
            callback = callback or function() end

            local slider = Instance.new("Frame")
            slider.BackgroundColor3 = theme.ElementBackground
            slider.BackgroundTransparency = 0.1
            slider.Size = UDim2.fromOffset(340, 30)
            slider.Parent = holder

            local uICorner4 = Instance.new("UICorner")
            uICorner4.CornerRadius = UDim.new(0, 4)
            uICorner4.Parent = slider

            local textLabel1 = Instance.new("TextLabel")
            textLabel1.Font = Enum.Font.Gotham
            textLabel1.Text = text
            textLabel1.TextColor3 = theme.ElementText
            textLabel1.TextSize = 14
            textLabel1.TextXAlignment = Enum.TextXAlignment.Left
            textLabel1.BackgroundTransparency = 1
            textLabel1.Position = UDim2.fromScale(0.02, 0)
            textLabel1.Size = UDim2.fromOffset(230, 30)
            textLabel1.Parent = slider

            local frame = Instance.new("Frame")
            frame.BackgroundColor3 = theme.SliderTrack
            frame.BackgroundTransparency = 0
            frame.Position = UDim2.fromScale(0.7, 0.35)
            frame.Size = UDim2.fromOffset(90, 6)
            frame.Parent = slider

            local uICorner5 = Instance.new("UICorner")
            uICorner5.CornerRadius = UDim.new(0, 3)
            uICorner5.Parent = frame

            local frame1 = Instance.new("Frame")
            frame1.BackgroundColor3 = theme.SliderFill
            frame1.BackgroundTransparency = 0
            frame1.Position = UDim2.fromScale(0, 0)
            frame1.Size = UDim2.fromOffset(((default - min) / (max - min)) * 90, 6)
            frame1.Parent = frame

            local uICorner6 = Instance.new("UICorner")
            uICorner6.CornerRadius = UDim.new(0, 3)
            uICorner6.Parent = frame1

            local knob = Instance.new("TextButton")
            knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            knob.Size = UDim2.fromOffset(12, 12)
            knob.Position = UDim2.fromScale(((default - min) / (max - min)), 0.5)
            knob.AnchorPoint = Vector2.new(0.5, 0.5)
            knob.Text = ""
            knob.AutoButtonColor = false
            knob.Parent = frame

            local uICornerKnob = Instance.new("UICorner")
            uICornerKnob.CornerRadius = UDim.new(0, 12)
            uICornerKnob.Parent = knob

            local textLabel2 = Instance.new("TextLabel")
            textLabel2.Font = Enum.Font.Gotham
            textLabel2.Text = tostring(default)
            textLabel2.TextColor3 = theme.ElementText
            textLabel2.TextSize = 8
            textLabel2.BackgroundTransparency = 1
            textLabel2.Position = UDim2.fromScale(((default - min) / (max - min)), -1.2)
            textLabel2.Size = UDim2.fromOffset(20, 10)
            textLabel2.TextXAlignment = Enum.TextXAlignment.Center
            textLabel2.Parent = frame

            local dragging = false

            knob.MouseButton1Down:Connect(function()
                dragging = true
                slider.BackgroundColor3 = theme.ElementActive
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                    slider.BackgroundColor3 = theme.ElementBackground
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local pos = input.Position.X
                    local percentage = math.clamp((pos - frame.AbsolutePosition.X) / frame.AbsoluteSize.X, 0, 1)
                    local value = math.floor(min + (max - min) * percentage)
                    textLabel2.Text = tostring(value)
                    frame1.Size = UDim2.fromOffset(percentage * 90, 6)
                    knob.Position = UDim2.fromScale(percentage, 0.5)
                    textLabel2.Position = UDim2.fromScale(percentage, -1.2)
                    callback(value)
                end
            end)

            slider.MouseEnter:Connect(function()
                if not dragging then
                    slider.BackgroundColor3 = theme.ElementHover
                end
            end)

            slider.MouseLeave:Connect(function()
                if not dragging then
                    slider.BackgroundColor3 = theme.ElementBackground
                end
            end)
        end

        function ElementHandler:Toggle(text, default, callback)
            text = text or "Toggle"
            default = default or false
            callback = callback or function() end

            local toggle1 = Instance.new("TextButton")
            toggle1.BackgroundColor3 = theme.ElementBackground
            toggle1.BackgroundTransparency = 0.1
            toggle1.Size = UDim2.fromOffset(340, 30)
            toggle1.Text = ""
            toggle1.AutoButtonColor = false
            toggle1.Parent = holder

            local uICorner9 = Instance.new("UICorner")
            uICorner9.CornerRadius = UDim.new(0, 4)
            uICorner9.Parent = toggle1

            local textLabel4 = Instance.new("TextLabel")
            textLabel4.Font = Enum.Font.Gotham
            textLabel4.Text = text
            textLabel4.TextColor3 = theme.ElementText
            textLabel4.TextSize = 14
            textLabel4.TextXAlignment = Enum.TextXAlignment.Left
            textLabel4.BackgroundTransparency = 1
            textLabel4.Position = UDim2.fromScale(0.02, 0)
            textLabel4.Size = UDim2.fromOffset(300, 30)
            textLabel4.Parent = toggle1

            local toggleFrame = Instance.new("Frame")
            toggleFrame.BackgroundColor3 = default and theme.ToggleOn or theme.ToggleOff
            toggleFrame.BackgroundTransparency = 0
            toggleFrame.Position = UDim2.fromScale(0.87, 0.25)
            toggleFrame.Size = UDim2.fromOffset(36, 18)
            toggleFrame.Parent = toggle1

            local uICorner10 = Instance.new("UICorner")
            uICorner10.CornerRadius = UDim.new(1, 0)
            uICorner10.Parent = toggleFrame

            local toggleKnob = Instance.new("Frame")
            toggleKnob.BackgroundColor3 = default and theme.ToggleKnobOn or theme.ToggleKnobOff
            toggleKnob.Size = UDim2.fromOffset(16, 16)
            toggleKnob.Position = default and UDim2.fromOffset(19, 1) or UDim2.fromOffset(1, 1)
            toggleKnob.Parent = toggleFrame

            local uICorner11 = Instance.new("UICorner")
            uICorner11.CornerRadius = UDim.new(1, 0)
            uICorner11.Parent = toggleKnob

            local tog = default

            toggle1.MouseEnter:Connect(function()
                toggle1.BackgroundColor3 = theme.ElementHover
            end)

            toggle1.MouseLeave:Connect(function()
                toggle1.BackgroundColor3 = theme.ElementBackground
            end)

            toggle1.MouseButton1Click:Connect(function()
                tog = not tog
                callback(tog)
                if tog then
                    TweenService:Create(toggleKnob, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(19, 1)}):Play()
                    toggleFrame.BackgroundColor3 = theme.ToggleOn
                    toggleKnob.BackgroundColor3 = theme.ToggleKnobOn
                else
                    TweenService:Create(toggleKnob, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(1, 1)}):Play()
                    toggleFrame.BackgroundColor3 = theme.ToggleOff
                    toggleKnob.BackgroundColor3 = theme.ToggleKnobOff
                end
            end)
        end

        function ElementHandler:Textbox(text, callback)
            text = text or "Textbox"
            callback = callback or function() end

            local textbox = Instance.new("Frame")
            textbox.BackgroundColor3 = theme.ElementBackground
            textbox.BackgroundTransparency = 0.1
            textbox.Size = UDim2.fromOffset(340, 30)
            textbox.Parent = holder

            local uICorner13 = Instance.new("UICorner")
            uICorner13.CornerRadius = UDim.new(0, 4)
            uICorner13.Parent = textbox

            local textLabel6 = Instance.new("TextLabel")
            textLabel6.Font = Enum.Font.Gotham
            textLabel6.Text = text
            textLabel6.TextColor3 = theme.ElementText
            textLabel6.TextSize = 14
            textLabel6.TextXAlignment = Enum.TextXAlignment.Left
            textLabel6.BackgroundTransparency = 1
            textLabel6.Position = UDim2.fromScale(0.02, 0)
            textLabel6.Size = UDim2.fromOffset(260, 30)
            textLabel6.Parent = textbox

            local textBox = Instance.new("TextBox")
            textBox.Font = Enum.Font.SourceSans
            textBox.Text = ""
            textBox.TextColor3 = theme.ElementText
            textBox.TextSize = 14
            textBox.TextScaled = true
            textBox.TextTruncate = Enum.TextTruncate.AtEnd
            textBox.BackgroundColor3 = theme.TextboxInputBackground
            textBox.BackgroundTransparency = 0
            textBox.Position = UDim2.fromScale(0.78, 0.2)
            textBox.Size = UDim2.fromOffset(70, 18)
            textBox.Parent = textbox

            local uICorner14 = Instance.new("UICorner")
            uICorner14.CornerRadius = UDim.new(0, 4)
            uICorner14.Parent = textBox

            textbox.MouseEnter:Connect(function()
                textbox.BackgroundColor3 = theme.ElementHover
            end)

            textbox.MouseLeave:Connect(function()
                textbox.BackgroundColor3 = theme.ElementBackground
            end)

            textBox.FocusLost:Connect(function()
                callback(textBox.Text)
            end)
        end

        function ElementHandler:Dropdown(text, options, default, callback)
            text = text or "Dropdown"
            options = options or {"Option 1", "Option 2", "Option 3"}
            default = default or options[1]
            callback = callback or function() end

            local dropdown = Instance.new("Frame")
            dropdown.BackgroundColor3 = theme.ElementBackground
            dropdown.BackgroundTransparency = 0.1
            dropdown.Size = UDim2.fromOffset(340, 30)
            dropdown.Parent = holder

            local uICorner = Instance.new("UICorner")
            uICorner.CornerRadius = UDim.new(0, 4)
            uICorner.Parent = dropdown

            local dropdownButton = Instance.new("TextButton")
            dropdownButton.BackgroundTransparency = 1
            dropdownButton.Size = UDim2.fromOffset(340, 30)
            dropdownButton.Text = ""
            dropdownButton.AutoButtonColor = false
            dropdownButton.Parent = dropdown

            local dropdownLabel = Instance.new("TextLabel")
            dropdownLabel.Font = Enum.Font.Gotham
            dropdownLabel.Text = text
            dropdownLabel.TextColor3 = theme.ElementText
            dropdownLabel.TextSize = 14
            dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
            dropdownLabel.BackgroundTransparency = 1
            dropdownLabel.Position = UDim2.fromScale(0.02, 0)
            dropdownLabel.Size = UDim2.fromOffset(200, 30)
            dropdownLabel.Parent = dropdownButton

            local selectedLabel = Instance.new("TextLabel")
            selectedLabel.Font = Enum.Font.Gotham
            selectedLabel.Text = default
            selectedLabel.TextColor3 = theme.ElementText
            selectedLabel.TextSize = 14
            selectedLabel.TextXAlignment = Enum.TextXAlignment.Right
            selectedLabel.BackgroundTransparency = 1
            selectedLabel.Position = UDim2.fromScale(0.55, 0)
            selectedLabel.Size = UDim2.fromOffset(120, 30)
            selectedLabel.Parent = dropdownButton

            local arrowIcon = Instance.new("ImageLabel")
            arrowIcon.Name = "arrowIcon"
            arrowIcon.Image = "rbxassetid://10709767827"
            arrowIcon.BackgroundTransparency = 1
            arrowIcon.Position = UDim2.fromScale(0.92, 0.25)
            arrowIcon.Size = UDim2.fromOffset(18, 18)
            arrowIcon.ImageColor3 = theme.TabIcon
            arrowIcon.Parent = dropdownButton

            local dropdownList = Instance.new("ScrollingFrame")
            dropdownList.BackgroundColor3 = theme.DropdownListBackground
            dropdownList.BackgroundTransparency = 0
            dropdownList.Position = UDim2.fromScale(0, 1)
            dropdownList.Size = UDim2.fromOffset(340, 0)
            dropdownList.ScrollBarThickness = 0
            dropdownList.ScrollingDirection = Enum.ScrollingDirection.Y
            dropdownList.CanvasSize = UDim2.fromOffset(0, 0)
            dropdownList.Visible = false
            dropdownList.Parent = dropdown

            local uICornerList = Instance.new("UICorner")
            uICornerList.CornerRadius = UDim.new(0, 4)
            uICornerList.Parent = dropdownList

            local listLayout = Instance.new("UIListLayout")
            listLayout.SortOrder = Enum.SortOrder.LayoutOrder
            listLayout.Padding = UDim.new(0, 2)
            listLayout.Parent = dropdownList

            local listPadding = Instance.new("UIPadding")
            listPadding.PaddingTop = UDim.new(0, 2)
            listPadding.PaddingBottom = UDim.new(0, 2)
            listPadding.Parent = dropdownList

            local isOpen = false
            local maxHeight = 100
            local optionHeight = 25
            local totalHeight = #options * (optionHeight + listLayout.Padding.Offset) + listPadding.PaddingTop.Offset + listPadding.PaddingBottom.Offset
            local listHeight = math.min(totalHeight, maxHeight)

            dropdownList.CanvasSize = UDim2.fromOffset(0, totalHeight)

            local function updateListSize()
                if isOpen then
                    dropdownList.Size = UDim2.fromOffset(340, listHeight)
                    dropdownList.Visible = true
                else
                    dropdownList.Size = UDim2.fromOffset(340, 0)
                    dropdownList.Visible = false
                end
            end

            local function toggleDropdown()
                isOpen = not isOpen
                if isOpen then
                    arrowIcon.Image = "rbxassetid://10709768939"
                else
                    arrowIcon.Image = "rbxassetid://10709767827"
                end
                updateListSize()
            end

            dropdownButton.MouseButton1Click:Connect(toggleDropdown)

            dropdownButton.MouseEnter:Connect(function()
                dropdown.BackgroundColor3 = theme.ElementHover
                arrowIcon.ImageColor3 = theme.TabIconHover
            end)

            dropdownButton.MouseLeave:Connect(function()
                dropdown.BackgroundColor3 = theme.ElementBackground
                arrowIcon.ImageColor3 = theme.TabIcon
            end)

            for _, option in ipairs(options) do
                local optionButton = Instance.new("TextButton")
                optionButton.BackgroundColor3 = theme.DropdownOptionBackground
                optionButton.BackgroundTransparency = 0
                optionButton.Size = UDim2.fromOffset(340, optionHeight)
                optionButton.Text = ""
                optionButton.AutoButtonColor = false
                optionButton.Parent = dropdownList

                local uICornerOption = Instance.new("UICorner")
                uICornerOption.CornerRadius = UDim.new(0, 4)
                uICornerOption.Parent = optionButton

                local optionLabel = Instance.new("TextLabel")
                optionLabel.Font = Enum.Font.Gotham
                optionLabel.Text = option
                optionLabel.TextColor3 = theme.ElementText
                optionLabel.TextSize = 14
                optionLabel.TextXAlignment = Enum.TextXAlignment.Left
                optionLabel.BackgroundTransparency = 1
                optionLabel.Position = UDim2.fromScale(0.02, 0)
                optionLabel.Size = UDim2.fromOffset(330, optionHeight)
                optionLabel.Parent = optionButton

                optionButton.MouseEnter:Connect(function()
                    optionButton.BackgroundColor3 = theme.DropdownOptionHover
                    optionLabel.TextColor3 = theme.ElementTextHover
                end)

                optionButton.MouseLeave:Connect(function()
                    optionButton.BackgroundColor3 = theme.DropdownOptionBackground
                    optionLabel.TextColor3 = theme.ElementText
                end)

                optionButton.MouseButton1Click:Connect(function()
                    selectedLabel.Text = option
                    callback(option)
                    toggleDropdown()
                end)
            end

            local dropdownHolder = Instance.new("Frame")
            dropdownHolder.BackgroundTransparency = 1
            dropdownHolder.Size = UDim2.fromOffset(340, 30 + (isOpen and listHeight or 0))
            dropdownHolder.Parent = holder

            dropdown.Parent = dropdownHolder

            local function updateDropdownHolderSize()
                dropdownHolder.Size = UDim2.fromOffset(340, 30 + (isOpen and listHeight or 0))
                updateCanvasSize()
            end

            dropdownList:GetPropertyChangedSignal("Size"):Connect(updateDropdownHolderSize)
        end

        return ElementHandler
    end

    tabContainer.ChildAdded:Connect(function()
        local firstContainer = contentFrame:FindFirstChild("container")
        if firstContainer then
            firstContainer.Visible = true
            local firstButton = tabContainer:FindFirstChildWhichIsA("TextButton")
            if firstButton then
                firstButton.BackgroundColor3 = theme.TabButtonActive
                firstButton.BackgroundTransparency = transparency and 0.2 or 0
                firstButton:FindFirstChild("icon").ImageColor3 = theme.TabIconActive
                firstButton:FindFirstChild("textLabel").TextTransparency = 0
                firstButton:FindFirstChild("textLabel").TextColor3 = theme.TabTextActive
            end
        end
    end)

    spawn(function()
        if table.StartupSound and table.StartupSound.Toggle and table.StartupSound.SoundID then
            local sound = Instance.new("Sound", game.CoreGui)
            sound.SoundId = table.StartupSound.SoundID
            sound.Volume = 1.5
            sound.TimePosition = table.StartupSound.TimePosition or 0
            sound:Play()
            sound.Stopped:Wait()
            sound:Destroy()
        end
    end)

    return tabHandler
end

return Library
