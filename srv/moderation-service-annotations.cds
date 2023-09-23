// using ModerationService from './moderation-service';

// annotate ModerationService.ContentItem with @odata.draft.enabled;

// annotate ModerationService.ContentItem with {
//     ID         @title: '{i18n>GUID}'  @Core.Computed;
//     ownerApp   @title: '{i18n>ownerApp}';
//     mediaType  @title: '{i18n>mediaType}';
//     intentName @title: '{i18n>intentName}';
//     Birthday   @title: '{i18n>Birthdate}';
// }


// annotate ModerationService.ContentItemAction with {
//     ID         @title: '{i18n>GUID}'  @Core.Computed;
//     ownerApp   @title: '{i18n>ownerApp}';
//     mediaType  @title: '{i18n>mediaType}';
//     intentName @title: '{i18n>intentName}';
//     Birthday   @title: '{i18n>Birthdate}';
// }

// annotate ModerationService.ContentItem with @(UI: {
//     HeaderInfo      : {
//         TypeName      : '{i18n>ContentItem}',
//         Title         : {Value: intentName},
//         TypeNamePlural: '{i18n>ContentItems}'
//     },
//     SelectionFields : [
//         mediaType,
//         intentName
//     ],
//     LineItem        : [
//         {Value: intentName},
//         {Value: ownerApp},
//         {Value: Birthday}
//     ],
//     Facets          : [{
//         $Type : 'UI.ReferenceFacet',
//         Label : '{i18n>ContentItemActions}',
//         Target: 'contentItemActions/@UI.LineItem'
//     }],
//     FieldGroup #Main: {Data: [
//         {Value: intentName},
//         {Value: mediaType},
//         {Value: ownerApp},
//         {Value: Birthday}
//     ]},
//     HeaderFacets    : [{
//         $Type : 'UI.ReferenceFacet',
//         Label : '{i18n>ContentItemData}',
//         Target: '@UI.FieldGroup#Main'
//     }]
// }, );

// annotate ModerationService.ContentItemAction with @(UI: {
//     HeaderInfo      : {
//         TypeName      : '{i18n>ContentItemAction}',
//         TypeNamePlural: '{i18n>ContentItemActions}'
//     },
//     SelectionFields : [
//         mediaType,
//         intentName
//     ],
//     LineItem        : [
//         {Value: intentName},
//         {Value: mediaType},
//         {Value: Birthday}
//     ],
//     Facets          : [{
//         $Type : 'UI.ReferenceFacet',
//         Label : '{i18n>ContentItemActionData}',
//         Target: '@UI.FieldGroup#Main'
//     }],
//     FieldGroup #Main: {Data: [
//         {Value: intentName},
//         {Value: mediaType},
//         {Value: Birthday}
//     ]}
// });
