using ModerationService from './moderation-service';


annotate ModerationService.ContentItem with {
    ID               @title: 'ID'  @Core.Computed;
    ownerApp         @title: 'Owner App';
    mediaType        @title: 'Media Type';
    intentName       @title: 'Intent';
    targetActionDate @title: 'Target Action Date';
}


annotate ModerationService.ContentItem with @(UI: {
    SelectionFields: [
        ID,
        intentName,
        mediaType,
        ownerApp,
        targetActionDate
    ],
    LineItem       : [
        {Value: intentName},
        {Value: ownerApp},
        {Value: mediaType},
        {Value: targetActionDate}
    ]
});
