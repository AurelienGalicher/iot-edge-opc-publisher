FROM microsoft/dotnet:2.0-sdk AS build-env
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out

FROM microsoft/dotnet:2.0-runtime
WORKDIR /app
COPY --from=build-env /app/out ./
ENTRYPOINT ["dotnet", "OpcPublisher.dll", "publisher", "--pf", "publishednodes.json", "--lf", "publisher.log.txt", "--si", "1", "--ms", "0", "--di", "5", "--fd", "true", "--tm", "true", "--as", "true", "--vc", "true", "--ih", "Amqp_WebSocket_Only"]
