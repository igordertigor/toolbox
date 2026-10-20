lftp -u "${SFTP_USERNAME},${SFTP_PASSWORD}" "sftp://ngcobalt395.manitu.net:23/" -e "mirror -R build/ .; quit"
