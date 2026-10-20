lftp -u "$SFTP_USER,$SFTP_PASSWORD" sftp://ngcobalt395.manitu.net -e "mirror -R build/ .; quit"
