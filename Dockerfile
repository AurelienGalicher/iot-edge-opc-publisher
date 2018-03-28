FROM microsoft/dotnet:2.0-sdk-jessie

COPY /src /build/src

WORKDIR /build/src
RUN dotnet restore
RUN dotnet publish --configuration Release --output /build/out

WORKDIR /docker
ENTRYPOINT ["dotnet", "/app/OpcPublisher.dll", "publisher", "--pf", "/app/publishednodes.json", "--lf", "/app/publisher.log.txt", "--si", "1", "--ms", "0", "--di", "5", "--fd", "true", "--tm", "true", "--as", "true", "--vc", "true", "--ih", "Amqp_WebSocket_Only"]
