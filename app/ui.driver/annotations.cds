using LogisticService as service from '../../srv/service';

annotate service.Driver with @(
    UI        : {
        SelectionFields     : [name],
        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Value             : name,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : surname,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : age,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : status_ID,
                Criticality       : status.criticality,
                ![@UI.Importance] : #High
            },
        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : false
        }]},
    },
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Driver',
            TypeNamePlural : 'Drivers',
            Title          : {Value : name},
            Description    : {Value : surname}
        },
        HeaderFacets                   : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description        : {Data : [
            {
                $Type       : 'UI.DataField',
                Value       : status_ID,
                Criticality : status.criticality
            },
            {
                $Type : 'UI.DataField',
                Value : age
            },
        ]},
        FieldGroup #Details            : {Data : [
            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : surname
            },
            {
                $Type       : 'UI.DataField',
                Value       : status_ID,
                Criticality : status.criticality
            },
            {
                $Type : 'UI.DataField',
                Value : age
            },
        ]},
        FieldGroup #AdministrativeData : {Data : [
            {
                $Type : 'UI.DataField',
                Value : createdBy
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt
            }
        ]}
    },
    UI.Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'PODetails',
            Label  : '{i18n>driverInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>driverInfo}',
                Target : '@UI.FieldGroup#Details'
            }]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'POAdmininfo',
            Label  : '{i18n>adminInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>admininfo}',
                Target : '@UI.FieldGroup#AdministrativeData'
            }]
        }
    ]
);

using from './labels';
using from './capabilities';
using from './field-control';
