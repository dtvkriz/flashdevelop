﻿using System;
using System.Text;
using System.Collections;
using System.Windows.Forms;
using System.Collections.Generic;
using PluginCore.Managers;
using PluginCore;
using PluginCore.Utilities;
using FlashDevelop.Helpers;
using System.IO;

namespace FlashDevelop.Managers
{
    class ShortcutManager
    {
        public static List<Keys> AllShortcuts = new List<Keys>();
        public static List<ShortcutItem> RegistedItems = new List<ShortcutItem>();

        /// <summary>
        /// Registers a shortcut item
        /// </summary>
        public static void RegisterItem(String key, Keys keys)
        {
            ShortcutItem registered = new ShortcutItem(key, keys);
            RegistedItems.Add(registered);
        }

        /// <summary>
        /// Registers a shortcut item
        /// </summary>
        public static void RegisterItem(String key, ToolStripMenuItem item)
        {
            ShortcutItem registered = new ShortcutItem(key, item);
            RegistedItems.Add(registered);
        }

        /// <summary>
        /// Gets the specified registered shortcut item
        /// </summary>
        public static ShortcutItem GetRegisteredItem(String id)
        {
            foreach (ShortcutItem item in RegistedItems)
            {
                if (item.Id == id) return item;
            }
            return null;
        }

        /// <summary>
        /// Updates the list of all shortcuts
        /// </summary>
        public static void UpdateAllShortcuts()
        {
            List<Keys> keys = new List<Keys>();
            foreach (ShortcutItem item in RegistedItems)
            {
                keys.Add(item.Custom);
            }
            AllShortcuts = keys;
        }

        /// <summary>
        /// Applies all shortcuts to the items
        /// </summary>
        public static void ApplyAllShortcuts()
        {
            foreach (ShortcutItem item in RegistedItems)
            {
                if (item.Item != null) item.Item.ShortcutKeys = item.Custom;
                else if (item.Default != item.Custom)
                {
                    DataEvent de = new DataEvent(EventType.Shortcut, item.Id, item.Custom);
                    EventManager.DispatchEvent(Globals.MainForm, de);
                }
            }
            UpdateAllShortcuts();
        }

        /// <summary>
        /// Saves the custom shorcuts from a file
        /// </summary>
        public static void LoadCustomShortcuts()
        {
            ShortcutData sd = new ShortcutData();
            if (File.Exists(FileNameHelper.ShortcutData))
            {
                Object obj = ObjectSerializer.Deserialize(FileNameHelper.ShortcutData, sd, false);
                foreach (Argument arg in ((ShortcutData)obj).Shortcuts)
                {
                    ShortcutItem item = GetRegisteredItem(arg.Key);
                    if (item != null) item.Custom = (Keys)Enum.Parse(typeof(Keys), arg.Value);
                }
            }
        }

        /// <summary>
        /// Saves the custom shorcuts to a file
        /// </summary>
        public static void SaveCustomShortcuts()
        {
            ShortcutData sd = new ShortcutData();
            foreach (ShortcutItem item in RegistedItems)
            {
                if (item.Custom != item.Default)
                {
                    sd.Shortcuts.Add(new Argument(item.Id, item.Custom.ToString()));
                }
            }
            String file = FileNameHelper.ShortcutData;
            ObjectSerializer.Serialize(file, sd);
        }

    }

    #region Helper Classes

    public class ShortcutItem
    {
        public Keys Custom = Keys.None;
        public Keys Default = Keys.None;
        public ToolStripMenuItem Item = null;
        public String Id = String.Empty;

        public ShortcutItem(String id, Keys keys)
        {
            this.Id = id;
            this.Default = this.Custom = keys;
        }

        public ShortcutItem(String id, ToolStripMenuItem item)
        {
            this.Id = id;
            this.Item = item;
            this.Default = this.Custom = item.ShortcutKeys;
        }

    }

    [Serializable]
    public class ShortcutData
    {
        public List<Argument> Shortcuts = new List<Argument>();

        public ShortcutData() {}
        public ShortcutData(List<Argument> shortcuts)
        {
            this.Shortcuts = shortcuts;
        }
    }

    #endregion

}
