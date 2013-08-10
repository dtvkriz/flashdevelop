﻿using System;
using System.Collections.Generic;
using System.Windows.Forms;
using flash.tools.debugger;
using flash.tools.debugger.expression;
using FlashDebugger.Debugger.Flash;
using PluginCore;

namespace FlashDebugger.Controls
{
	public class WatchUI : DockPanelControl
	{
		private DataTreeControl treeControl;
		private List<String> watches;

		public WatchUI()
		{
			watches = new List<string>();
			treeControl = new DataTreeControl(true);
			this.treeControl.Tree.BorderStyle = BorderStyle.None;
			this.treeControl.Resize += new EventHandler(this.TreeControlResize);
			this.treeControl.Tree.Font = PluginBase.Settings.DefaultFont;
			this.treeControl.Dock = DockStyle.Fill;
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.treeControl);
		}

		private void TreeControlResize(Object sender, EventArgs e)
		{
			Int32 w = this.treeControl.Width / 2;
			this.treeControl.Tree.Columns[0].Width = w;
			this.treeControl.Tree.Columns[1].Width = w - 8;
		}

		public void AddElement(String item)
		{
			if (watches.Contains(item)) return;
			watches.Add(item);
			UpdateElements();
		}
		
		public void RemoveElement(string item)
		{
			watches.Remove(item);
			UpdateElements();
		}

		public void RemoveElement(int itemN)
		{
			if (itemN<watches.Count) RemoveElement(watches[itemN]);
		}

		public void Clear()
		{
			watches.Clear();
			UpdateElements();
		}

		public void UpdateElements()
		{
			treeControl.Tree.BeginUpdate();
			treeControl.Nodes.Clear();
			foreach (String item in watches)
			{
				DataNode node = new DataNode(item); // todo, introduce new Node types.
				try
				{
                    IASTBuilder builder = new ASTBuilder(false);
                    ValueExp exp = builder.parse(new java.io.StringReader(item));
                    var ctx = new ExpressionContext(PluginMain.debugManager.FlashInterface.Session, PluginMain.debugManager.FlashInterface.Session.getFrames()[PluginMain.debugManager.CurrentFrame]);
                    var obj = exp.evaluate(ctx);
                    node = new FlashDataNode((Variable)obj, item);
				}
				catch { }
				node.Text = item;
				treeControl.AddNode(node);
			}
			treeControl.Tree.EndUpdate();
			treeControl.Enabled = true;
		}

	}
}
