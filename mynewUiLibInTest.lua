local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local TheParent
if RunService:IsStudio() then
	TheParent = LocalPlayer.PlayerGui
else
	TheParent = game:GetService('CoreGui')
end

local HubNormal = {}
local Hub = {}
local args = {Tabs = {}}

local DefaultKeybind = Enum.KeyCode.RightControl

local function createScreenGui()
	
	local SolsLib = Instance.new("ScreenGui")
	SolsLib.Name = "SolsLib"
	SolsLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SolsLib.ResetOnSpawn = false
	SolsLib.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	SolsLib.IgnoreGuiInset = true

	local LoadingFrame = Instance.new("Frame")
	LoadingFrame.Name = "LoadingFrame"
	LoadingFrame.Visible = false
	LoadingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	LoadingFrame.Size = UDim2.new(0.3, 0, 0.3, 0)
	LoadingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoadingFrame.BackgroundTransparency = 1
	LoadingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	LoadingFrame.BorderSizePixel = 0
	LoadingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoadingFrame.Parent = SolsLib

	local LoadingCanvas = Instance.new("CanvasGroup")
	LoadingCanvas.Name = "LoadingCanvas"
	LoadingCanvas.AnchorPoint = Vector2.new(0.5, 0.5)
	LoadingCanvas.Size = UDim2.new(1, 0, 1, 0)
	LoadingCanvas.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoadingCanvas.Position = UDim2.new(0.5, 0, 0.5, 0)
	LoadingCanvas.BorderSizePixel = 0
	LoadingCanvas.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	LoadingCanvas.GroupTransparency = 1
	LoadingCanvas.Parent = LoadingFrame

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0.1, 0)
	UICorner.Parent = LoadingCanvas

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Thickness = 2
	UIStroke.Color = Color3.fromRGB(50, 50, 50)
	UIStroke.Parent = LoadingCanvas

	local LoadingText = Instance.new("TextLabel")
	LoadingText.Name = "LoadingText"
	LoadingText.AnchorPoint = Vector2.new(0.5, 0.5)
	LoadingText.Size = UDim2.new(0.6313328, 0, 0.2191142, 0)
	LoadingText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoadingText.BackgroundTransparency = 1
	LoadingText.Position = UDim2.new(0.5, 0, 0.4230769, 0)
	LoadingText.BorderSizePixel = 0
	LoadingText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoadingText.FontSize = Enum.FontSize.Size14
	LoadingText.TextSize = 14
	LoadingText.TextColor3 = Color3.fromRGB(240, 240, 240)
	LoadingText.Text = "Loading..."
	LoadingText.TextWrapped = true
	LoadingText.TextWrap = true
	LoadingText.Font = Enum.Font.SourceSansBold
	LoadingText.TextScaled = true
	LoadingText.Parent = LoadingCanvas

	local LoadingSubText = Instance.new("TextLabel")
	LoadingSubText.Name = "LoadingSubText"
	LoadingSubText.AnchorPoint = Vector2.new(0.5, 0)
	LoadingSubText.Size = UDim2.new(1, 0, 0.3539007, 0)
	LoadingSubText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoadingSubText.BackgroundTransparency = 1
	LoadingSubText.Position = UDim2.new(0.5, 0, 1.0000001, 0)
	LoadingSubText.BorderSizePixel = 0
	LoadingSubText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoadingSubText.FontSize = Enum.FontSize.Size14
	LoadingSubText.TextSize = 14
	LoadingSubText.TextColor3 = Color3.fromRGB(200, 200, 200)
	LoadingSubText.Text = "by SolCheio"
	LoadingSubText.TextWrapped = true
	LoadingSubText.TextWrap = true
	LoadingSubText.Font = Enum.Font.SourceSansBold
	LoadingSubText.TextScaled = true
	LoadingSubText.Parent = LoadingText

	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.AspectRatio = 1.7944056
	UIAspectRatioConstraint.Parent = LoadingCanvas

	local LoadingFrameShadow = Instance.new("ImageLabel")
	LoadingFrameShadow.Name = "LoadingFrameShadow"
	LoadingFrameShadow.ZIndex = -9999
	LoadingFrameShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	LoadingFrameShadow.Size = UDim2.new(1, 24, 1, 24)
	LoadingFrameShadow.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoadingFrameShadow.BackgroundTransparency = 1
	LoadingFrameShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	LoadingFrameShadow.BorderSizePixel = 0
	LoadingFrameShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoadingFrameShadow.ScaleType = Enum.ScaleType.Slice
	LoadingFrameShadow.ImageTransparency = 0.3438309
	LoadingFrameShadow.Image = "rbxassetid://186491278"
	LoadingFrameShadow.SliceCenter = Rect.new(48, 48, 48, 48)
	LoadingFrameShadow.Parent = LoadingFrame

	local UIScale = Instance.new("UIScale")
	UIScale.Parent = LoadingFrame

	local Window = Instance.new("Frame")
	Window.Name = "Window"
	Window.Visible = false
	Window.AnchorPoint = Vector2.new(0.5, 0.5)
	Window.Size = UDim2.new(0.456, 0, 0.72, 0)
	Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window.BackgroundTransparency = 1
	Window.Position = UDim2.new(0.5, 0, 0.5, 0)
	Window.BorderSizePixel = 0
	Window.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Window.Parent = SolsLib

	local WindowCanvas = Instance.new("CanvasGroup")
	WindowCanvas.Name = "WindowCanvas"
	WindowCanvas.AnchorPoint = Vector2.new(0.5, 0.5)
	WindowCanvas.Size = UDim2.new(1, 0, 1, 0)
	WindowCanvas.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowCanvas.Position = UDim2.new(0.5, 0, 0.5, 0)
	WindowCanvas.BorderSizePixel = 0
	WindowCanvas.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	WindowCanvas.GroupTransparency = 1
	WindowCanvas.Parent = Window

	local UICorner1 = Instance.new("UICorner")
	UICorner1.Parent = WindowCanvas

	local Hide = Instance.new("ImageButton")
	Hide.Name = "Hide"
	Hide.ZIndex = 2
	Hide.AnchorPoint = Vector2.new(1, 0)
	Hide.Size = UDim2.new(0.0495727, 0, 0.0563107, 0)
	Hide.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Hide.BackgroundTransparency = 1
	Hide.Position = UDim2.new(1, 0, 0, 0)
	Hide.BorderSizePixel = 0
	Hide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Hide.ImageColor3 = Color3.fromRGB(150, 150, 150)
	Hide.Image = "rbxassetid://132261474823036"
	Hide.Parent = WindowCanvas

	local UIAspectRatioConstraint1 = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint1.Parent = Hide

	local TopBar = Instance.new("Frame")
	TopBar.Name = "TopBar"
	TopBar.Size = UDim2.new(1.0000001, 0, 0.0615406, 0)
	TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.Position = UDim2.new(-1e-07, 0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TopBar.Parent = WindowCanvas

	local Items = Instance.new("ScrollingFrame")
	Items.Name = "Items"
	Items.AnchorPoint = Vector2.new(0.5, 0)
	Items.Size = UDim2.new(0.9777779, 0, 1.0270307, 0)
	Items.ClipsDescendants = false
	Items.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Items.BackgroundTransparency = 1
	Items.Position = UDim2.new(0.5, 0, 0.9999995, -1)
	Items.Active = true
	Items.BorderSizePixel = 0
	Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Items.AutomaticCanvasSize = Enum.AutomaticSize.X
	Items.ScrollingDirection = Enum.ScrollingDirection.X
	Items.CanvasSize = UDim2.new(0, 0, 0, 0)
	Items.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	Items.ScrollBarImageTransparency = 1
	Items.ScrollBarThickness = 0
	Items.Parent = TopBar

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Padding = UDim.new(.02,0)
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Parent = Items

	local Tabs = Instance.new("Frame")
	Tabs.Name = "Tabs"
	Tabs.AnchorPoint = Vector2.new(0.5, 1)
	Tabs.Size = UDim2.new(1, 0, 0.8756431, 0)
	Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tabs.BackgroundTransparency = 1
	Tabs.Position = UDim2.new(0.5, 0, 0.9999999, 0)
	Tabs.BorderSizePixel = 0
	Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tabs.Parent = WindowCanvas

	local UIPageLayout = Instance.new("UIPageLayout")
	UIPageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIPageLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIPageLayout.EasingStyle = Enum.EasingStyle.Exponential
	UIPageLayout.Parent = Tabs

	local UIAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint2.AspectRatio = 1.1359223
	UIAspectRatioConstraint2.Parent = Window

	local UIScale1 = Instance.new("UIScale")
	UIScale1.Scale = 0.7
	UIScale1.Parent = Window

	local Shadow = Instance.new("ImageLabel")
	Shadow.Name = "Shadow"
	Shadow.ZIndex = -9999
	Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
	Shadow.Size = UDim2.new(1, 24, 1, 24)
	Shadow.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Shadow.BackgroundTransparency = 1
	Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	Shadow.BorderSizePixel = 0
	Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Shadow.ScaleType = Enum.ScaleType.Slice
	Shadow.ImageTransparency = 0.3438309
	Shadow.Image = "rbxassetid://186491278"
	Shadow.SliceCenter = Rect.new(48, 48, 48, 48)
	Shadow.Parent = Window

	local TemplateStorage = Instance.new("Frame")
	TemplateStorage.Name = "TemplateStorage"
	TemplateStorage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TemplateStorage.BorderSizePixel = 0
	TemplateStorage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TemplateStorage.Parent = SolsLib

	local Topbar = Instance.new("Folder")
	Topbar.Name = "Topbar"
	Topbar.Parent = TemplateStorage

	local TabTemplate = Instance.new("Frame")
	TabTemplate.Name = "TabTemplate"
	TabTemplate.Size = UDim2.new(0.1334174, 0, 0.7, 0)
	TabTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabTemplate.Position = UDim2.new(0, 0, 0.15, 0)
	TabTemplate.BorderSizePixel = 0
	TabTemplate.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	TabTemplate.Parent = Topbar

	local UICorner2 = Instance.new("UICorner")
	UICorner2.CornerRadius = UDim.new(1, 0)
	UICorner2.Parent = TabTemplate

	local UIStroke1 = Instance.new("UIStroke")
	UIStroke1.Thickness = 1.5
	UIStroke1.Color = Color3.fromRGB(70, 70, 70)
	UIStroke1.Parent = TabTemplate

	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.AnchorPoint = Vector2.new(0.5, 0.5)
	Title.Size = UDim2.new(0.8, 0, 1, 0)
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BackgroundTransparency = 1
	Title.Position = UDim2.new(0.5, 0, 0.5, 0)
	Title.BorderSizePixel = 0
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.FontSize = Enum.FontSize.Size10
	Title.TextSize = 10
	Title.TextColor3 = Color3.fromRGB(200, 200, 200)
	Title.Text = "A Template"
	Title.TextWrapped = true
	Title.TextWrap = true
	Title.Font = Enum.Font.SourceSansBold
	Title.TextScaled = true
	Title.Parent = TabTemplate

	local Tabs1 = Instance.new("Folder")
	Tabs1.Name = "Tabs"
	Tabs1.Parent = TemplateStorage

	local ButtonTemplate = Instance.new("Frame")
	ButtonTemplate.Name = "ButtonTemplate"
	ButtonTemplate.Size = UDim2.new(0.9880342, 0, 0.0782689, 0)
	ButtonTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ButtonTemplate.Position = UDim2.new(0.0059829, 0, 0, 0)
	ButtonTemplate.BorderSizePixel = 0
	ButtonTemplate.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ButtonTemplate.Parent = Tabs1

	local UICorner3 = Instance.new("UICorner")
	UICorner3.CornerRadius = UDim.new(1, 0)
	UICorner3.Parent = ButtonTemplate

	local UIStroke2 = Instance.new("UIStroke")
	UIStroke2.Color = Color3.fromRGB(50, 50, 50)
	UIStroke2.Parent = ButtonTemplate

	local Title1 = Instance.new("TextLabel")
	Title1.Name = "Title"
	Title1.AnchorPoint = Vector2.new(0, 0.5)
	Title1.Size = UDim2.new(0.4031142, 0, 1, 0)
	Title1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title1.BackgroundTransparency = 1
	Title1.Position = UDim2.new(0.0311419, 0, 0.5, 0)
	Title1.BorderSizePixel = 0
	Title1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title1.FontSize = Enum.FontSize.Size18
	Title1.TextSize = 18
	Title1.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title1.Text = "Button"
	Title1.TextWrapped = true
	Title1.TextWrap = true
	Title1.Font = Enum.Font.SourceSansBold
	Title1.TextXAlignment = Enum.TextXAlignment.Left
	Title1.TextScaled = true
	Title1.Parent = ButtonTemplate

	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	UITextSizeConstraint.MaxTextSize = 18
	UITextSizeConstraint.Parent = Title1

	local Type = Instance.new("TextLabel")
	Type.Name = "Type"
	Type.AnchorPoint = Vector2.new(1, 0.5)
	Type.Size = UDim2.new(0.5514913, 0, 0.4, 0)
	Type.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Type.BackgroundTransparency = 1
	Type.Position = UDim2.new(1, 0, 0.5000002, 0)
	Type.BorderSizePixel = 0
	Type.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Type.FontSize = Enum.FontSize.Size18
	Type.TextSize = 18
	Type.TextColor3 = Color3.fromRGB(200, 200, 200)
	Type.Text = "this is an button"
	Type.TextWrapped = true
	Type.TextWrap = true
	Type.Font = Enum.Font.SourceSansBold
	Type.TextXAlignment = Enum.TextXAlignment.Left
	Type.TextScaled = true
	Type.Parent = ButtonTemplate

	local Button = Instance.new("ImageButton")
	Button.Name = "Button"
	Button.Size = UDim2.new(1, 0, 1, 0)
	Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Button.BackgroundTransparency = 1
	Button.BorderSizePixel = 0
	Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button.ImageTransparency = 1
	Button.Parent = ButtonTemplate

	local UICorner4 = Instance.new("UICorner")
	UICorner4.CornerRadius = UDim.new(1, 0)
	UICorner4.Parent = Button

	local UIScale2 = Instance.new("UIScale")
	UIScale2.Parent = ButtonTemplate

	local TabTemplate1 = Instance.new("ScrollingFrame")
	TabTemplate1.Name = "TabTemplate"
	TabTemplate1.AnchorPoint = Vector2.new(0.5, 0.5)
	TabTemplate1.Size = UDim2.new(1, 0, 0.98, 0)
	TabTemplate1.ClipsDescendants = false
	TabTemplate1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabTemplate1.BackgroundTransparency = 1
	TabTemplate1.Position = UDim2.new(0.5, 0, 0.5, 0)
	TabTemplate1.Active = true
	TabTemplate1.BorderSizePixel = 0
	TabTemplate1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabTemplate1.AutomaticCanvasSize = Enum.AutomaticSize.Y
	TabTemplate1.ScrollingDirection = Enum.ScrollingDirection.Y
	TabTemplate1.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabTemplate1.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	TabTemplate1.ScrollBarImageTransparency = 1
	TabTemplate1.ScrollBarThickness = 0
	TabTemplate1.Parent = Tabs1

	local UIListLayout1 = Instance.new("UIListLayout")
	UIListLayout1.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout1.Padding = UDim.new(0.03, 0)
	UIListLayout1.Parent = TabTemplate1
	
	Hub.Keybind = DefaultKeybind
	
	function Hub:SetName(name)
		if name then
			SolsLib.Name = name
		end
	end
	
	function Hub:NewTab(tabName)
		local Found = false
		for i, v in args.Tabs do
			wait()
			if v.Name == tabName then
				Found = true
			end
		end
		if Found ~= true and tabName ~= nil then
			local TabTable = {}
			local TabArgsTable = {Name = tabName; Contents = {}}
			function TabTable:NewButton(name, callback)
				table.insert(TabArgsTable.Contents, {Type = 'Button'; Name = name or 'Error generating button name'; Callback = callback or function() warn('Callback is nil') end;})
			end
			
			function TabTable:FinishTab()
				table.insert(args.Tabs, TabArgsTable)
			end
			return TabTable
		end
		if Found then
			warn('Tab Already Exists')
		end
	end
	
	function Hub:SetToggleKeyBind(keyBind:InputObject)
		if keyBind then
			Hub.Keybind = keyBind
		end
	end
	
	function Hub:SetLoadingTitleAndSubtitle(title, subtitle)
		if Title then
			Hub.LoadingTitle = title
		end
		if subtitle then
			Hub.LoadingSubTitle = subtitle
		end
	end
	
	function Hub:Start()
		if args.LoadingTitle then
			LoadingText.Text = args.LoadingTitle
		end
		if args.LoadingSubTitle then
			LoadingSubText.Text = args.LoadingSubTitle
		end
		
		local function changeTab(tabName)
			WindowCanvas.Tabs.UIPageLayout:JumpTo(WindowCanvas.Tabs[tabName])
		end

		local function setUpTabsAndUpperTab()
			wait()
			if args.Tabs then
				wait()
				for i, v in args.Tabs do
					wait()
					local tClone:Frame = Topbar.TabTemplate:Clone()
					local Interactive = Instance.new('ImageButton')
					Interactive.Name = 'Button'
					Interactive.Size = UDim2.new(1,0,1,0)
					Interactive.Transparency = 1
					tClone.Name = v.Name
					tClone.Title.Text = v.Name
					local ttClone:Frame = TemplateStorage.Tabs.TabTemplate:Clone()
					ttClone.Name = v.Name
					tClone.Parent = WindowCanvas.TopBar.Items
					ttClone.Parent = WindowCanvas.Tabs
					Interactive.Parent = tClone
					Interactive.Activated:Connect(function()
						changeTab(tClone.Name)
					end)
					for i, v in v.Contents do
						if v.Type == 'Button' then
							local BClone = ButtonTemplate:Clone()
							BClone.Name = v.Name
							BClone.Title.Text = v.Name
							BClone.Parent = ttClone
							local function activated()
								task.spawn(v.Callback)
								TweenService:Create(BClone.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Thickness = 2}):Play()
								task.wait(1)
								TweenService:Create(BClone.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Thickness = 1}):Play()
							end
							BClone.Button.Activated:Connect(activated)
						end
					end
				end
				wait()
			end
			wait()
		end
		
		local function closeButton()
			Window:SetAttribute('Toggled', false)
			Window.Interactable = false
			TweenService:Create(Window.UIScale, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Scale = .7}):Play()
			TweenService:Create(WindowCanvas, TweenInfo.new(1, Enum.EasingStyle.Exponential), {GroupTransparency = 1}):Play()
		end
		
		local function toggleMenu()
			if not Window:HasTag('NotAble') then
				if Window:GetAttribute('Toggled') then
					Window.Interactable = false
					TweenService:Create(Window.UIScale, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Scale = .7}):Play()
					TweenService:Create(WindowCanvas, TweenInfo.new(1, Enum.EasingStyle.Exponential), {GroupTransparency = 1}):Play()
				else
					Window.Interactable = true
					TweenService:Create(Window.UIScale, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Scale = 1}):Play()
					TweenService:Create(WindowCanvas, TweenInfo.new(1, Enum.EasingStyle.Exponential), {GroupTransparency = 0}):Play()
				end
				Window:SetAttribute('Toggled', not Window:GetAttribute('Toggled'))
			end
		end
		
		local function RunInternalFunctions()
			task.spawn(function()
				Hide.MouseEnter:Connect(function()
					TweenService:Create(Hide, TweenInfo.new(1, Enum.EasingStyle.Exponential), {ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
				end)
				Hide.MouseLeave:Connect(function()
					TweenService:Create(Hide, TweenInfo.new(1, Enum.EasingStyle.Exponential), {ImageColor3 = Color3.fromRGB(150,150,150)}):Play()
				end)
			end)
			task.spawn(function()
				local function changeTransparency()
					LoadingCanvas.UIStroke.Transparency = LoadingCanvas.GroupTransparency
				end
				LoadingCanvas:GetPropertyChangedSignal('GroupTransparency'):Connect(changeTransparency)
				changeTransparency()
			end)
			task.spawn(function()
				local function changeTransparency()
					LoadingFrame.LoadingFrameShadow.ImageTransparency = LoadingCanvas.GroupTransparency+0.344
				end
				LoadingCanvas:GetPropertyChangedSignal('GroupTransparency'):Connect(changeTransparency)
				changeTransparency()
			end)
			task.spawn(function()
				local function changeTransparency()
					Window.Shadow.ImageTransparency = WindowCanvas.GroupTransparency+0.344
				end
				WindowCanvas:GetPropertyChangedSignal('GroupTransparency'):Connect(changeTransparency)
				changeTransparency()
			end)
			task.spawn(function()
				if Hub.LoadingTitle then
					LoadingText.Text = Hub.LoadingTitle
				end
				if Hub.LoadingSubTitle then
					LoadingSubText.Text = Hub.LoadingSubTitle
				end
			end)
		end
		
		local function checkKey(inp:InputObject, gameproc)
			if (inp.KeyCode == Hub.Keybind or inp.UserInputType == Hub.Keybind) and not gameproc then
				toggleMenu()
			end
		end

		local function startLoading()
			RunInternalFunctions()
			SolsLib.Parent = TheParent
			LoadingFrame.Visible = true
			wait()
			TweenService:Create(LoadingFrame.UIScale, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Scale = 1}):Play()
			TweenService:Create(LoadingCanvas, TweenInfo.new(1, Enum.EasingStyle.Exponential), {GroupTransparency = 0}):Play()
			wait(1)
			setUpTabsAndUpperTab()
			wait()
			TweenService:Create(LoadingFrame.UIScale, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Scale = .7}):Play()
			TweenService:Create(LoadingCanvas, TweenInfo.new(1, Enum.EasingStyle.Exponential), {GroupTransparency = 1}):Play()
			wait(2)
			Window:SetAttribute('Toggled', true)
			Window.Visible = true
			Window.Interactable = true
			Window:RemoveTag('NotAble')
			TweenService:Create(Window.UIScale, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Scale = 1}):Play()
			TweenService:Create(WindowCanvas, TweenInfo.new(1, Enum.EasingStyle.Exponential), {GroupTransparency = 0}):Play()
			Hide.Activated:Connect(closeButton)
		end
		
		Window:SetAttribute('Toggled', false)
		
		task.spawn(startLoading)
		UserInputService.InputBegan:Connect(checkKey)
	end
	
end

HubNormal.new = function()
	createScreenGui()
	return Hub
end

return HubNormal
