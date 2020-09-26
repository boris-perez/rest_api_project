Feature: Project
  Scenario: As a user I want to create a project so that organize my task

    Given I have authentication to todo.ly
    # consumiendo el request
    When  I send POST request 'api/projects.json' with json
    """
    {
    "Content":"CUCUMBER",
    "Icon":5
     }
    """
    # verificar el response

    Then I expect the response code 200
    And I expect the response body is equal

     """
    {
        "Id": "EXCLUDE",
        "Content": "UCB2",
        "ItemsCount": 0,
        "Icon": 4,
        "ItemType": 2,
        "ParentId": null,
        "Collapsed": false,
        "ItemOrder": "EXCLUDE",
        "Children": [],
        "IsProjectShared": false,
        "ProjectShareOwnerName": null,
        "ProjectShareOwnerEmail": null,
        "IsShareApproved": false,
        "IsOwnProject": true,
        "LastSyncedDateTime": "EXCLUDE",
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": false,
        "SyncClientCreationId": null
    }
    """
