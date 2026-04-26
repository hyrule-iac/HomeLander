# STAGE 1: Runtime Base
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app
EXPOSE 8080
EXPOSE 8081
USER app

# STAGE 2: SDK for Compilation
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# FIX: Copy the csproj directly from the current directory
COPY ["HNHQ.csproj", "."]

# Restore dependencies
RUN dotnet restore "HNHQ.csproj"

# Copy everything else
COPY . .

# Build the project
RUN dotnet build "HNHQ.csproj" -c $BUILD_CONFIGURATION -o /app/build

# STAGE 3: Publish
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "HNHQ.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# STAGE 4: Final Image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "HNHQ.dll"]