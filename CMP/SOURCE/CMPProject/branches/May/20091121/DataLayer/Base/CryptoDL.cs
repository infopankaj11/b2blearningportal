using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace WorkLayers.DataLayer
{
    public class CryptoDL
    {
      public static string Encrypt(string inp) 
      {
          MD5CryptoServiceProvider hasher = new MD5CryptoServiceProvider();
          byte[] tBytes = Encoding.ASCII.GetBytes(inp);
          byte[] hBytes = hasher.ComputeHash(tBytes);
          StringBuilder sb = new StringBuilder();
          for (int c=0;c<hBytes.Length;c++)
          sb.AppendFormat("{0:x2}",hBytes[c]);
          return(sb.ToString());
      }

    }
}
