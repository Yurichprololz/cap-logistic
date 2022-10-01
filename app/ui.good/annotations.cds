using LogisticService as service from '../../srv/service';

annotate service.Good with @(
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
                Value             : price,
                ![@UI.Importance] : #High
            },
        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : price,
            Descending : false
        }]},
    },
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Good',
            TypeNamePlural : 'Goods',
            Title          : {Value : name},
        },
        HeaderFacets                   : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description        : {Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : price,
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
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'POAdmininfo',
        Label  : '{i18n>adminInfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>admininfo}',
            Target : '@UI.FieldGroup#AdministrativeData'
        },

        ]
    }]
);

using from './labels';
// using from './field-control';
