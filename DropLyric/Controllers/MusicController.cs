using Microsoft.AspNetCore.Mvc;
using DropLyric.Models;

namespace DropLyric.Controllers;

[ApiController]
[Route("[controller]")]
public class MusicController : ControllerBase
{
    [HttpGet("lyrics")]
    public IActionResult GetLyrics()
    {
        var response = new List<LyricLine>
        {
            new LyricLine
            {
                Timestamp = 1000,
                Words = new List<WordDetail>
                {
                    new WordDetail { Text = "Hello", IsHidden = true },
                    new WordDetail { Text = ",", IsHidden = false },
                    new WordDetail { Text = "it's", IsHidden = false },
                    new WordDetail { Text = "me", IsHidden = true }
                }
            }
        };
        
        return Ok(response);
    }
}