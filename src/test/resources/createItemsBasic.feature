Feature: Items

  @ItemsBasic
  Scenario: As a user I want to create a Item so that organize my task

    Given I have authentication to todo.ly
    # consumiendo el request
    When I send POST request 'api/items.json' with json and BASIC authentication
    """
    {
       "Content":"ITEM TESTING"
    }
    """

    # verificar el response

    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
      "Id": "EXCLUDE",
      "Content": "ITEM TESTING",
      "ItemType": 1,
      "Checked": false,
      "ProjectId": null,
      "ParentId": null,
      "Path": "",
      "Collapsed": false,
      "DateString": null,
      "DateStringPriority": 0,
      "DueDate": "",
      "Recurrence": null,
      "ItemOrder": null,
      "Priority": 4,
      "LastSyncedDateTime": "EXCLUDE",
      "Children": [],
      "DueDateTime": null,
      "CreatedDate": "EXCLUDE",
      "LastCheckedDate": null,
      "LastUpdatedDate": "EXCLUDE",
      "Deleted": false,
      "Notes": "",
      "InHistory": false,
      "SyncClientCreationId": null,
      "DueTimeSpecified": true,
      "OwnerId": 665838
    }
    """
    And I get the property value 'Id' and save on ID_ITEMS

    When I send PUT request 'api/items/ID_ITEMS.json' with json and BASIC authentication
    """
    {
      "Checked":true
    }
    """

    # verificar el response

    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
      "Id": ID_ITEMS,
      "Content": "ITEM TESTING",
      "ItemType": 1,
      "Checked": true,
      "ProjectId": null,
      "ParentId": null,
      "Path": "",
      "Collapsed": false,
      "DateString": null,
      "DateStringPriority": 0,
      "DueDate": "",
      "Recurrence": null,
      "ItemOrder": null,
      "Priority": 4,
      "LastSyncedDateTime": "EXCLUDE",
      "Children": [],
      "DueDateTime": null,
      "CreatedDate": "EXCLUDE",
      "LastCheckedDate": "EXCLUDE",
      "LastUpdatedDate": "EXCLUDE",
      "Deleted": false,
      "Notes": "",
      "InHistory": true,
      "SyncClientCreationId": null,
      "DueTimeSpecified": true,
      "OwnerId": 665838
    }
    """
    When I send DELETE request 'api/items/ID_ITEMS.json' with json and BASIC authentication
    """
    """
    Then I expected the response code 200


    When I send GET request 'api/items/ID_ITEMS.json' with json and BASIC authentication
    """
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
      {
        "Id": ID_ITEMS,
        "Content": "ITEM TESTING",
        "ItemType": 1,
        "Checked": true,
        "ProjectId": null,
        "ParentId": null,
        "Path": "",
        "Collapsed": false,
        "DateString": null,
        "DateStringPriority": 0,
        "DueDate": "",
        "Recurrence": null,
        "ItemOrder": null,
        "Priority": 4,
        "LastSyncedDateTime": "EXCLUDE",
        "Children": [],
        "DueDateTime": null,
        "CreatedDate": "EXCLUDE",
        "LastCheckedDate": "EXCLUDE",
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": true,
        "Notes": "",
        "InHistory": true,
        "SyncClientCreationId": null,
        "DueTimeSpecified": true,
        "OwnerId": 665838
    }
    """
