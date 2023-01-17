```mermaid
sequenceDiagram
    actor User
    participant ListItemScreen
    participant FridgeController
    participant FridgeDB

    User->>ListItemScreen: Opens
    ListItemScreen->>FridgeController: Select delete item
    FridgeController->>FridgeDB: Query delete select item
```