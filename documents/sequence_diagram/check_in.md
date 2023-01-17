```mermaid
sequenceDiagram
	actor User
  User->>MyFridgeScreen: Opens
  MyFridgeScreen->>FridgeController: Select Add Food button
	FridgeController->>Camera: getImage()
	Camera-->>FridgeController: Image
	FridgeController->>FridgeDB: Query add Image
	User->>ItemWindow: InputInformation
	ItemWindow->>FridgeDB: Query add information
```
