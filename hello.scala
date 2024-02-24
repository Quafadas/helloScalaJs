package webapp

import org.scalajs.dom
import org.scalajs.dom.document

@main
def main: Unit =
    appendParagraph(document.body, "Hello Scala.js!")

def appendParagraph(targetNode: dom.Node, text: String): Unit =
  val parNode = document.createElement("p")
  parNode.textContent = text
  targetNode.appendChild(parNode)


