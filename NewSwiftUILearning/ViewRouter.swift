//
//  ViewRouter.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// A simple attempt at gettng programattic navigation.  Each case on here can be
/// referenced to create the view it represents.
enum ViewRouter: String, CaseIterable {
    case angularGradient = "AngularGradient (13)"
    case anyShapeExample = "AnyShapeExample (16)"
    case asyncImage = "AsyncImage (15)"
    case buttonBorderShape = "ButtonBorderShape (15)"
    
    /// Use a canvas to draw rich and dynamic 2D graphics inside a SwiftUI view
    case canvas = "Canvas (15)"
    
    case capsule = "Capsule (13)"
    case circle = "Circle (13)"
    case color = "Color (13)"
    case colorPicker = "ColorPicker (14)"
    case containerRelativeShape = "ContainerRelativeShape (14)"
    case contentUnavailable = "ContentUnavailableView (17)"
    case controlGroup = "ControlGroup (15)"
    case datePicker = "DatePicker (13)"
    case disclosureGroup = "DisclosureGroup (14)"
    case divider = "Divider (13)"
    
    /// Shows GroupBox view.
    ///
    /// See [GroupBox](https://developer.apple.com/documentation/swiftui/groupbox)
    /// See [GroupBox](https://www.hackingwithswift.com/quick-start/swiftui/how-to-group-views-visually-using-groupbox)
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
    case menu = "Menu (14)"
    case multiDatePicker = "MultiDatePicker (16)"
    case navigationSplitView = "NavigationSlitView (16)"
    case navigationStack = "NavigationStack (16)"
    case navigationView = "NavigationViewExample (13) deprecated"
    case offsetShape = "OffsetShape (13)"
    case outlineGroup = "OutlineGroup (14)"
    case pasteButton = "PasteButton (16)"
    case path = "Path (13)"
    case phaseAnimator = "PhaseAnimator (17)"
    case picker = "Picker (13)"
    case progressView = "ProgressView (14)"
    case radialGradient = "RadialGradient (13)"
    case renameButton = "RenameButton (16)"
    case rotatedShape = "RotatedShape (13)"
    case roundedRectangle = "RoundedRectangle (13)"
    case scaledShape = "ScaledShape (13)"
    case scrollViewReader = "ScrollViewReader (14)"
    case section = "Section (13)"
    case secureField = "SecureField (13)"
    case shape = "Shape (13)"
    case shareLink = "ShareLink (16)"
    case slider = "Slider (13)"
    case stepper = "Stepper (13)"
    case subscriptionView = "SubscriptionView (13)"
    case table = "Table (16)"
    case tabView = "TabView (13)"
    
    /// Name to use when all these are displayed in a list in the interface
    var name: String {
        rawValue.capitalized
    }
    
    /// The associated view that the enum value represents
    @ViewBuilder
    var view: some View {
        switch self {
        case .angularGradient:
            AngularGradientExample()
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
        case .menu:
            ControlGroupExample()
        case .multiDatePicker:
            MultiDatePickerExample()
        case .navigationSplitView:
            NavigationSlitViewExample()
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
        case .progressView:
            ProgressViewExample()
        case .radialGradient:
            RadialGradientExample()
        case .renameButton:
            RenameButtonExample()
        case .rotatedShape:
            RotatedShapeExample()
        case .roundedRectangle:
            RoundedRectangleExample()
        case .scaledShape:
            ScaledShapeExample()
        case .scrollViewReader:
            ScrollViewReaderExample()
        case .section:
            SectionExample()
        case .secureField:
            SecureFieldExample()
        case .shape:
            ShapeExample()
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
