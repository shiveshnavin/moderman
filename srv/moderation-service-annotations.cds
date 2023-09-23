using ModerationService from './moderation-service';


annotate ModerationService.ContentItem with {
    ID                @title           : 'ID'          @Core.Computed;
    ownerApp          @title           : 'Owner App';
    contentText       @title           : 'Content Text';
    mediaType         @title           : 'Media Type'  @(Common: {
        Text           : mediaType,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'Action Type Help',
            CollectionPath: 'MediaType',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: mediaType,
                ValueListProperty: 'mediaTypeName'
            }]
        }
    });
    intentName        @title           : 'Intent';
    intentDescription @title           : 'Description';
    targetActionDate  @title           : 'Target Action Date';
    contentUrl        @UI.IsImageURL   : true
                      @ImageType.Height: 100
                      @ImageType.Width : 100;
}

annotate ModerationService.ContentItemAction with {
    ID                  @title: 'ID'           @Core.Computed;
    actionName          @title: 'Action name';
    ownerApp            @title: 'Owner App';
    actionDescription   @title: 'Action Description';
    actionType
                        @title: 'Action Type'  @(Common: {
        Text     : actionType, // TextArrangement: #TextOnly,
        ValueList: {
            Label         : 'Action Type Help',
            CollectionPath: 'ActionType',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: actionType,
                ValueListProperty: 'actionTypeName'
            }]
        }
    });
    actionStatus        @title: 'Action Status';
    actionCompletedDate @title: 'Action Taken Date';
}


annotate ModerationService.ContentItem with @(UI: {
    HeaderInfo      : {
        TypeName      : 'Content',
        Title         : {Value: intentName},
        TypeNamePlural: 'Contents'
    },
    SelectionFields : [
        ID,
        intentName,
        mediaType,
        ownerApp,
        targetActionDate
    ],
    LineItem        : [
        {Value: ownerApp},
        {Value: intentName},
        {Value: intentDescription},
        {Value: contentUrl},
        {Value: contentText},
        {Value: mediaType},
        {Value: targetActionDate}
    ],

    Facets          : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Content Item Actions',
        Target: 'contentItemActions/@UI.LineItem'
    }],
    FieldGroup #Main: {Data: [
        {Value: intentDescription},
        {Value: mediaType},
        {Value: ownerApp},
        {Value: targetActionDate}
    ]},
    HeaderFacets    : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Content Item Data',
        Target: '@UI.FieldGroup#Main'
    }]
});


annotate ModerationService.ContentItemAction with @(UI: {
    HeaderInfo      : {
        TypeName      : '{i18n>ContentItemAction}',
        TypeNamePlural: '{i18n>ContentItemActions}'
    },
    SelectionFields : [
        actionName,
        ownerApp
    ],
    LineItem        : [
        {Value: actionName},
        {Value: actionDescription},
        {Value: ownerApp},
        {Value: actionType},
        {Value: actionStatus},
    ],
    Facets          : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>ContentItemActionData}',
        Target: '@UI.FieldGroup#Main'
    }],

    FieldGroup #Main: {Data: [
        {Value: actionName},
        {Value: actionDescription},
        {Value: ownerApp},
        {Value: actionType},
        {Value: actionStatus},
    ]}
});
