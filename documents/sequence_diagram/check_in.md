```mermaid
actor User
  User->>MyFridgeScreen: Opens
  MyFridgeScreen->>FridgeController: Select Add Food button
	FridgeController->>ItemScreen: Opens
	FridgeController->>Camera: getImage()
	Camera-->>FridgeController: Image
	User->>ItemScreen: InputInformation
	FridgeController->>ItemScreen: getInformation()
	ItemScreen-->>FridgeController: Information
	FridgeController->>FridgeDB: Query add Image and Information
```
