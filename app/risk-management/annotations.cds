using RiskService as service from '../../srv/risk-service';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio_code',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PrioCriticality',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Subsections',
            ID : 'Subsections',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Risk Details',
                    ID : 'RiskDetails',
                    Target : '@UI.FieldGroup#RiskDetails1',
                },],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Mitigation Overview',
            ID : 'MitigationDetails',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Mitigation Details',
                    ID : 'MitigationDetails1',
                    Target : '@UI.FieldGroup#MitigationDetails',
                },],
        },],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : 'Mitigation',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Owner',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Priority',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : 'descr',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Impact',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact',
            Label : 'Business Partner',
        },
    ],
);

annotate service.Risks with {
    miti @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'owner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'timeline',
            },
        ],
        Label : 'Mitigation',
    }
};

annotate service.Risks with @(
    UI.SelectionFields : [
        prio_code,
    ]
);
annotate service.Risks with {
    prio @Common.Label : 'Priority'
};
annotate service.Risks with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        TypeImageUrl : 'sap-icon://alert',
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
    }
);
annotate service.Risks with @(
    UI.FieldGroup #RiskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Risks with @(
    UI.FieldGroup #RiskDetails1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'title',
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
                Label : 'Owner',
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
                Label : 'Description',
            },
            {
                $Type : 'UI.DataField',
                Value : prio_code,
                Label : '{i18n>Priority}',
                Criticality : PrioCriticality,
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impact}',
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'bp/@Communication.Contact#contact1',
                Label : '{i18n>BusinessPartner}',
            },],
    }
);
annotate service.Risks with @(
    UI.FieldGroup #MitigationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti_ID,
                Label : '{i18n>Mitigation}',
            },{
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : 'Owner',
            },{
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : 'Timeline',
            },],
    }
);
annotate service.Risks with {
    miti @Common.Text : {
            $value : miti.descr,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Risks with {
    miti @Common.ValueListWithFixedValues : true
};
annotate service.Mitigations with {
    ID @Common.Text : descr
};
annotate service.Mitigations with {
    owner @Common.FieldControl : #ReadOnly
};
annotate service.Mitigations with {
    timeline @Common.FieldControl : #ReadOnly
};
annotate service.Risks with {
    prio @Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.BusinessPartners with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
annotate service.BusinessPartners with @(
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
