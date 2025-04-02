//
//  ViewRouter.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// A simple attempt at gettng programmatic navigation.  Each case on here can be
/// referenced to create the view it represents.
@MainActor
enum ViewRouter: String, CaseIterable {
    case alert = "Alert (15)"
    case angularGradient = "AngularGradient (13)"
    case anyLayout = "AnyLayout (16)"
    case anyShapeExample = "AnyShapeExample (16)"
    case asyncImage = "AsyncImage (15)"
    case bindingExtension = "Binding Extension (13)"
    case blendModes = "Blend Modes (13)"
    case buttonBorderShape = "ButtonBorderShape (15)"
    case canvas = "Canvas (15)"
    case capsule = "Capsule (13)"
    case chartsProgressView = "Charts Progress View (16)"
    case circle = "Circle (13)"
    case color = "Color (13)"
    case colorPicker = "ColorPicker (14)"
    case containerRelativeShape = "ContainerRelativeShape (14)"
    case contentUnavailable = "ContentUnavailableView (17)"
    case controls = "Controls (18)"
    case controlGroup = "ControlGroup (15)"
    case customContainer = "Custom Container View (18)"
    case datePicker = "DatePicker (13)"
    case deferGesture = "Defer Gesture (16)"
    case disclosureGroup = "DisclosureGroup (14)"
    case divider = "Divider (13)"
    case entryMacro = "Entry Macro (18)"
    case environment = "Environment (17)"
    case groupBox = "GroupBox (14)"
    case editButton = "EditButton (13)"
    case ellipse = "Ellipse (13)"
    case ellipticalGradient = "EllipticalGradient (15)"
    case equatableView = "EquatableView (13)"
    case forEach = "ForEach (13)"
    case form = "Form (13)"
    case functionPlotting = "Function Plotting (18)"
    case geometryReader = "GeometryReader (13)"
    case grid = "Grid (16)"
    case gridRow = "GridRow (16)"
    case group = "Group (13)"
    case guage = "Guage (16)"
    case heroAnimation = "Hero Animation (18)"
    case httpTypes = "HTTPTypes (13)"
    case inspector = "Inspector (17)"
    case imageRenderer = "ImageRenderer (16)"
    case keyFrameAnimator = "KeyFrameAnimator (17)"
    case label = "Label (14)"
    case labeledContent = "LabeledContent (16)"
    case lazyHGrid = "LazyHGrid (14)"
    case lazyHStack = "LazyHStackExample (14)"
    case lazyVGrid = "LazyVGrid (14)"
    case lazyVStack = "LazyVStack (14)"
    case linearGradient = "LinearGradient (13)"
    case link = "Link (14)"
    case list = "List (13)"
    case locationManager = "Location (2)"
    case keyboardExamples = "Keyboard (17ish)"
    case measurements = "Measurement (10)"
    case menu = "Menu (14)"
    case meshGradient = "MeshGradient (18)"
    case multiDatePicker = "MultiDatePicker (16)"
    case navigationSplitView = "NavigationSplitView (16)"
    case navigationStack = "NavigationStack (16)"
    case navigationView = "NavigationViewExample (13) deprecated"
    case observation = "Observation Framework (17)"
    case offsetShape = "OffsetShape (13)"
    case outlineGroup = "OutlineGroup (14)"
    case pasteButton = "PasteButton (16)"
    case path = "Path (13)"
    case phaseAnimator = "PhaseAnimator (17)"
    case picker = "Picker (13)"
    case playground = "Playground (all)"
    case presentation = "Presentation (16)"
    case presentationStyle = "Presentation (18)"
    case previewableState = "Previews (18)"
    case progressView = "ProgressView (14)"
    case radialGradient = "RadialGradient (13)"
    case renameButton = "RenameButton (16)"
    case requestReview = "Request Review (16)"
    case rotatedShape = "RotatedShape (13)"
    case roundedRectangle = "RoundedRectangle (13)"
    case scaledShape = "ScaledShape (13)"
    case scrollPosition = "ScrollPosition (18)"
    case scrollViewIndicators = "Scroll indicators (16)"
    case scrollViewKeyboard = "Scroll dismiss (16)"
    case scrollViewReader = "ScrollViewReader (14)"
    case scrollViewVisibility = "ScrollView Visibility (18)"
    case section = "Section (13)"
    case secureField = "SecureField (13)"
    case sfSymbolColor = "SF Symbol Colors (16)"
    case shareLink = "ShareLink (16)"
    case slider = "Slider (13)"
    case stepper = "Stepper (13)"
    case subscriptionView = "SubscriptionView (13)"
    case table = "Table (16)"
    case tableColumns = "Table (18)"
    case tabSection = "TabSection (18)"
    case tabView = "TabView (13)"
    case tabView18 = "TabView (18)"
    case tappedLocation = "Tapped Location (16)"
    case textEditor = "TextEditor (14)"
    case textField = "TextField (13)"
    case textRenderer = "TextRenderer (17)"
    case textSelection = "Text selection/subviewsOf (18)"
    case timelineView = "TimelineView (15)"
    case toggle = "Toggle (13)"
    case transformedShape = "TransformedShape (13)"
    case typedThrows = "Typed Throws"
    case weatherKit = "WeatherKit (16)"
    case zoomNavigationTransition = "Zoom Navigation Transition (18)"
    
    /// Name to use when all these are displayed in a list in the interface
    var name: String {
        rawValue.capitalized
    }
    
    /// The number of the OS this example applies to or 0 if it could not be determined
    var version: Int {
        if let number = Int(rawValue.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
            return number
        }

        return 0
    }
    
    /// The associated view that the enum value represents
    @ViewBuilder
    var view: some View {
        switch self {
        case .alert:
            BindingExtensions()
        case .angularGradient:
            AngularGradientExample()
        case .anyLayout:
            AnyLayoutExample()
        case .anyShapeExample:
            AnyShapeExample()
        case .asyncImage:
            AsyncImageExample()
        case .bindingExtension:
            BindingExtensions()
        case .blendModes:
            BlendModeExamples()
        case .buttonBorderShape:
            ButtonBorderShapeExample()
        case .canvas:
            CanvasExample()
        case .capsule:
            CapsuleExample()
        case .chartsProgressView:
            PieChartProgressExampleView()
        case .circle:
            CircleExample()
        case .containerRelativeShape:
            ContainerRelativeShapeExample()
        case .color:
            ColorExample()
        case .colorPicker:
            ColorPickerExample()
        case .contentUnavailable:
            ContentUnavailableViewExample()
        case .controlGroup:
            ControlGroupExample()
        case .controls:
            ControlExample()
        case .customContainer:
            CustomeContainerView()
        case .datePicker:
            DatePickerExample()
        case .deferGesture:
            DeferSystemGestures()
        case .disclosureGroup:
            DisclosureGroupExample()
        case .divider:
            DividerExample()
        case .entryMacro:
            EntryMacroView()
        case .environment:
            EnvironmentExample()
        case .groupBox:
            GroupBoxExampleView()
        case .editButton:
            EditButtonExample()
        case .ellipse, .ellipticalGradient:
            EllipseExample()
        case .equatableView:
            EquatableViewExample()
        case .forEach:
            ForEachExample()
        case .form:
            FormExample()
        case .functionPlotting:
            FunctionPlottingExample()
        case .geometryReader:
            GeometryReaderExample()
        case .grid, .gridRow:
            GridViewExample()
        case .guage:
            GuageExample()
        case .group:
            GroupExample()
        case .heroAnimation:
            HeroAnimationView()
        case .httpTypes:
            HTTPTypesExample()
        case .inspector:
            InspectorExample()
        case .imageRenderer:
            ImageRendererExample()
        case .keyFrameAnimator:
            KeyframeAnimatorExample()
        case .label:
            LabelExample()
        case .labeledContent:
            LabeledContentExample()
        case .lazyHGrid:
            LazyHGridExample()
        case .lazyHStack:
            LazyHStackExample()
        case .lazyVGrid:
            LazyVGridExample()
        case .lazyVStack:
            LazyVStackExample()
        case .linearGradient:
            LinearGradientExample()
        case .link:
            LinkExample()
        case .list:
            ListExample()
        case .locationManager:
            LocationManagerExample()
        case .keyboardExamples:
            KeyboardExample()
        case .measurements:
            MeasurementExamples()
        case .menu:
            ControlGroupExample()
        case .meshGradient:
            MeshGradientExample()
        case .multiDatePicker:
            MultiDatePickerExample()
        case .navigationSplitView:
            NavigationSplitViewExample()
        case .navigationStack:
            NavigationStackExample()
        case .navigationView:
            NavigationViewExample()
        case .observation:
            LibraryView()
        case .offsetShape:
            OffsetShapeExample()
        case .outlineGroup:
            OutlineGroupExample()
        case .pasteButton:
            PasteButtonExample()
        case .path:
            PathExample()
        case .phaseAnimator:
            PhaseAnimatorExample()
        case .picker:
            PickerExample()
        case .playground:
            PlaygoundView()
        case .presentation:
            PresentationExample()
        case .presentationStyle:
            PresentationStylingExample()
        case .previewableState:
            PreviewStateExample()
        case .progressView:
            ProgressViewExample()
        case .radialGradient:
            RadialGradientExample()
        case .renameButton:
            RenameButtonExample()
        case .requestReview:
            RequestReviewExample()
        case .rotatedShape:
            RotatedShapeExample()
        case .roundedRectangle:
            RoundedRectangleExample()
        case .scaledShape:
            ScaledShapeExample()
        case .scrollPosition:
            if #available(iOS 18, *) {
                ScrollPositionExampleView()
            } else {
                FutureFeatureView()
            }
        case .scrollViewIndicators:
            ScrollViewIndicatorsExample()
        case .scrollViewKeyboard:
            ScrollDismissesKeyboardExample()
        case .scrollViewReader:
            ScrollViewReaderExample()
        case .scrollViewVisibility:
            ScrollViewVisibility()
        case .section:
            SectionExample()
        case .secureField:
            SecureFieldExample()
        case .sfSymbolColor:
            SFSymbolColor()
        case .shareLink:
            ShareLinkExample()
        case .slider:
            SliderExample()
        case .stepper:
            StepperExample()
        case .subscriptionView:
            Text("Same as .onReceive() view modifier")
        case .table:
            TableExample()
        case .tableColumns:
            SongCountsTable()   // TODO: Rename?
        case .tabSection, .tabView:
            TabViewExample()
        case .tabView18:
            if #available(iOS 18, *) {
                TabView18Example()
            } else {
                FutureFeatureView()
            }
        case .tappedLocation:
            TapLocationExample()
        case .textEditor:
            TextEditorExample()
        case .textField:
            TextFieldExample()
        case .textRenderer:
            TextRendererExample()
        case .textSelection:
            if #available(iOS 18, *) {
                TextSelectionExample()
            } else {
                FutureFeatureView()
            }
        case .timelineView:
            TimelineViewExample()
        case .toggle:
            ToggleExample()
        case .transformedShape:
            TransformedShapeExample()
        case .typedThrows:
            TypedThrowsView()
        case .weatherKit:
            WeatherKitExample()
        case .zoomNavigationTransition:
            ZoomNavigationTransitionExample()
        }
    }
}

extension ViewRouter: Comparable {
    nonisolated static func < (lhs: ViewRouter, rhs: ViewRouter) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension ViewRouter: Identifiable {
    /// To make this unique so it is easier to use in List.
    nonisolated var id: Self {
        self
    }
}
