//META{"name":"MobileForAll","website":"https://github.com/Mega-Mewthree/BetterDiscordPlugins/tree/master/Plugins/MobileForAll","source":"https://github.com/Mega-Mewthree/BetterDiscordPlugins/blob/master/Plugins/MobileForAll/MobileForAll.plugin.js"}*//

/*
MIT License

Copyright (c) 2020 Mega_Mewthree

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

// Updated October 26th, 2020.

class MobileForAll {
  getName() {
    return "MobileForAll";
  }
  getShortName() {
    return "MobileForAll";
  }
  getDescription() {
    return "Adds mobile indicators for all status types.\nRequired dependency: ZeresPluginLibrary\n\nMy Discord server: https://nebula.mooo.info/discord-invite\nDM me @Lucario ☉ ∝ x²#7902 or create an issue at https://github.com/Mega-Mewthree/BetterDiscordPlugins for support.";
  }
  getVersion() {
    return "1.0.2";
  }
  getAuthor() {
    return "Mega_Mewthree"; // Current Discord account: @Lucario ☉ ∝ x²#7902 (438469378418409483)
  }
  constructor() {
    this.colors = {
      online: "#43b581",
      idle: "#faa61a",
      dnd: "#f04747",
      offline: "#747f8d",
      streaming: "#593695"
    };
  }
  load() {}
  unload() {}
  start() {
    if (typeof window.ZeresPluginLibrary === "undefined") {
      BdApi.showToast(`${this.getName()}: Please install "ZeresPluginLibrary" and restart this plugin.`, {type: "error"});
    } else {
      if (window.ZeresPluginLibrary.PluginUtilities && typeof window.ZeresPluginLibrary.PluginUtilities.checkForUpdate === "function") {
        try {
          window.ZeresPluginLibrary.PluginUtilities.checkForUpdate(this.getName(), this.getVersion(), `https://raw.githubusercontent.com/Mega-Mewthree/BetterDiscordPlugins/master/Plugins/${this.getName()}/${this.getName()}.plugin.js`);
        } catch (e) {
          console.error(e);
        }
      }
      BdApi.showToast(`${this.getName()} has started!`);
    }
  }
  observer({addedNodes, removedNodes, target}) {
    // Added Nodes Section
    if (addedNodes.length > 0) {
      // console.log(addedNodes);
      // const modalTargets = [].filter.call(addedNodes, n => /modal/.test(n.className));
      // if (modalTargets.length > 0) {
      //   modalTargets.forEach(t => {
      //     try {
      //       // TODO: Find User ID
      //       const userID = window.ZLibrary.ReactTools.getReactProperty(t, "");
      //       if (!userID) return;
      //       const userStatus = window.ZLibrary.DiscordModules.UserStatusStore.getState().clientStatuses[userID];
      //       const platforms = Object.keys(userStatus);
      //       if (platforms.length === 1 && platforms[0] === "mobile" && userStatus.mobile !== "online") {
      //         let mysteryElement = t.children[2].children[0].children[0].children[0].children[0].children[0];
      //         let foreignObject;
      //         let rect;
      //
      //         // LinkProfilePicture compatability
      //         if (mysteryElement.tagName === "A") {
      //           foreignObject = mysteryElement.children[0];
      //           rect = mysteryElement.children[0];
      //         }
      //         foreignObject = foreignObject.children[0];
      //         rect = rect.children[1];
      //
      //         foreignObject.setAttribute("mask", "url(#svg-mask-avatar-status-mobile-80)");
      //         rect.setAttribute("mask", "url(#svg-mask-status-online-mobile)");
      //         rect.setAttribute("height", 24);
      //         rect.setAttribute("y", 52);
      //       }
      //     } catch (e) {}
      //   });
      // }
      // Switching Guilds
      const guildSwitchMemberListTargets = Array.from(
        [].filter.call(addedNodes, n => /members-/.test(n.parentElement && n.parentElement.id))
        .flatMap(n => [].slice.call(n.children[1].children))
      );
      const guildMemberListChangeTargets = [].filter.call(addedNodes, n => /member-/.test(n.className));
      const guildMemberListTargets = [...guildSwitchMemberListTargets, ...guildMemberListChangeTargets];
      if (guildMemberListTargets.length > 0) {
        guildMemberListTargets.forEach(t => {
          try {
            const userID = window.ZLibrary.ReactTools.getReactProperty(t, "return.return.return.return.return.return.return.memoizedProps.user.id");
            if (!userID) return;
            const userStatus = this.getUserStatus(userID);
            if (!userStatus) return;
            const platforms = Object.keys(userStatus);
            if (platforms.length === 1 && platforms[0] === "mobile" && userStatus.mobile !== "online") {
              let offset = 0;
              const parent = t.children[0].children[0].children[0].children[0];
              if (parent.children[0].tagName.toLowerCase() === "mask") offset = 1;
              const foreignObject = parent.children[offset];
              const rect = parent.children[offset * 2 + 1]; // After typing, foreignObject is second and rect is fourth.

              if (this.getUserTypingStatus(userID)) {
                [].find.call(parent.children, c => c.tagName.toLowerCase() === "svg").style.display = null;
                foreignObject.setAttribute("mask", `url(#svg-mask-avatar-status-typing-32)`);
                if (offset) {
                  rect.mask = null;
                  rect.setAttribute("height", 10);
                  rect.setAttribute("y", 22);
                }
                return;
              }

              foreignObject.setAttribute("mask", "url(#svg-mask-avatar-status-mobile-32)");
              rect.setAttribute("mask", "url(#svg-mask-status-online-mobile)");
              rect.setAttribute("height", 15);
              rect.setAttribute("y", 17);
              if (offset) {
                [].find.call(parent.children, c => c.tagName.toLowerCase() === "svg").style.display = "none";
              }
            }
          } catch (e) {}
        });
      }
      const guildMemberListUpdateTargets = [].filter.call(addedNodes, n => n.tagName && n.tagName.toUpperCase() === "SVG");
      if (guildMemberListUpdateTargets.length > 0) {
        guildMemberListUpdateTargets.forEach(t => {
          try {
            t = t.parentElement.parentElement.parentElement.parentElement;
            if (!/member-/.test(t.className)) return;
            const userID = window.ZLibrary.ReactTools.getReactProperty(t, "return.return.return.return.return.return.return.memoizedProps.user.id");
            if (!userID) return;
            const userStatus = this.getUserStatus(userID);
            if (!userStatus) return;
            const platforms = Object.keys(userStatus);
            if (platforms.length === 1 && platforms[0] === "mobile" && userStatus.mobile !== "online") {
              let offset = 0;
              const parent = t.children[0].children[0].children[0].children[0];
              if (parent.children[0].tagName.toLowerCase() === "mask") offset = 1;
              const foreignObject = parent.children[offset];
              const rect = parent.children[offset * 2 + 1]; // After typing, foreignObject is second and rect is fourth.

              if (this.getUserTypingStatus(userID)) {
                [].find.call(parent.children, c => c.tagName.toLowerCase() === "svg").style.display = null;
                foreignObject.setAttribute("mask", `url(#svg-mask-avatar-status-typing-32)`);
                if (offset) {
                  rect.removeAttribute("mask");
                  rect.setAttribute("fill", "transparent");
                  rect.setAttribute("height", 10);
                  rect.setAttribute("y", 22);
                }
                return;
              }

              foreignObject.setAttribute("mask", "url(#svg-mask-avatar-status-mobile-32)");
              rect.setAttribute("mask", "url(#svg-mask-status-online-mobile)");
              rect.setAttribute("height", 15);
              rect.setAttribute("y", 17);
              if (offset) {
                rect.setAttribute("fill", this.colors[userStatus.mobile]);
                [].find.call(parent.children, c => c.tagName.toLowerCase() === "svg").style.display = "none";
              }
            }
          } catch (e) {}
        });
      }
    }

    // Removed Nodes Section
    if (removedNodes.length > 0) {
      const guildMemberListUpdateTargets = [].filter.call(removedNodes, n => n.tagName && n.tagName.toLowerCase() === "svg");
      if (guildMemberListUpdateTargets.length > 0) {
        guildMemberListUpdateTargets.forEach(t => {
          try {
            t = target.parentElement.parentElement.parentElement.parentElement;
            if (!/member-/.test(t.className)) return;
            const userID = window.ZLibrary.ReactTools.getReactProperty(t, "return.return.return.return.return.return.return.memoizedProps.user.id");
            if (!userID) return;
            const userStatus = this.getUserStatus(userID);
            const platforms = Object.keys(userStatus);
            if (platforms.length === 1 && platforms[0] === "mobile" && userStatus.mobile !== "online") {
              let offset = 0;
              const parent = t.children[0].children[0].children[0].children[0];
              if (parent.children[0].tagName.toLowerCase() === "mask") offset = 1;
              const foreignObject = parent.children[offset];
              const rect = parent.children[offset * 2 + 1]; // After typing, foreignObject is second and rect is fourth.

              if (this.getUserTypingStatus(userID)) {
                [].find.call(parent.children, c => c.tagName.toLowerCase() === "svg").style.display = null;
                foreignObject.setAttribute("mask", `url(#svg-mask-avatar-status-typing-32)`);
                if (offset) {
                  rect.removeAttribute("mask");
                  rect.setAttribute("fill", "transparent");
                  rect.setAttribute("height", 10);
                  rect.setAttribute("y", 22);
                }
                return;
              }

              foreignObject.setAttribute("mask", "url(#svg-mask-avatar-status-mobile-32)");
              rect.setAttribute("mask", "url(#svg-mask-status-online-mobile)");
              rect.setAttribute("height", 15);
              rect.setAttribute("y", 17);
              if (offset) {
                rect.setAttribute("fill", this.colors[userStatus.mobile]);
                [].find.call(parent.children, c => c.tagName.toLowerCase() === "svg").style.display = "none";
              }
            }
          } catch (e) {}
        });
      }
    }
  }
  stop() {
    BdApi.showToast(`${this.getName()} has stopped!`);
  }
  getUserStatus(userID) {
    return window.ZLibrary.DiscordModules.UserStatusStore.getState().clientStatuses[userID];
  }
  getUserTypingStatus(userID) {
    const channelID = window.ZLibrary.DiscordModules.SelectedChannelStore.getChannelId();
    if (!channelID) return null;
    const channelTypingUsers = window.ZLibrary.DiscordModules.UserTypingStore.getTypingUsers(channelID);
    if (channelTypingUsers[userID]) return true;
    return false;
  }
  getMaskIDs() {
    return window.ZLibrary.WebpackModules.getByProps("MaskIDs").MaskIDs;
  }
}
