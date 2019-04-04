docker run -d -v /root/teamcity/date:/data/teamcity_server/datadir -v /root/teamcity/logs:/opt/teamcity/logs -p 8111:8111  jetbrains/teamcity-server
