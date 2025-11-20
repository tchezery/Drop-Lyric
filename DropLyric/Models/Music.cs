namespace DropLyric.Models;

public class WordDetail
{
    public string Text { get; set; } = string.Empty;
    public bool IsHidden { get; set; }
}

public class LyricLine
{
    public double Timestamp { get; set; }
    public List<WordDetail> Words { get; set; } = new();
}