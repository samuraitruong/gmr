using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Drawing;

namespace GMR.Biz.Helpers
{
    public class FileUploader
    {
        public static string UploadImage(string path, byte[] data, string filename)
        {
            Guid id = Guid.NewGuid();
            string ext = Path.GetExtension(filename);
            string newFilename = id.ToString() + ext;

            string savedPath = Path.Combine(path, newFilename);
            MemoryStream stream = new MemoryStream();
            stream.Write(data, 0, data.Length);
            Image img = Image.FromStream(stream);
            img.Save(savedPath);
            img.Dispose();
            stream.Close();
            return newFilename;
        }

        internal static string UploadImage(string path, Stream stream, string filename)
        {
            Guid id = Guid.NewGuid();
            string ext = Path.GetExtension(filename);
            string newFilename = id + ext;

            return UploadImage(path, stream, newFilename, true);
        }

        internal static string UploadImage(string path, Stream stream, string filename, bool overwrite)
        {
            if (overwrite)
            {
                string savedPath = Path.Combine(path, filename);
                Image img = Image.FromStream(stream);
                img.Save(savedPath);
                img.Dispose();
                stream.Close();
                return filename;
            }
            return UploadImage(path, stream, filename);
        }

        
    }
}
