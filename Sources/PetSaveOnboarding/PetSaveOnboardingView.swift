//
//  PetSaveOnboardingView.swift
//  PetSaveOnboardingView
//
//  Created by aaqib.hussain on 07.08.21.
//

import SwiftUI

public struct PetSaveOnboardingView: View {
    
    @State var currentPageIndex = 0
    
    public init(items: [OnboardingModel]) {
        self.items = items
    }
    
    private var onNext: (_ currentIndex: Int) -> Void = { _ in }
    private var onSkip: () -> Void = {}
    
    private var items: [OnboardingModel] = []
    
    public var body: some View {
        if items.isEmpty {
            Text("No items to show.")
        } else {
            // TabView
            VStack() {
                TabView(selection: $currentPageIndex) {
                    ForEach(0..<items.count) { index in
                        OnboardingView(onboarding: items[index])
                            .tag(index)
                    }
                }
                .padding(.bottom, 10)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .onAppear {
                    setupPageControlAppearance()
                }
                
                // Next Button
                Button(action: {
                    withAnimation {
                        currentPageIndex = currentPageIndex + 1 < items.count  ? currentPageIndex + 1 : 0
                    }
                    onNext(currentPageIndex)
                    
                }, label: {
                    HStack {
                        Text(items[currentPageIndex].nextButtonTitle)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,
                                   maxHeight: 44)
                            .contentShape(Capsule())
                    }
                })
                    .background(Color.rwDark)
                    .clipShape(Capsule())
                    .buttonStyle(.plain)
                    .padding(.horizontal, 20)
                
                // Skip Button
                Button(action: {
                    onSkip()
                }, label: {
                    HStack {
                        Text(items[currentPageIndex].skipButtonTitle)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,
                                   maxHeight: 44)
                            .contentShape(Capsule())
                    }
                })
                    .background(Color.rwGreen)
                    .clipShape(Capsule())
                    .buttonStyle(.plain)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
            }.background {
                OnboardingBackgroundView()
            }
        }
    }
    
    public func onNext(action: @escaping (_ currentIndex: Int) -> Void) -> Self {
        var petSaveOnboardingView = self
        petSaveOnboardingView.onNext = action
        return petSaveOnboardingView
    }
    
    public func onSkip(action: @escaping () -> Void) -> Self {
        var petSaveOnboardingView = self
        petSaveOnboardingView.onSkip = action
        return petSaveOnboardingView
    }
    
    private func setupPageControlAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.rwGreen)
    }
}
