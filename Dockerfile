# STAGE 1: Runtime Base
# Usamos la imagen slim de ASP.NET 10 para producción
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app
EXPOSE 8085
EXPOSE 8086
USER app

# STAGE 2: SDK para Compilación
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["src/Services/Identity/Identity.API/Identity.API.csproj", "src/Services/Identity/Identity.API/"]
RUN dotnet restore "src/Services/Identity/Identity.API/Identity.API.csproj"
COPY . .
WORKDIR "/src/src/Services/Identity/Identity.API"
RUN dotnet build "Identity.API.csproj" -c $BUILD_CONFIGURATION -o /app/build

# STAGE 3: Publish
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "Identity.API.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# STAGE 4: Imagen Final
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Identity.API.dll"]