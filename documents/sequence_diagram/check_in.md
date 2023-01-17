```mermaid
sequenceDiagram
	actor User
  User->>MyFridgeScreen: Opens
  MyFridgeScreen->>FridgeController: Select Add Food button
	FridgeController->>ItemScreen: Opens
	FridgeController->>Camera: getImage()
	Camera-->>FridgeController: Image
	User->>ItemScreen: InputInformation
	ItemScreen->>FridgeDB: Query add Image and Information
```
