/**
 * @name OpenSpotifylinksInSpotify
 * @authorId 415849376598982656
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
            name: "Open Spotify Links in Spotify",
            authors: [
                {
                    name: "Strencher",
                    discord_id: "415849376598982656",
                    github_username: "Strencher",
                    twitter_username: "Strencher3"
                }
            ],
            version: "0.0.8",
            description: "Opens Spotify links in Spotify. requires Spotify Desktop App.",
            github: "https://github.com/Strencher/BetterDiscordStuff/blob/master/OpenSpotifylinksInSpotify/OpenSpotifylinksInSpotify.plugin.js",
            github_raw: "https://raw.githubusercontent.com/Strencher/BetterDiscordStuff/master/OpenSpotifylinksInSpotify/OpenSpotifylinksInSpotify.plugin.js"
        },
        changelog: [
            {
                title: "fix",
                type: "fixed",
                items: ["Fixed not working."]
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
            const { WebpackModules, PluginUtilities, DiscordModules, ReactComponents, Patcher, Toasts, Modals, DiscordModules: { React } } = Api;
            const { shell } = require('electron');
            return class OpenSpotifylinksInSpotify extends Plugin {
                constructor() {
                    super();
                }

                event(e) {
                    if (e.target.localName == "a" && e.target.href.includes("open.spotify.com")) {
                        e.preventDefault();
                        let url = e.target.href.split("/");
                        shell.openExternal(`spotify://${url[3]}/${url[url.length - 1]}`, { activate: true });
                    } else if(e.target.parentElement && e.target.parentElement.localName == "a" && e.target.parentElement.href.includes("open.spotify.com")) {
                        e.preventDefault();
                        let url = e.target.parentElement.href.split("/");
                        shell.openExternal(`spotify://${url[3]}/${url[url.length - 1]}`, { activate: true });
                    }
                }
                onStart() {
                    document.addEventListener("click", this.event);
                }
                onStop() {
                    document.removeEventListener("click", this.event);
                }

            }

        };
        return plugin(Plugin, Api);
    })(global.ZeresPluginLibrary.buildPlugin(config));
})();
