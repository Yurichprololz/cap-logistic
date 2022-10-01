using LogicticService as service from '../../srv/service';

annotate service.Car with @(
    UI        : {
        SelectionFields     : [number],
        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Value             : brand,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : number,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : driver_ID,
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
            Property   : number,
            Descending : false
        }]},
    },
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Car',
            TypeNamePlural : 'Cars',
            Title          : {Value : brand},
            Description    : {Value : number}
        },
        HeaderFacets                   : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description        : {Data : [{
            $Type       : 'UI.DataField',
            Value       : status_ID,
            Criticality : status.criticality
        }, ]},
        FieldGroup #Details            : {Data : [
            {
                $Type : 'UI.DataField',
                Value : brand,
            },
            {
                $Type : 'UI.DataField',
                Value : number,
            },
            {
                $Type : 'UI.DataField',
                Value : driver_ID,
            },
            {
                $Type       : 'UI.DataField',
                Value       : status_ID,
                Criticality : status.criticality,
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
            Label  : '{i18n>carInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>carInfo}',
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
            },

            ]
        }
    ]
);

using from './labels';
using from './capabilities';
using from './field-control';
using from './value-helps';

