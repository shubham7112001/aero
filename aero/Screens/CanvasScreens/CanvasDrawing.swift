
import SwiftUI


struct Point: Codable {
    var x: CGFloat
    var y: CGFloat
}

struct Line: Identifiable, Codable, Equatable {
    let id: UUID
    var points: [CGPoint]
    var color: Color
    
    init(points: [CGPoint], color: Color) {
        self.id = UUID()
        self.points = points
        self.color = color
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case points
        case color
    }
    
    enum ColorCodingKeys: String, CodingKey {
        case red, green, blue, opacity
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(points.map { $0.toPoint }, forKey: .points)
        
        var colorContainer = container.nestedContainer(keyedBy: ColorCodingKeys.self, forKey: .color)
        let components = color.cgColor?.components ?? [0, 0, 0, 1]
        try colorContainer.encode(components[0], forKey: .red)
        try colorContainer.encode(components[1], forKey: .green)
        try colorContainer.encode(components[2], forKey: .blue)
        try colorContainer.encode(components[3], forKey: .opacity)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        points = try container.decode([Point].self, forKey: .points).map { CGPoint(point: $0) }
        
        let colorContainer = try container.nestedContainer(keyedBy: ColorCodingKeys.self, forKey: .color)
        let red = try colorContainer.decode(CGFloat.self, forKey: .red)
        let green = try colorContainer.decode(CGFloat.self, forKey: .green)
        let blue = try colorContainer.decode(CGFloat.self, forKey: .blue)
        let opacity = try colorContainer.decode(CGFloat.self, forKey: .opacity)
        color = Color(red: red, green: green, blue: blue, opacity: opacity)
    }
}

extension CGPoint {
    var toPoint: Point {
        return Point(x: self.x, y: self.y)
    }
    
    init(point: Point) {
        self.init(x: point.x, y: point.y)
    }
}

struct CanvasDrawing: View {
    @State var savedDrawing: Data?
    @Binding  var lines: [Line]
    @State private var selectedColor: Color = Color.black
    
//    @Binding var isSaveDrawing: Bool?
    @Binding var isRemoveDrawing: Bool
//    @Binding var isLoadDrawing: Bool?
    
//    @Binding var
    
    var body: some View {
        VStack {
            Canvas { ctx, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    
                    ctx.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: AppConstants.canvasDrawingLineWidth, lineCap: .round, lineJoin: .round))
                }
            }
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged({ value in
                    let position = value.location
                    
                    if value.translation == .zero {
                        lines.append(Line(points: [position], color: selectedColor))
                    } else {
                        guard let lastIndex = lines.indices.last else { return }
                        lines[lastIndex].points.append(position)
                    }
                })
            )
        }
//        .onChange(of: isSaveDrawing){
//            saveDrawing()
//        }
        .onChange(of: isRemoveDrawing){
            removeDrawing()
        }
//        .onChange(of: isLoadDrawing){
//            loadDrawing()
//        }
        
    }
    
//    func saveDrawing() {
//        let encoder = JSONEncoder()
//        do {
//            let data = try encoder.encode(lines)
//            savedDrawing = data
//        } catch {
//            print("Failed to save drawing: \(error)")
//        }
//    }
//    
//    func loadDrawing() {
//        guard let data = savedDrawing else { return }
//        
//        let decoder = JSONDecoder()
//        do {
//            lines = try decoder.decode([Line].self, from: data)
//        } catch {
//            print("Failed to load drawing: \(error)")
//        }
//    }
    
    func removeDrawing() {
        lines.removeAll()
        savedDrawing = nil
        isRemoveDrawing = false;
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CanvasDrawing(savedDrawing: .constant(nil))
//    }
//}
