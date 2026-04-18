namespace HNHQ.Models;

public class DevOpsTopic
{
    public int Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Icon { get; set; } = "⚙️";
    public string Duration { get; set; } = "~5 min";
    public string Category { get; set; } = "CI/CD"; // CI, CD, o CodeQL
    public string ColorHex { get; set; } = "#E6F1FB";
    public string TextColorHex { get; set; } = "#185FA5";
    public List<string> TalkingPoints { get; set; } = new();
    public List<TechChip> Chips { get; set; } = new();
    public string? Warning { get; set; }
}
public record TechChip(string Label, string CssClass);