/**
* @name ShowAllActivities
* @displayName ShowAllActivities
* @authorId 415849376598982656
* @invite gvA2ree
*/
/*@cc_on
@if (@_jscript)
    
    // Offer to self-install for clueless users that try to run this directly.
    var shell = WScript.CreateObject("WScript.Shell");
    var fs = new ActiveXObject("Scripting.FileSystemObject");
    var pathPlugins = shell.ExpandEnvironmentStrings("%APPDATA%\BetterDiscord\plugins");
    var pathSelf = WScript.ScriptFullName;
    // Put the user at ease by addressing them in the first person
    shell.Popup("It looks like you've mistakenly tried to run me directly. \n(Don't do that!)", 0, "I'm a plugin for BetterDiscord", 0x30);
    if (fs.GetParentFolderName(pathSelf) === fs.GetAbsolutePathName(pathPlugins)) {
        shell.Popup("I'm in the correct folder already.", 0, "I'm already installed", 0x40);
    } else if (!fs.FolderExists(pathPlugins)) {
        shell.Popup("I can't find the BetterDiscord plugins folder.\nAre you sure it's even installed?", 0, "Can't install myself", 0x10);
    } else if (shell.Popup("Should I copy myself to BetterDiscord's plugins folder for you?", 0, "Do you need some help?", 0x34) === 6) {
        fs.CopyFile(pathSelf, fs.BuildPath(pathPlugins, fs.GetFileName(pathSelf)), true);
        // Show the user where to put plugins in the future
        shell.Exec("explorer " + pathPlugins);
        shell.Popup("I'm installed!", 0, "Successfully installed", 0x40);
    }
    WScript.Quit();

@else@*/

module.exports = (() => {
    const config = {
        info: {
            name: "ShowAllActivities",
            authors: [
                {
                    name: "Strencher",
                    discord_id: "415849376598982656",
                    github_username: "Strencher",
                    twitter_username: "Strencher3"
                }
            ],
            version: "0.0.2",
            description: "See every status a user has enabled. Original made by Juby210#0577.",
            github: "https://github.com/Strencher/BetterDiscordStuff/blob/master/ShowAllActivities/ShowAllActivities.plugin.js",
            github_raw: "https://raw.githubusercontent.com/Strencher/BetterDiscordStuff/master/ShowAllActivities/ShowAllActivities.plugin.js"
        },
        changelog: [
            {
                title: "Yeah",
                type: "added",
                items: ["The plugin exist"]
            }
        ]
    };

    return !global.ZeresPluginLibrary ? class {
        constructor() { this._config = config; }
        getName() { return config.info.name; }
        getAuthor() { return config.info.authors.map(a => a.name).join(", "); }
        getDescription() { return config.info.description; }
        getVersion() { return config.info.version; }
        load() {
            BdApi.showConfirmationModal("Library plugin is needed", 
                [`The library plugin needed for ${config.info.name} is missing. Please click Download Now to install it.`], {
                    confirmText: "Download",
                    cancelText: "Cancel",
                    onConfirm: () => {
                        require("request").get("https://rauenzi.github.io/BDPluginLibrary/release/0PluginLibrary.plugin.js", async (error, response, body) => {
                        if (error) return require("electron").shell.openExternal("https://betterdiscord.net/ghdl?url=https://raw.githubusercontent.com/rauenzi/BDPluginLibrary/master/release/0PluginLibrary.plugin.js");
                        await new Promise(r => require("fs").writeFile(require("path").join(BdApi.Plugins.folder, "0PluginLibrary.plugin.js"), body, r));
                        });
                    }
                });
        }
        start() { }
        stop() { }
    } : (([Plugin, Api]) => {
        const plugin = (Plugin, Api) => {

            const {WebpackModules, PluginUtilities, ReactComponents, Patcher, DiscordModules: {React, ButtonData}, Utilities} = Api;
            const classes = WebpackModules.getByProps('iconButtonSize');
            const ActivityStore = WebpackModules.getByProps('getActivities');
            const GameStore = WebpackModules.getByProps('getGame', 'getGameByName');
            const {TooltipContainer: Tooltip} = WebpackModules.getByProps('TooltipContainer');
            let fetchedModules = {};
            const Icon = props => {
                if(fetchedModules[props.name]) return React.createElement(fetchedModules[props.name].default, props);
                const module = WebpackModules.find(m => m.id && typeof m.keys === 'function' && m.keys().includes('./Activity'))('./' + props.name);
                fetchedModules[props.name] = module;
                return React.createElement(module.default, props);
            }
            const LabelStore = WebpackModules.getByProps('Messages', 'setLocale')
            const Button = WebpackModules.getByProps('DropdownSizes');
            var temp;
            const activitiesFilter = (item, index) => {
                if (index == 0) temp = []
                if (temp.includes(item.application_id || item.name)) return false
                temp.push(item.application_id || item.name)
                return item.type != 4
            }
            return class ShowAllActivities extends Plugin {
                constructor() {
                    super();
                }

                get css() {
                    return `
                        .allactivities-left {
                            margin-right: 8px;
                        }
                        .allactivities-right {
                            margin-left: 8px;
                        }
                        .allactivities-margin {
                            margin-top: 12px;
                        }
                    `;
                }

                onStart() { 
                    PluginUtilities.addStyle(config.info.name, this.css);
                    this.patchUserActivity();
                }

                patchUserActivity() {
                    const UserActivity = WebpackModules.getByDisplayName('UserActivity');
                    Patcher.before(UserActivity.prototype, 'render', _this => {
                        const activities = ActivityStore.getActivities(_this.props.user.id).filter(activitiesFilter);
                        if(!activities) return;
                        if(!_this.state) _this.state = {activity: activities.indexOf(_this.props.activity)};
                        else {
                            const activity = activities[_this.state.activity];
                            if(!activity) return;
                            _this.props.activity = activity;
                            _this.props.game = GameStore.getGame(activity.application_id);
                        }
                    });
                    Patcher.after(UserActivity.prototype, 'render', (_this, _, ret) => {
                        if(!ret) return;
                        const activities = ActivityStore.getActivities(_this.props.user.id).filter(activitiesFilter);
                        if(!activities) return ret;
                        const children = Utilities.getNestedProp(ret, 'props.children.1.props.children');
                        if(!Array.isArray(children)) return ret;
                        const marginClass = _this.props.activity.details || _this.props.activity.state ? ' allactivities-margin' : '';
                        
                        if(_this.state.activity != 0) children.unshift(React.createElement(Tooltip, {
                            className: `allactivities-left${marginClass}`,
                            text: LabelStore.Messages.PAGINATION_PREVIOUS,
                        }, React.createElement(Button, {
                            className: classes.iconButtonSize,
                            size: Button.Sizes.MIN,
                            color: Button.Colors.WHITE,
                            look: Button.Looks.OUTLINED,
                            onClick: () => _this.setState({activity: _this.state.activity - 1})
                        }, React.createElement(Icon, {name: 'Arrow', direction: 'LEFT'}))));

                        if(_this.state.activity < activities.length - 1) children.push(React.createElement(Tooltip, {
                            className: `allactivities-right${marginClass}`,
                            text: LabelStore.Messages.NEXT,
                        }, React.createElement(Button, {
                            className: classes.iconButtonSize,
                            size: Button.Sizes.MIN,
                            color: Button.Colors.WHITE,
                            look: Button.Looks.OUTLINED,
                            onClick: () => _this.setState({activity: _this.state.activity + 1})
                        }, React.createElement(Icon, { direction: 'RIGHT', name: 'Arrow' }))));

                        const actions = Utilities.findInReactTree(ret.props, e => e && e.onOpenConnections);
                        if(actions) actions.activity = _this.props.activity;
                    });
                }

                onStop() {
                    Patcher.unpatchAll();
                    PluginUtilities.removeStyle(config.info.name);
                }

            }

        };
        return plugin(Plugin, Api);
    })(global.ZeresPluginLibrary.buildPlugin(config));
})();
