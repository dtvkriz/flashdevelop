﻿using System;
using System.Data;
using System.Text;
using System.Drawing;
using System.Collections.Generic;
using System.ComponentModel;
using System.Windows.Forms;

namespace FlashDevelop.Controls
{
	public class ArgEditor : UserControl
	{
        private System.Windows.Forms.Label argLabel;
        private System.Windows.Forms.ComboBox argValues;

		public ArgEditor(String args, String[] values)
		{
            this.InitializeComponent();
			this.argLabel.Font = PluginCore.PluginBase.Settings.DefaultFont;
            this.argValues.Font = PluginCore.PluginBase.Settings.EditorFont;
            this.argLabel.Text = args;
            if (values.Length > 0)
            {
                this.argValues.Items.AddRange(values);
                this.Value = values[0];
            }
        }

        #region Windows Forms Designer Generated Code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.argLabel = new System.Windows.Forms.Label();
            this.argValues = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // argLabel
            // 
            this.argLabel.Dock = System.Windows.Forms.DockStyle.Left;
            this.argLabel.Location = new System.Drawing.Point(0, 0);
            this.argLabel.Margin = new System.Windows.Forms.Padding(0);
            this.argLabel.Name = "argLabel";
            this.argLabel.Size = new System.Drawing.Size(65, 22);
            this.argLabel.TabIndex = 0;
            this.argLabel.Text = "Arg";
            this.argLabel.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // argValues
            // 
            this.argValues.Font = new System.Drawing.Font("Courier New", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.argValues.FormattingEnabled = true;
            this.argValues.Location = new System.Drawing.Point(68, 0);
            this.argValues.Margin = new System.Windows.Forms.Padding(0, 0, 3, 0);
            this.argValues.Name = "argValues";
            this.argValues.Size = new System.Drawing.Size(125, 22);
            this.argValues.TabIndex = 1;
            // 
            // ArgEditor
            //
            this.AutoSize = true;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.argValues);
            this.Controls.Add(this.argLabel);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "ArgEditor";
            this.Size = new System.Drawing.Size(200, 22);
            this.ResumeLayout(false);

        }

        #endregion

        #region Methods And Event Handlers

        /// <summary>
        /// 
        /// </summary>
        protected override void OnGotFocus(EventArgs e)
		{
			base.OnGotFocus(e);
            this.argValues.Focus();
		}

        /// <summary>
        /// 
        /// </summary>
		public String Argument
		{
            get { return this.argLabel.Text; }
            set { this.argLabel.Text = value; }
		}

        /// <summary>
        /// 
        /// </summary>
		public String Value
		{
            get { return this.argValues.Text; }
            set { this.argValues.Text = value; }
        }

        #endregion

    }

}
