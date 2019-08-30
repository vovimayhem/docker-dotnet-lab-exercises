FROM microsoft/dotnet:sdk

ENV HOME=/usr/src NUGET_PACKAGES=/usr/nuget/packages PORT=5000

WORKDIR /usr/src

COPY MvcMovie.csproj /usr/src/

RUN dotnet restore

CMD ["dotnet", "watch", "run"]