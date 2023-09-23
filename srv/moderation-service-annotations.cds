using ModerationService from './moderation-service';


annotate ModerationService.ContentItem with {
    ID               @title: 'ID'  @Core.Computed;
    ownerApp         @title: 'Owner App';
    mediaType        @title: 'Media Type';
    intentName       @title: 'Intent';
    targetActionDate @title: 'Target Action Date';
}

annotate ModerationService.ContentItemAction with {
    ID                  @title: 'ID'  @Core.Computed;
    actionName          @title: 'Action name';
    ownerApp            @title: 'Owner App';
    actionType          @title: 'Media Type';
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
        {Value: intentName},
        {Value: ownerApp},
        {Value: mediaType},
        {Value: targetActionDate}
    ],

    Facets          : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Content Item Actions',
        Target: 'contentItemActions/@UI.LineItem'
    }],
    FieldGroup #Main: {Data: [
        {Value: intentName},
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
        {Value: ownerApp},
        {Value: actionType},
        {Value: actionStatus},
    ]}
});
