import HaCTML
import Foundation

struct ImageHero: Nodeable {
  let background: BackgroundType
  let imagePath: String
  let alternateText: String
  let destinationURL: String?
  let dateToDisplay: Date?
  let textShade: TextShade

  init(
    background: BackgroundType,
    imagePath: String,
    alternateText: String,
    destinationURL: String? = nil,
    textShade: TextShade = .light,
    dateToDisplay: Date? = nil
  ) {
    self.background = background
    self.imagePath = imagePath
    self.alternateText = alternateText
    self.destinationURL = destinationURL
    self.dateToDisplay = dateToDisplay
    self.textShade = textShade
  }

  var node: Node {
    return blockElement[Attr.style => backgroundStyle].containing(
      El.Div[Attr.className => "ImageHero__image", Attr.style => ["background-image": "url('\(imagePath)')"]],
      El.Div[Attr.className => "Text--screenReader"].containing(alternateText),
      dateBlock
    )
  }

  enum BackgroundType {
    case image(String)
    case color(String)
  }

  enum TextShade {
    case dark
    case light
  }

  private var dateBlock: Node? {
    return formattedDate?.containedBy(element: El.Div[Attr.className => "ImageHero__date"])
  }

  private var formattedDate: String? {
    return dateToDisplay.map(Dates.individualDayFormatter.string)
  }

  private var textShadeClass: String {
    switch (textShade) {
      case .light:
        return "ImageHero--text-light"
      case .dark:
        return "ImageHero--text-dark"
    }
  }

  private var blockElement: HTMLElement {
    let className = "ImageHero \(textShadeClass)"

    if let destinationURL = self.destinationURL {
      return El.A[Attr.className => "\(className) ImageHero--linkable", Attr.href => destinationURL, Attr.target => "_blank"]
    }

    return El.Div[Attr.className => className]
  }

  private var backgroundStyle: [String: String] {
    switch (background) {
    case .image(let path):
      return ["background-image": "url('\(path)')"]
    case .color(let color):
      return ["background-color": color]
    }
  }
}