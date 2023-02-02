```mermaid
classDiagram
	class Item {
		+GetName()
        +GetAmount()
        +GetNotes()
        +GetCategory()
        +GetLocation()
		-m_name: string
        -m_image: RawImage
		-m_category: Enum
        -m_location: Enum
		-m_amount: int
        -m_notes: string
  }