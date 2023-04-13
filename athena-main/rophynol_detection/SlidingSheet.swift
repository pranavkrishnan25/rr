//import SwiftUI
//
//struct SlidingSheet<Content: View>: View {
//    @GestureState private var dragState = DragState.inactive
//    @State private var position = UIScreen.main.bounds.height * 0.2
//
//    var content: () -> Content
//
//    var body: some View {
//        Group {
//            VStack {
//                Spacer()
//                Handle()
//
//                content()
//                    .padding(.top)
//            }
//            .frame(width: UIScreen.main.bounds.width)
//            .background(Color(.systemBackground))
//            .cornerRadius(20)
//            .shadow(radius: 10)
//            .offset(y: position)
//            .offset(y: dragState.translation.height)
//            .animation(.spring(), value: dragState.isActive)
//            .gesture(DragGesture()
//                .updating($dragState, body: { (value, state, _) in
//                    state = .dragging(translation: value.translation)
//                })
//                .onEnded(onDragEnded)
//            )
//        }
//    }
//
//    private func onDragEnded(drag: DragGesture.Value) {
//        let threshold = UIScreen.main.bounds.height * 0.2
//        let upperLimit = UIScreen.main.bounds.height * 0.8
//
//        if drag.translation.height < -threshold {
//            position = -UIScreen.main.bounds.height * 0.8
//        } else {
//            position = 0
//        }
//    }
//}
//
//private struct Handle: View {
//    var body: some View {
//        RoundedRectangle(cornerRadius: 2.5)
//            .frame(width: 40, height: 5)
//            .padding(8)
//            .foregroundColor(Color(.systemGray4))
//    }
//}
//
//private enum DragState {
//    case inactive
//    case dragging(translation: CGSize)
//
//    var translation: CGSize {
//        switch self {
//        case .inactive:
//            return .zero
//        case .dragging(let translation):
//            return translation
//        }
//    }
//
//    var isActive: Bool {
//        switch self {
//        case .inactive:
//            return false
//        case .dragging:
//            return true
//        }
//    }
//}
//

import SwiftUI

//struct SlidingScreen<Content: View>: View {
//    @GestureState private var dragOffset = CGSize.zero
//    @Binding var isOpen: Bool
//
//    let maxHeight: CGFloat
//    let minHeight: CGFloat
//    let content: Content
//
//    init(isOpen: Binding<Bool>, maxHeight: CGFloat, minHeight: CGFloat, @ViewBuilder content: () -> Content) {
//        self._isOpen = isOpen
//        self.maxHeight = maxHeight
//        self.minHeight = minHeight
//        self.content = content()
//    }
//
//    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//                RoundedRectangle(cornerRadius: 5)
//                    .fill(Color.gray.opacity(0.5))
//                    .frame(width: 40, height: 5)
//                    .padding(.bottom, 12)
//
//                content
//            }
//            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
//            .background(Color.gray.opacity(0.7))
//            .cornerRadius(10)
//            .offset(y: isOpen ? dragOffset.height : max(minHeight - maxHeight, dragOffset.height))
//            .animation(.easeInOut, value: isOpen)
//            .gesture(
//                DragGesture()
//                    .updating($dragOffset) { value, state, _ in
//                        state = value.translation
//                    }
//                    .onEnded { value in
//                        if value.translation.height < -50 {
//                            isOpen = true
//                        } else if value.translation.height > 50 {
//                            isOpen = false
//                        }
//                    }
//            )
//        }
//    }
//}
struct SlidingScreen<Content: View>: View {
    @Binding var isOpen: Bool
    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content

    @Binding var offsetY: CGFloat

    init(isOpen: Binding<Bool>, offsetY: Binding<CGFloat>, maxHeight: CGFloat, minHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self._isOpen = isOpen
        self._offsetY = offsetY
        self.maxHeight = maxHeight
        self.minHeight = minHeight
        self.content = content()
    }

    var body: some View {
        let drag = DragGesture()
            .onChanged { value in
                let yOffset = value.translation.height
                offsetY = min(yOffset, 0)
            }
            .onEnded { value in
                let yOffset = value.translation.height
                let shouldOpen = yOffset < (maxHeight - minHeight) / 2

                withAnimation(.interactiveSpring()) {
                    isOpen = shouldOpen
                }
            }

        GeometryReader { geometry in
            VStack {
                content
            }
            .frame(width: geometry.size.width, height: maxHeight)
            .background(Color.gray.opacity(0.8))
            .cornerRadius(10)
            .offset(y: isOpen ? offsetY - maxHeight + minHeight : offsetY)
            .gesture(drag)
            .onAppear {
                offsetY = -maxHeight + minHeight
            }
        }
    }
}

//struct SlidingScreen_Previews: PreviewProvider {
//    @State static var isOpen = false
//
//    static var previews: some View {
//        SlidingScreen(isOpen: $isOpen, maxHeight: 300, minHeight: 30) {
//            Text("Sliding Content")
//        }
//    }
//}

struct SlidingScreen_Previews: PreviewProvider {
    @State static var isOpen: Bool = false
    @State static var offsetY: CGFloat = 0
    
    static var previews: some View {
        SlidingScreen(isOpen: $isOpen, offsetY: $offsetY, maxHeight: 300, minHeight: 20) {
            VStack {
                Text("This is a sliding screen")
                    .font(.headline)
                
                Spacer()
                
                Text("You can put any content you want inside.")
                    .font(.body)
                
                Spacer()
            }
            .padding()
        }
    }
}
