using System;
using System.Collections;
using System.IO;
using System.Text;
using System.Xml;
using ProjectManager.Projects;

namespace ProjectManager.Building
{
    // builds a Library.xml file from a .fdp Project
	public class SwfmillLibraryWriter : XmlTextWriter
	{
        Project project;

		public SwfmillLibraryWriter(string libraryPath) : base(libraryPath, Encoding.UTF8)
		{
			base.Formatting = Formatting.Indented;
		}

		public void WriteProject(Project project)
		{
			this.project = project;

			try { InternalWriteProject(); }
			finally { Close(); }
		}

		// this function should be compacted at some point, it's got too many branches
		private void InternalWriteProject()
		{
			WriteStartDocument();
			WriteComment("This file was generated by a FDBuild.");
			WriteComment("Any modifications you make may be lost.");
			WriteStartElement("movie");

            int maxFlashVersion = (project.Language == "haxe") ? 9 : 8;
            int flashVersion = Math.Max(6, Math.Min(maxFlashVersion, project.MovieOptions.Version));
            WriteAttributeString("version", flashVersion.ToString());

			WriteAttributeString("width", project.MovieOptions.Width.ToString());
			WriteAttributeString("height", project.MovieOptions.Height.ToString());
			WriteAttributeString("framerate", project.MovieOptions.Fps.ToString());
				WriteStartElement("background");
				WriteAttributeString("color", project.MovieOptions.Background);
				WriteEndElement();
				WriteStartElement("frame");
					WriteStartElement("library");
                        WriteStartElement("clip");
                            WriteAttributeString("id", GetSafeId("__sharepoint__"));
                        WriteEndElement();
						WritePreloaders();
                        if (!NeedsMoreFrames)
                            WriteNormalAssets();
                        else
                        {
                            WriteStartElement("clip");
                                WriteAttributeString("id", GetSafeId("__importtag__"));
                            WriteEndElement();
                        }
					WriteEndElement();
                    WriteSharedClips();
				WriteEndElement();

				if (NeedsMoreFrames)
				{
					WriteStartElement("frame");
                    WriteSharedImports();
					WriteEndElement();

					// generate two extra frames (code will be injected into frame 3)
					WriteStartElement("frame");
						WriteElementString("stop","");
						WriteStartElement("library");
						WriteNormalAssets();
						WriteEndElement();
					WriteEndElement();
                }
			WriteEndElement();
			WriteEndDocument();
			Flush();
		}

		#region Library Building

		/*private void WritePlaceOnStage()
		{
			foreach (LibraryAsset asset in project.LibraryAssets)
				if (asset.IsAS && asset.PlaceOnStage && File.Exists(asset.Path))
				{
					string id = asset.ID;

					WriteStartElement("place");
						WriteAttributeString("id",id);
						WriteAttributeString("name","_"+id);
						//WriteAttributeString("x","0");
						//WriteAttributeString("y","0");
					WriteEndElement();
				}
		}*/

		private void WritePreloaders()
		{
			foreach (LibraryAsset asset in project.LibraryAssets)
			{
				// TODO: this is a crappy workaround for the general problem of
				// project "cruft" accumulating.  This will be removed once
				// I add support in the treeview for displaying "missing" project items
	
				if (!File.Exists(asset.Path))
					continue;
	
				if (asset.IsSwf && asset.SwfMode == SwfAssetMode.Preloader)
					AddSwf(asset);
			}
		}

		private void WriteSharedClips()
		{
			int depth = 0;

			// place empty clips to the stage to signal to any preloaders what
			// libraries need to be loaded
			foreach (LibraryAsset asset in project.LibraryAssets)
                if (asset.IsSwf && asset.SwfMode == SwfAssetMode.Shared)
                {
                    WriteStartElement("place");
                    WriteAttributeString("id", GetSafeId("__importtag__"));
                    WriteAttributeString("name", "__library__" + asset.Path);
                    WriteAttributeString("depth", (depth++).ToString());
                    WriteEndElement();
                }
		}

		private void WriteSharedImports()
		{
			// import shared libraries
			foreach (LibraryAsset asset in project.LibraryAssets)
				if (asset.IsSwf && asset.SwfMode == SwfAssetMode.Shared)
				{
					WriteStartElement("import");
					WriteAttributeString("url", asset.Path);
					if (asset.Sharepoint != null)
						WriteAttributeString("symbol", asset.Sharepoint);
					else
						WriteAttributeString("file", asset.Path);
					WriteEndElement();
				}
		}

		private void WriteNormalAssets()
		{
			foreach (LibraryAsset asset in project.LibraryAssets)
			{
				if (!File.Exists(asset.Path))
					continue;
	
				if (!asset.IsSwf || asset.SwfMode == SwfAssetMode.Library)
					AddAsset(asset);
			}
		}

		// returns true if you have any shared libraries or preloaders
		public bool NeedsMoreFrames
		{
			get
			{
				foreach (LibraryAsset asset in project.LibraryAssets)
					if (File.Exists(asset.Path) && asset.IsSwf && 
						asset.SwfMode != SwfAssetMode.Library)
						return true;
				return false;
			}
        }

        private string GetSafeId(string id)
        {
            return (project.Language == "haxe") ? Char.ToUpper(id[2]) + id.Substring(3) : id;
        }

		#endregion

		#region Adding Assets

		private void AddAsset(LibraryAsset asset)
		{
			if (asset.IsImage) AddImage(asset);
			else if (asset.IsFont) AddFont(asset);
			else if (asset.IsSwf) AddSwf(asset);
		}

		private void AddImage(LibraryAsset asset)
		{
            if (asset.BitmapLinkage)
            {
                WriteStartElement("bitmap");
            }
            else
            {
                WriteStartElement("clip");
            }
			WriteAttributeString("id", asset.ID);
			WriteAttributeString("import", asset.Path);
			AddStampAttributes(asset.Path);
			WriteEndElement();
		}

		private void AddFont(LibraryAsset asset)
		{
			WriteStartElement("font");
			WriteAttributeString("id", asset.ID);
			WriteAttributeString("import", asset.Path);

			if (asset.FontGlyphs != null)
				WriteAttributeString("glyphs",asset.FontGlyphs);
			else
				WriteAttributeString("glyphs", "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ `~!@#$%^&*()-_=+[]{}\\|;:'\",./<>?");
			
			AddStampAttributes(asset.Path);
			WriteEndElement();
		}

		private void AddSwf(LibraryAsset asset)
		{
			WriteStartElement("clip");

			if (asset.SwfMode == SwfAssetMode.Library)
				WriteAttributeString("id", asset.ID);

			WriteAttributeString("import", asset.Path);
			AddStampAttributes(asset.Path);
			WriteEndElement();
		}

		private void AddStampAttributes(string path)
		{
			FileInfo file = new FileInfo(path);
			WriteAttributeString("size", file.Length.ToString());
			WriteAttributeString("modified", file.LastWriteTimeUtc.ToString());
		}

		#endregion
	}
}
