using System.ServiceModel.Syndication;
using System.Xml;
using static HNHQ.Components.Pages.Home;

namespace HNHQ.Models
{
    public class NewsService
    {
        public async Task<List<NewsItem>> GetLiveNewsAsync()
        {
            var feedUrls = new[] {
            "https://news.google.com/rss/search?q=cybersecurity+cve&hl=es-419",
            "https://www.msn.com/es-mx/noticias/rss"
        };

            var items = new List<NewsItem>();

            foreach (var url in feedUrls)
            {
                using var reader = XmlReader.Create(url);
                var feed = SyndicationFeed.Load(reader);

                items.AddRange(feed.Items.Take(5).Select(item => new NewsItem
                {
                    Title = item.Title.Text,
                    Summary = item.Summary?.Text ?? "Click para leer más...",
                    Source = feed.Title.Text,
                    Category = url.Contains("google") ? "Security" : "Cloud",
                    PublishDate = item.PublishDate.UtcDateTime == DateTime.MinValue
                                  ? DateTime.UtcNow
                                  : item.PublishDate.UtcDateTime,
                    Link = item.Links.FirstOrDefault()?.Uri.ToString() ?? string.Empty,
                    ImageUrl = $"https://www.google.com/s2/favicons?domain=" +
                               (item.Links.FirstOrDefault()?.Uri.Host ?? "google.com") + "&sz=128"
                }));
            }

            return items;
        }
    }
}