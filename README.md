# Hyrule-Nexus Intelligence Dashboard

A high-performance **Blazor Server** dashboard designed for real-time monitoring of Cloud Engineering, Cybersecurity vulnerabilities, and Geek Culture. This project serves as a centralized "Command Center" for technical professionals who need to stay ahead of the curve.

## 🚀 Core Features

* **Main Intel Stream**: Real-time news aggregation from top-tier sources like *The Verge* and *MSN Tech*.
* **Live CVE Tracker**: Automated monitoring of critical vulnerabilities and cybersecurity advisories directly from *CISA*.
* **Geek Pulse**: Integrated feed for entertainment and independent media news from *Bounding Into Comics*.
* **Intelligent UI**: Responsive dark-themed grid layout optimized for multi-monitor setups.
* **Automated Sync**: Background timer-based refreshing (every 15 minutes) to ensure data is always current.

## 🛠️ Technical Stack

* **Framework**: .NET 9.0 / Blazor Server.
* **Data Processing**: `System.ServiceModel.Syndication` for XML/RSS parsing.
* **Caching**: `IMemoryCache` to optimize performance and prevent API rate-limiting.
* **Styling**: Custom CSS3 with advanced animations and glassmorphism elements.

## 🔧 Installation & Setup

### Prerequisites
* .NET SDK (latest version)
* Visual Studio 2022 or VS Code

### 1. Clone the repository
```bash
git clone https://github.com/your-username/hyrule-nexus.git
cd hyrule-nexus
```

### 2. Install Dependencies
Ensure the Syndication package is installed:
```bash
dotnet add package System.ServiceModel.Syndication
```

### 3. Run the Project
```bash
dotnet run
```

## 🛡️ Cybersecurity Note
The **Live CVE Alerts** section is designed to provide immediate visibility into high-severity RCE and Auth Bypass vulnerabilities, pulling directly from official advisory feeds.

## 🎨 UI Customization
The interface features a custom **"Hyrule-Dark"** theme. Key CSS components include:
* **Live Badge**: Pulsing animation to indicate active data streams.
* **Category Borders**: Color-coded cards (Red for Security, Purple for Geek, Teal for Cloud).

---

**Developed by Aldo Raul Sanchez Estrada**
*Senior Cloud Engineer | DevOps | Infrastructure-as-Code Enthusiast*