{ config, ... }:

{
  home = {
    file = {
      ".config/swaync/config.json" = {
        text = ''
          {
            "$schema": "/home/Jerry/.config/swaync/configSchema.json",
            "positionX": "right",
            "positionY": "top",
            "layer": "overlay",
            "control-center-layer": "top",
            "layer-shell": true,
            "cssPriority": "application",
            "control-center-margin-top": 0,
            "control-center-margin-bottom": 0,
            "control-center-margin-left": 0,
            "control-center-margin-right": 0,
            "notification-2fa-action": true,
            "notification-inline-replies": false,
            "notification-icon-size": 64,
            "notification-body-image-height": 100,
            "notification-body-image-width": 200,
            "timeout": 10,
            "timeout-low": 5,
            "timeout-critical": 0,
            "fit-to-screen": true,
            "control-center-width": 500,
            "control-center-height": 600,
            "notification-window-width": 500,
            "keyboard-shortcuts": true,
            "image-visibility": "when-available",
            "transition-time": 200,
            "hide-on-clear": false,
            "hide-on-action": true,
            "script-fail-notify": true,
            "notification-visibility": {
              "example-name": {
                "state": "muted",
                "urgency": "Low",
                "app-name:" "Spotify"
              }
            },
            "widgets": [
              "inhibitors",
              "title",
              "dnd",
              "notifications"
            ],
            "widget-config": {
              "inhibitors": {
                "text": "Notifications",
                "button-text": "Clear All",
                "clear-all-button": true
              },
              "title": {
                "text": "Notifications",
                "clear-all-button": true,
                "button-text": "Clear All"
              },
              "dnd": {
                "text": "Do Not Disturb"
              },
              "label": {
                "max-lines": 5,
                "text": "Label Text"
              },
              "mpris": {
                "image-size": 96,
                "image-radius": 12
              }
            }
          }
        '';
      };

      ".config/swaync/configSchema.json" = {
        text = ''
          {
            "$schema": "https://json-schema.org/draft/2020-12/schema",
            "title": "SwayNotificationCenter JSON schema",
            "type": "object",
            "additionalProperties": false,
            "properties": {
              "$schema": {
                "type": "string",
                "description": "Pointer to the schema against which this document should be validated."
              },
              "positionX": {
                "type": "string",
                "description": "Horizontal position of control center and notification window",
                "default": "right",
                "enum": ["right", "left", "center"]
              },
              "layer": {
                "type": "string",
                "description": "Layer of notification window",
                "default": "overlay",
                "enum": ["background", "bottom", "top", "overlay"]
              },
              "layer-shell": {
                "type": "boolean",
                "description": "Wether or not the windows should be opened as layer-shell surfaces. Note: Requires swaync restart to apply",
                "default": true
              },
              "cssPriority": {
                "type": "string",
                "description": "Which GTK priority to use when loading the default and user CSS files. Pick \"user\" to override XDG_CONFIG_HOME/gtk-3.0/gtk.css",
                "default": "application",
                "enum": ["application", "user"]
              },
              "positionY": {
                "type": "string",
                "description": "Vertical position of control center and notification window",
                "default": "top",
                "enum": ["top", "center", "bottom"]
              },
              "control-center-positionX": {
                "type": "string",
                "description": "Optional: Horizontal position of the control center. Supersedes positionX if not set to `none`",
                "default": "none",
                "enum": ["right", "left", "center", "none"]
              },
              "control-center-positionY": {
                "type": "string",
                "description": "Optional: Vertical position of the control center. Supersedes positionY if not set to `none`",
                "default": "none",
                "enum": ["top", "bottom", "none"]
              },
              "control-center-margin-top": {
                "type": "integer",
                "description": "The margin (in pixels) at the top of the control center. 0 to disable",
                "default": 0
              },
              "control-center-margin-bottom": {
                "type": "integer",
                "description": "The margin (in pixels) at the bottom of the control center. 0 to disable",
                "default": 0
              },
              "control-center-margin-right": {
                "type": "integer",
                "description": "The margin (in pixels) at the right of the control center. 0 to disable",
                "default": 0
              },
              "control-center-margin-left": {
                "type": "integer",
                "description": "The margin (in pixels) at the left of the control center. 0 to disable",
                "default": 0
              },
              "control-center-layer": {
                "type": "string",
                "description": "Layer of control center window",
                "default": "none",
                "enum": ["background", "bottom", "top", "overlay", "none"]
              },
              "notification-2fa-action": {
                "type": "boolean",
                "description": "If each notification should display a 'COPY \"1234\"' action",
                "default": true
              },
              "notification-inline-replies": {
                "type": "boolean",
                "description": "If notifications should display a text field to reply if the sender requests it. NOTE: Replying in popup notifications is only available if the compositor supports GTK Layer-Shell ON_DEMAND keyboard interactivity.",
                "default": false
              },
              "notification-icon-size": {
                "type": "integer",
                "description": "The notification icon size (in pixels)",
                "default": 64,
                "minimum": 16
              },
              "notification-body-image-height": {
                "type": "integer",
                "description": "The notification body image height (in pixels)",
                "default": 100,
                "minimum": 100
              },
              "notification-body-image-width": {
                "type": "integer",
                "description": "The notification body image width (in pixels)",
                "default": 200,
                "minimum": 200
              },
              "timeout": {
                "type": "integer",
                "description": "The notification timeout for notifications with normal priority",
                "default": 10
              },
              "timeout-low": {
                "type": "integer",
                "description": "The notification timeout for notifications with low priority",
                "default": 5
              },
              "timeout-critical": {
                "type": "integer",
                "description": "The notification timeout for notifications with critical priority. 0 to disable",
                "default": 0
              },
              "notification-window-width": {
                "type": "integer",
                "description": "Width of the notification in pixels",
                "default": 500
              },
              "fit-to-screen": {
                "type": "boolean",
                "description": "If the control center should expand to both edges of the screen",
                "default": true
              },
              "control-center-height": {
                "type": "integer",
                "description": "Height of the control center in pixels. Ignored when 'fit-to-screen' is set to 'true'",
                "default": 600,
                "minimum": 300
              },
              "control-center-width": {
                "type": "integer",
                "description": "Width of the control center in pixels",
                "default": 500,
                "minimum": 300
              },
              "keyboard-shortcuts": {
                "type": "boolean",
                "description": "If control center should use keyboard shortcuts",
                "default": true
              },
              "image-visibility": {
                "type": "string",
                "description": "An explanation about the purpose of this instance.",
                "default": "when-available",
                "enum": ["always", "when-available", "never"]
              },
              "transition-time": {
                "type": "integer",
                "description": "The notification animation duration. 0 to disable",
                "default": 200
              },
              "hide-on-clear": {
                "type": "boolean",
                "description": "Hides the control center after pressing \"Clear All\"",
                "default": false
              },
              "hide-on-action": {
                "type": "boolean",
                "description": "Hides the control center when clicking on notification action",
                "default": true
              },
              "script-fail-notify": {
                "type": "boolean",
                "description": "Sends a notification if a script fails to run",
                "default": true
              },
              "scripts": {
                "type": "object",
                "description": "Which scripts to check and potentially run for every notification. If the notification doesn't include one of the properties, that property will be ignored. All properties (except for exec) use regex. If all properties match the given notification, the script will be run. Only the first matching script will be run.",
                "minProperties": 1,
                "additionalProperties": false,
                "patternProperties": {
                  "^.{1,}$": {
                    "type": "object",
                    "description": "Your script object.",
                    "required": ["exec"],
                    "minProperties": 2,
                    "additionalProperties": false,
                    "properties": {
                      "exec": {
                        "type": "string",
                        "description": "The script to run. Can also run regular shell commands."
                      },
                      "app-name": {
                        "type": "string",
                        "description": "The app-name. Uses Regex."
                      },
                      "desktop-entry": {
                        "type": "string",
                        "description": "The desktop-entry. Uses Regex."
                      },
                      "summary": {
                        "type": "string",
                        "description": "The summary of the notification. Uses Regex."
                      },
                      "body": {
                        "type": "string",
                        "description": "The body of the notification. Uses Regex."
                      },
                      "urgency": {
                        "type": "string",
                        "description": "The urgency of the notification.",
                        "default": "Normal",
                        "enum": ["Low", "Normal", "Critical"]
                      },
                      "category": {
                        "type": "string",
                        "description": "Which category the notification belongs to. Uses Regex."
                      },
                      "run-on": {
                        "type": "string",
                        "description": "Whether to run the script on an action being activated, or when the notification is received.",
                        "enum": ["action", "receive"],
                        "default": "receive"
                      }
                    }
                  }
                }
              },
              "notification-visibility": {
                "type": "object",
                "description": "Set the visibility of each incoming notification. If the notification doesn't include one of the properties, that property will be ignored. All properties (except for state) use regex. If all properties match the given notification, the notification will be follow the provided state. Only the first matching object will be used.",
                "minProperties": 1,
                "additionalProperties": false,
                "patternProperties": {
                  "^.{1,}$": {
                    "type": "object",
                    "description": "Your script object.",
                    "required": ["state"],
                    "minProperties": 2,
                    "additionalProperties": false,
                    "properties": {
                      "state": {
                        "type": "string",
                        "description": "The notification visibility state.",
                        "default": "enabled",
                        "enum": ["ignored", "muted", "enabled", "transient"]
                      },
                      "app-name": {
                        "type": "string",
                        "description": "The app-name. Uses Regex."
                      },
                      "desktop-entry": {
                        "type": "string",
                        "description": "The desktop-entry. Uses Regex."
                      },
                      "summary": {
                        "type": "string",
                        "description": "The summary of the notification. Uses Regex."
                      },
                      "body": {
                        "type": "string",
                        "description": "The body of the notification. Uses Regex."
                      },
                      "urgency": {
                        "type": "string",
                        "description": "The urgency of the notification.",
                        "default": "Normal",
                        "enum": ["Low", "Normal", "Critical"]
                      },
                      "override-urgency": {
                        "type": "string",
                        "description": "The new urgency of the notification (optional)",
                        "default": "unset",
                        "enum": ["unset", "low", "normal", "critical"]
                      },
                      "category": {
                        "type": "string",
                        "description": "Which category the notification belongs to. Uses Regex."
                      }
                    }
                  }
                }
              },
              "widgets": {
                "type": "array",
                "description": "Which order and which widgets to display. If the \"notifications\" widget isn't specified, it will be placed at the bottom.",
                "default": ["inhibitors", "title", "dnd", "notifications"],
                "items": {
                  "type": "string",
                  // Sadly can't use regex and enums at the same time. Fix in the future?
                  "pattern": "^[a-zA-Z0-9_-]{1,}(#[a-zA-Z0-9_-]{1,}){0,1}?$"
                }
              },
              "widget-config": {
                "type": "object",
                "description": "Configure specific widget properties.",
                "additionalProperties": false,
                "patternProperties": {
                  // New widgets go here
                  "^title(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
                    // References the widget structure from "widgets" below
                    "$ref": "#/widgets/title"
                  },
                  "^dnd(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
                    "$ref": "#/widgets/dnd"
                  },
                  "^label(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
                    "$ref": "#/widgets/label"
                  },
                  "^mpris(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
                    "$ref": "#/widgets/mpris"
                  },
                  "^buttons-grid(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
                    "$ref": "#/widgets/buttons-grid"
                  },
                  "^menubar(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
                    "$ref": "#/widgets/menubar"
                  },
                  "^volume(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
                    "$ref": "#/widgets/volume"
                  },
                  "^backlight(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
                    "$ref": "#/widgets/backlight"
                  },
                  "^inhibitors(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
                    // References the widget structure from "widgets" below
                    "$ref": "#/widgets/inhibitors"
                  }
                }
              }
            },
            "widgets": {
              // New widgets go here
              "title": {
                "type": "object",
                "description": "Control Center Title Widget",
                "additionalProperties": false,
                "properties": {
                  "text": {
                    "type": "string",
                    "description": "The title of the widget",
                    "default": "Notifications"
                  },
                  "clear-all-button": {
                    "type": "boolean",
                    "description": "Wether to display a \"Clear All\" button",
                    "default": true
                  },
                  "button-text": {
                    "type": "string",
                    "description": "\"Clear All\" button text",
                    "default": "Clear All"
                  }
                }
              },
              "dnd": {
                "type": "object",
                "description": "Control Center Do Not Disturb Widget",
                "additionalProperties": false,
                "properties": {
                  "text": {
                    "type": "string",
                    "description": "The title of the widget",
                    "default": "Do Not Disturb"
                  }
                }
              },
              "label": {
                "type": "object",
                "description": "A generic widget that allows the user to add custom text",
                "additionalProperties": false,
                "properties": {
                  "text": {
                    "type": "string",
                    "description": "The text content of the widget",
                    "default": "Label Text"
                  },
                  "max-lines": {
                    "type": "integer",
                    "description": "The maximum lines",
                    "default": 5
                  }
                }
              },
              "mpris": {
                "type": "object",
                "description": "A widget that displays multiple music players",
                "additionalProperties": false,
                "properties": {
                  "image-size": {
                    "type": "integer",
                    "description": "The size of the album art",
                    "default": 96
                  },
                  "image-radius": {
                    "type": "integer",
                    "description": "The border radius of the album art",
                    "default": 12
                  }
                }
              },
              "buttons-grid": {
                "type": "object",
                "description": "A widget to add a grid of buttons that execute shell commands",
                "additionalProperties": false,
                "properties": {
                  "actions": {
                    "type": "array",
                    "description": "A list of actions containing a label and a command",
                    "items": {
                      "type": "object",
                      "properties": {
                        "label": {
                          "type": "string",
                          "description": "Text to be displayed in button",
                          "default": "label"
                        },
                        "command": {
                          "type": "string",
                          "description": "Command to be executed on click",
                          "default": ""
                        }
                      }
                    }
                  }
                }
              },
              "menubar": {
                "type": "object",
                "description": "A bar that contains action-buttons and buttons to open a dropdown with action-buttons",
                "additionalProperties": false,
                "patternProperties": {
                  "^menu(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
                    "type": "object",
                    "description": "A button that opens a dropdown with action-buttons",
                    "additionalProperties": false,
                    "properties": {
                      "label": {
                        "type": "string",
                        "description": "Text to be displayed in button",
                        "default": "Menu"
                      },
                      "position": {
                        "type": "string",
                        "description": "Horizontal position of the button in the bar",
                        "default": "right",
                        "enum": ["right", "left"]
                      },
                      "animation-type": {
                        "type": "string",
                        "default": "slide_down",
                        "description": "Animation type for menu",
                        "enum": ["slide_down", "slide_up", "none"]
                      },
                      "animation-duration":{
                        "type": "integer",
                        "default": 250,
                        "description": "Duration of animation in milliseconds"
                      },
                      "actions": {
                        "$ref" : "#/widgets/buttons-grid/properties/actions"
                      }
                    }
                  },
                  "^buttons(#[a-zA-Z0-9_-]{1,}){0,1}?$": {
                    "type": "object",
                    "description": "A list of action-buttons to be displayed in the topbar",
                    "additionalProperties": false,
                    "properties": {
                      "position": {
                        "type": "string",
                        "description": "Horizontal position of the button in the bar",
                        "default": "right",
                        "enum": ["right", "left"]
                      },
                      "actions": {
                        "$ref" : "#/widgets/buttons-grid/properties/actions"
                      }
                    }
                  }
                }
              },
              "volume": {
                "type": "object",
                "description": "Slider to control pulse volume",
                "additionalProperties": false,
                "properties": {
                  "label": {
                    "type": "string",
                    "description": "Text displayed in front of the volume slider",
                    "default": "Volume"
                  },
                  "show-per-app": {
                    "type": "boolean",
                    "default": false,
                    "description": "Show per app volume control"
                  },
                  "empty-list-label": {
                    "type": "string",
                    "default": "No active sink input",
                    "description": "Text displayed when there are not active sink inputs"
                  },
                  "expand-button-label": {
                    "type": "string",
                    "default": "⇧",
                    "description": "Label displayed on button to show per app volume control"
                  },
                  "collapse-button-label": {
                    "type": "string",
                    "default": "⇩",
                    "description": "Label displayed on button to hide per app volume control"
                  },
                  "icon-size": {
                    "type": "integer",
                    "default": 24,
                    "description": "Size of the application icon in per app volume control"
                  },
                  "animation-type": {
                    "type": "string",
                    "default": "slide_down",
                    "description": "Animation type for menu",
                    "enum": ["slide_down", "slide_up", "none"]
                  },
                  "animation-duration":{
                    "type": "integer",
                    "default": 250,
                    "description": "Duration of animation in milliseconds"
                  }
                }
              },
              "backlight": {
                "type": "object",
                "description": "Slider to control monitor brightness",
                "additionalProperties": false,
                "properties": {
                  "label": {
                    "type": "string",
                    "description": "Text displayed in front of the backlight slider",
                    "default": "Brightness"
                  },
                  "device": {
                    "type": "string",
                    "description": "Name of monitor (find possible devices using `ls /sys/class/backlight` or `ls /sys/class/leds`)",
                    "default": "intel_backlight"
                  },
                  "subsystem": {
                    "type": "string",
                    "description": "Kernel subsystem for brightness control",
                    "default": "backlight",
                    "enum": ["backlight", "leds"]
                  },
                  "min": {
                    "type": "integer",
                    "default": 0,
                    "description": "Lowest possible value for brightness"
                  }
                }
              },
              "inhibitors": {
                "type": "object",
                "description": "Control Center Inhibitors Widget",
                "additionalProperties": false,
                "properties": {
                  "text": {
                    "type": "string",
                    "description": "The title of the widget",
                    "default": "Inhibitors"
                  },
                  "clear-all-button": {
                    "type": "boolean",
                    "description": "Wether to display a \"Clear All\" button",
                    "default": true
                  },
                  "button-text": {
                    "type": "string",
                    "description": "\"Clear All\" button text",
                    "default": "Clear All"
                  }
                }
              }
            }
          }
        '';
      };

      ".config/swaync/style.css" = {
        text = ''
           /*
           * vim: ft=less
           */

           @define-color cc-bg rgba(0, 0, 0, 0.7);

           @define-color noti-border-color rgba(255, 255, 255, 0.15);
           @define-color noti-bg rgb(48, 48, 48);
           @define-color noti-bg-darker rgb(38, 38, 38);
           @define-color noti-bg-hover rgb(56, 56, 56);
           @define-color noti-bg-focus rgba(68, 68, 68, 0.6);
           @define-color noti-close-bg rgba(255, 255, 255, 0.1);
           @define-color noti-close-bg-hover rgba(255, 255, 255, 0.15);
           
           @define-color text-color rgb(255, 255, 255);
           @define-color text-color-disabled rgb(150, 150, 150);
           
           @define-color bg-selected rgb(0, 128, 255);
           
           .notification-row {
             outline: none;
           }
           
           .notification-row:focus,
           .notification-row:hover {
             background: @noti-bg-focus;
           }
           
           .notification {
             border-radius: 12px;
             margin: 6px 12px;
             box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 3px 1px rgba(0, 0, 0, 0.7),
               0 2px 6px 2px rgba(0, 0, 0, 0.3);
             padding: 0;
           }
           
           /* Uncomment to enable specific urgency colors
           .low {
             background: yellow;
             padding: 6px;
             border-radius: 12px;
           }
           
           .normal {
             background: green;
             padding: 6px;
             border-radius: 12px;
           }
           
           .critical {
             background: red;
             padding: 6px;
             border-radius: 12px;
           }
           */
           
           .notification-content {
             background: transparent;
             padding: 6px;
             border-radius: 12px;
           }
           
           .close-button {
             background: @noti-close-bg;
             color: @text-color;
             text-shadow: none;
             padding: 0;
             border-radius: 100%;
             margin-top: 10px;
             margin-right: 16px;
             box-shadow: none;
             border: none;
             min-width: 24px;
             min-height: 24px;
           }
           
           .close-button:hover {
             box-shadow: none;
             background: @noti-close-bg-hover;
             transition: all 0.15s ease-in-out;
             border: none;
           }
           
           .notification-default-action,
           .notification-action {
             padding: 4px;
             margin: 0;
             box-shadow: none;
             background: @noti-bg;
             border: 1px solid @noti-border-color;
             color: @text-color;
             transition: all 0.15s ease-in-out;
           }
           
           .notification-default-action:hover,
           .notification-action:hover {
             -gtk-icon-effect: none;
             background: @noti-bg-hover;
           }
           
           .notification-default-action {
             border-radius: 12px;
           }
           
           /* When alternative actions are visible */
           .notification-default-action:not(:only-child) {
             border-bottom-left-radius: 0px;
             border-bottom-right-radius: 0px;
           }
           
           .notification-action {
             border-radius: 0px;
             border-top: none;
             border-right: none;
           }
           
           /* add bottom border radius to eliminate clipping */
           .notification-action:first-child {
             border-bottom-left-radius: 10px;
           }
           
           .notification-action:last-child {
             border-bottom-right-radius: 10px;
             border-right: 1px solid @noti-border-color;
           }
           
           .inline-reply {
             margin-top: 8px;
           }
           .inline-reply-entry {
             background: @noti-bg-darker;
             color: @text-color;
             caret-color: @text-color;
             border: 1px solid @noti-border-color;
             border-radius: 12px;
           }
           .inline-reply-button {
             margin-left: 4px;
             background: @noti-bg;
             border: 1px solid @noti-border-color;
             border-radius: 12px;
             color: @text-color;
           }
           .inline-reply-button:disabled {
             background: initial;
             color: @text-color-disabled;
             border: 1px solid transparent;
           }
           .inline-reply-button:hover {
             background: @noti-bg-hover;
           }
           
           .image {
           }
           
           .body-image {
             margin-top: 6px;
             background-color: white;
             border-radius: 12px;
           }
           
           .summary {
             font-size: 16px;
             font-weight: bold;
             background: transparent;
             color: @text-color;
             text-shadow: none;
           }
           
           .time {
             font-size: 16px;
             font-weight: bold;
             background: transparent;
             color: @text-color;
             text-shadow: none;
             margin-right: 18px;
           }
           
           .body {
             font-size: 15px;
             font-weight: normal;
             background: transparent;
             color: @text-color;
             text-shadow: none;
           }
           
           .control-center {
             background: @cc-bg;
           }
           
           .control-center-list {
             background: transparent;
           }
           
           .control-center-list-placeholder {
             opacity: 0.5;
           }
           
           .floating-notifications {
             background: transparent;
           }
           
           /* Window behind control center and on all other monitors */
           .blank-window {
             background: alpha(black, 0.25);
           }
           
           /*** Widgets ***/
           
           /* Title widget */
           .widget-title {
             margin: 8px;
             font-size: 1.5rem;
           }
           .widget-title > button {
             font-size: initial;
             color: @text-color;
             text-shadow: none;
             background: @noti-bg;
             border: 1px solid @noti-border-color;
             box-shadow: none;
             border-radius: 12px;
           }
           .widget-title > button:hover {
             background: @noti-bg-hover;
           }
           
           /* DND widget */
           .widget-dnd {
             margin: 8px;
             font-size: 1.1rem;
           }
           .widget-dnd > switch {
             font-size: initial;
             border-radius: 12px;
             background: @noti-bg;
             border: 1px solid @noti-border-color;
             box-shadow: none;
           }
           .widget-dnd > switch:checked {
             background: @bg-selected;
           }
           .widget-dnd > switch slider {
             background: @noti-bg-hover;
             border-radius: 12px;
           }
           
           /* Label widget */
           .widget-label {
             margin: 8px;
           }
           .widget-label > label {
             font-size: 1.1rem;
           }
           
           /* Mpris widget */
           .widget-mpris {
             /* The parent to all players */
           }
           .widget-mpris-player {
             padding: 8px;
             margin: 8px;
           }
           .widget-mpris-title {
             font-weight: bold;
             font-size: 1.25rem;
           }
           .widget-mpris-subtitle {
             font-size: 1.1rem;
           }
           
           /* Buttons widget */
           .widget-buttons-grid {
             padding: 8px;
             margin: 8px;
             border-radius: 12px;
             background-color: @noti-bg;
           }
           
           .widget-buttons-grid>flowbox>flowboxchild>button{
             background: @noti-bg;
             border-radius: 12px;
           }
           
           .widget-buttons-grid>flowbox>flowboxchild>button:hover {
             background: @noti-bg-hover;
           }
           
           /* Menubar widget */
           .widget-menubar>box>.menu-button-bar>button {
             border: none;
             background: transparent;
           }
           
           /* .AnyName { Name defined in config after #
             background-color: @noti-bg;
             padding: 8px;
             margin: 8px;
             border-radius: 12px;
           }
           
           .AnyName>button {
             background: transparent;
             border: none;
           }
           
           .AnyName>button:hover {
             background-color: @noti-bg-hover;
           } */
           
           .topbar-buttons>button { /* Name defined in config after # */
             border: none;
             background: transparent;
           }
           
           /* Volume widget */
           
           .widget-volume {
             background-color: @noti-bg;
             padding: 8px;
             margin: 8px;
             border-radius: 12px;
           }
           
           .widget-volume>box>button {
             background: transparent;
             border: none;
           }
           
           .per-app-volume {
             background-color: @noti-bg-alt;
             padding: 4px 8px 8px 8px;
             margin: 0px 8px 8px 8px;
             border-radius: 12px
           }
           
           /* Backlight widget */
           .widget-backlight {
             background-color: @noti-bg;
             padding: 8px;
             margin: 8px;
             border-radius: 12px;
           }
           
           /* Title widget */
           .widget-inhibitors {
             margin: 8px;
             font-size: 1.5rem;
           }
           .widget-inhibitors > button {
             font-size: initial;
             color: @text-color;
             text-shadow: none;
             background: @noti-bg;
             border: 1px solid @noti-border-color;
             box-shadow: none;
             border-radius: 12px;
           }
           .widget-inhibitors > button:hover {
             background: @noti-bg-hover;
           }
        '';
      };
    };
  };
}
