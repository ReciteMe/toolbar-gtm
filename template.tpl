___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Recite Me Toolbar",
  "brand": {
    "id": "brand_dummy",
    "displayName": "",
    "categories": ["UTILITY"]
  },
  "description": "Adds the Recite Me Toolbar loading code onto your site.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "clientKey",
    "displayName": "Client Key",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const tagName = 'Recite Me Toolbar Loader';
const log = require('logToConsole');
if (!data.clientKey) {
  data.gtmOnFailure();
  return;
}

const queryPermission = require('queryPermission');
const injectScript = require('injectScript');
const setInWindow = require('setInWindow');
const scriptUrl = 'https://reciteme.com/gtm-script.js';

if (!queryPermission('access_globals', 'serviceKey')) {
  log(tagName + ' failed to load due to insufficient permissions.');
  data.gtmOnFailure();
}
setInWindow('serviceKey', data.clientKey, true);

const onSuccess = () => {
  log('Recite Me Toolbar Loader Ready! Client Key:', data.clientKey);
  data.gtmOnSuccess();
};

const onFailure = () => {
  log('Recite Me Toolbar Loader Failed! Client Key:', data.clientKey);
  data.gtmOnFailure();
};

if (queryPermission('inject_script', scriptUrl)) {
  injectScript(scriptUrl, onSuccess, onFailure, scriptUrl);
} else {
  log(tagName + ' failed to load due to insufficient permissions.');
  data.gtmOnFailure();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://reciteme.com/gtm-script.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "serviceKey"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Startup Test
  code: |-
    const mockData = {
      clientKey: "TEST KEY",
    };

    // Call Inject Script
    mock('injectScript', (url, onSuccess, onFailure) => {
      onSuccess();
    });

    // Call Template Script
    runCode(mockData);

    // Verify Success
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 13/08/2021, 16:01:01


