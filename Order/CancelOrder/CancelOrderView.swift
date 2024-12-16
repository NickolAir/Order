import SwiftUI

extension Color {
    init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha))
    }
}

struct CustomButton: View {
    var title: String
    var backgroundColor: Color
    var textColor: Color
    var action: (() -> ())?

    var body: some View {
        if let action = action {
            Button(action: action) {
                buttonContent
            }
        } else {
            buttonContent
        }
    }

    private var buttonContent: some View {
        Text(title)
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(12)
    }
}

struct CancelOrderView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var selectedOption: Int? = nil
    @State private var text: String = ""
    @State private var isCancelButtonPressed: Bool = false
    @State private var isLoading: Bool = false
    @State private var showToast: Bool = false
    
    @ObservedObject var viewModel = CancelOrderViewModel(isMoneyNotification: true)
    
    func returnOnPrevView() {
        
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if isCancelButtonPressed && selectedOption == nil {
                        HStack {
                            Text("Пожалуйста, выберите причину")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color(r: 244, g: 45, b: 45))
                            
                            Image("redCircleWarning")
                                .padding(.trailing, 14)
                        }
                        .background(Color(r: 255, g: 236, b: 236))
                        .cornerRadius(12)
                        .padding(.top, 15)
                        .transition(.opacity)
                    }
                    else {
                        EmptyView()
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        if (viewModel.cancelOptions.count > 0) {
                            ForEach(0...viewModel.cancelOptions.count - 1, id: \.self) { index in
                                let optionLabel = viewModel.cancelOptions[index]
                                OptionToggle(isSelected: $selectedOption, optionIndex: index, label: optionLabel)
                            }
                            
                        }
                        
                        OptionToggle(isSelected: $selectedOption, optionIndex: viewModel.cancelOptions.count, label: "Другое")
                    }
                    .padding(.init(top: 16, leading: 16, bottom: 0, trailing: 16))
                    
                    if selectedOption == viewModel.cancelOptions.count {
                        TextField("Опишите проблему", text: $text)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .background(Color(r: 246, g: 246, b: 246))
                            .frame(maxWidth: .infinity)
                            .cornerRadius(12)
                            .transition(.opacity)
                            .padding(.top, 15)
                    }

                    if (viewModel.isMoneyNotification) {
                        HStack {
                            Text("Обычно деньги сразу возвращаются на карту. В некоторых случаях это может занять до 3 рабочих дней.")
                                .padding(.all, 15)
                            
                            Image("yellowCircleWarning")
                                .padding(.trailing, 14)
                                .offset(x: 0, y: -20)
                        }
                        .background(Color(r: 254, g: 247, b: 222))
                        .cornerRadius(12)
                        .padding(.top, 15)
                    }
                    
                    CustomButton(title: "Отменить заказ", backgroundColor: Color(r: 255, g: 70, b: 17), textColor: .white) {
                        if let _ = selectedOption {
                            isLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                isLoading = false
                                showToast = true
                                selectedOption = nil
                            }
                        } else {
                            isCancelButtonPressed = true
                        }
                    }
                    .padding(.top, 15)
                    Spacer()
                }
                .padding()
                
                
                if isLoading {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    ProgressView()
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
            
            }
            
            .toast(isPresented: $showToast, message: "Заказ успешно отменён!")
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Оформление заказа")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem (placement: .navigation) {
                Button("BackButton", systemImage: "chevron.left", action: {
                    presentationMode.wrappedValue.dismiss()
                })
                    .tint(Color(r: 255, g: 70, b: 17))
            }
        }
    }
}

struct OptionToggle: View {
    @Binding var isSelected: Int?
    var optionIndex: Int
    var label: String
    
    var body: some View {
        HStack {
            Toggle(isOn: Binding(
                get: { isSelected == optionIndex },
                set: { newValue in
                    if newValue {
                        isSelected = optionIndex
                    } else {
                        isSelected = nil
                    }
                }
            )) {
                Text(label)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
            }
            .toggleStyle(CheckboxToggleStyle())
        }
        
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top) {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(configuration.isOn ? Color(r: 255, g: 70, b: 17) : Color.gray)
                .background(configuration.isOn ? Color(r: 255, g: 70, b: 17).opacity(0.2) : Color.clear)
                .cornerRadius(5)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
            
        }
    }
}

extension View {
    func toast(isPresented: Binding<Bool>, message: String) -> some View {
        ZStack {
            self
            if isPresented.wrappedValue {
                VStack {
                    Spacer()
                    Text(message)
                        .font(.body)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isPresented.wrappedValue = false
                            }
                        }
                }
                .transition(.opacity)
            }
        }
    }
}

#Preview {
    CancelOrderView()
}
