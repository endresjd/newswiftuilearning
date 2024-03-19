//
//  ViewRouter.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// A simple attempt at gettng programmatic navigation.  Each case on here can be
/// referenced to create the view it represents.
enum ViewRouter: String, CaseIterable {
    case angularGradient = "AngularGradient (13)"
    case anyLayout = "AnyLayout (16)"
    case anyShapeExample = "AnyShapeExample (16)"
    case asyncImage = "AsyncImage (15)"
    case buttonBorderShape = "ButtonBorderShape (15)"
    case canvas = "Canvas (15)"
    case capsule = "Capsule (13)"
    case circle = "Circle (13)"
    case color = "Color (13)"
    case colorPicker = "ColorPicker (14)"
    case containerRelativeShape = "ContainerRelativeShape (14)"
    case contentUnavailable = "ContentUnavailableView (17)"
    case controlGroup = "ControlGroup (15)"
    case datePicker = "DatePicker (13)"
    case deferGesture = "Defer Gesture (16)"
    case disclosureGroup = "DisclosureGroup (14)"
    case divider = "Divider (13)"
    case groupBox = "GroupBox (14)"
    case editButton = "EditButton (13)"
    case ellipse = "Ellipse (13)"
    case ellipticalGradient = "EllipticalGradient (15)"
    case equatableView = "EquatableView (13)"
    case forEach = "ForEach (13)"
    case form = "Form (13)"
    case geometryReader = "GeometryReader (13)"
    case grid = "Grid (16)"
    case gridRow = "GridRow (16)"
    case group = "Group (13)"
    case guage = "Guage (16)"
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
    case menu = "Menu (14)"
    case multiDatePicker = "MultiDatePicker (16)"
    case navigationSplitView = "NavigationSplitView (16)"
    case navigationStack = "NavigationStack (16)"
    case navigationView = "NavigationViewExample (13) deprecated"
    case offsetShape = "OffsetShape (13)"
    case outlineGroup = "OutlineGroup (14)"
    case pasteButton = "PasteButton (16)"
    case path = "Path (13)"
    case phaseAnimator = "PhaseAnimator (17)"
    case picker = "Picker (13)"
    case presentation = "Presentation (16)"
    case progressView = "ProgressView (14)"
    case radialGradient = "RadialGradient (13)"
    case renameButton = "RenameButton (16)"
    case requestReview = "Request Review (16)"
    case rotatedShape = "RotatedShape (13)"
    case roundedRectangle = "RoundedRectangle (13)"
    case scaledShape = "ScaledShape (13)"
    case scrollViewIndicators = "Scroll indicators (16)"
    case scrollViewKeyboard = "Scroll dismiss (16)"
    case scrollViewReader = "ScrollViewReader (14)"
    case section = "Section (13)"
    case secureField = "SecureField (13)"
    case sfSymbolColor = "SF Symbol Colors (16)"
    case shareLink = "ShareLink (16)"
    case slider = "Slider (13)"
    case stepper = "Stepper (13)"
    case subscriptionView = "SubscriptionView (13)"
    case table = "Table (16)"
    case tabView = "TabView (13)"
    case tappedLocation = "Tapped Location (16)"
    case textEditor = "TextEditor (14)"
    case textField = "TextField (13)"
    case timelineView = "TimelineView (15)"
    case toggle = "Toggle (13)"
    case transformedShape = "TransformedShape (13)"
    case weatherKit = "WeatherKit (16)"
    
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
        case .angularGradient:
            AngularGradientExample()
        case .anyLayout:
            AnyLayoutExample()
        case .anyShapeExample:
            AnyShapeExample()
        case .asyncImage:
            AsyncImageExample()
        case .buttonBorderShape:
            ButtonBorderShapeExample()
        case .canvas:
            CanvasExample()
        case .capsule:
            CapsuleExample()
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
        case .datePicker:
            DatePickerExample()
        case .deferGesture:
            DeferSystemGestures()
        case .disclosureGroup:
            DisclosureGroupExample()
        case .divider:
            DividerExample()
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
        case .geometryReader:
            GeometryReaderExample()
        case .grid, .gridRow:
            GridViewExample()
        case .guage:
            GuageExample()
        case .group:
            GroupExample()
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
        case .menu:
            ControlGroupExample()
        case .multiDatePicker:
            MultiDatePickerExample()
        case .navigationSplitView:
            NavigationSplitViewExample()
        case .navigationStack:
            NavigationStackExample()
        case .navigationView:
            NavigationViewExample()
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
        case .presentation:
            PresentationExample()
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
        case .scrollViewIndicators:
            ScrollViewIndicatorsExample()
        case .scrollViewKeyboard:
            ScrollDismissesKeyboardExample()
        case .scrollViewReader:
            ScrollViewReaderExample()
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
        case .tabView:
            TabViewExample()
        case .tappedLocation:
            TapLocationExample()
        case .textEditor:
            TextEditorExample()
        case .textField:
            TextFieldExample()
        case .timelineView:
            TimelineViewExample()
        case .toggle:
            ToggleExample()
        case .transformedShape:
            TransformedShapeExample()
        case .weatherKit:
            WeatherKitExample()
        }
    }
}

extension ViewRouter: Comparable {
    static func < (lhs: ViewRouter, rhs: ViewRouter) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension ViewRouter: Identifiable {
    /// To make this unique so it is easier to use in List.
    var id: Self {
        self
    }
}
