/*
Input Mask plugin extentions
http://github.com/RobinHerbots/jquery.inputmask
Copyright (c) 2010 Robin Herbots
Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)

Optional extentions on the jquery.inputmask base
*/

$.extend($.inputmask.defaults.aliases, {
        'date': {
            "mask": "d/m/y"
        },
         'dd/mm/yyyy': {
            "mask": "d/m/y"
        },
		'd': { //day

"validator": "0[1-9]|[12][0-9]|3[01]",

"cardinality": 2,

"prevalidator": [{ "validator": "[0-3]", "cardinality": 1}]

},

'm': { //month

"validator": "0[1-9]|1[012]",

"cardinality": 2,

"prevalidator": [{ "validator": "[01]", "cardinality": 1}]

},

'y': { //year

"validator": "(19|20)\\d\\d",

"cardinality": 4,

"prevalidator": [

{ "validator": "[12]", "cardinality": 1 },

{ "validator": "(19|20)", "cardinality": 2 },

{ "validator": "(19|20)\\d", "cardinality": 3 }

]

}

});