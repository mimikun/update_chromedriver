function update_chromedriver --description 'Update chromedriver'
    echo "Update chromedriver"
    if read_confirm

        set OLD_VERSION (chromedriver --version | cut -d ' ' -f 2)
        set VERSION (curl --silent https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
        set DESTINATION /usr/local/bin/chromedriver
        if test $OLD_VERSION != $VERSION
            curl -L https://chromedriver.storage.googleapis.com/$VERSION/chromedriver_linux64.zip -o /tmp/chromedriver_linux64.zip
            sleep 5
            set CURRENTDIR (pwd)
            cd /tmp && unzip chromedriver_linux64.zip
            sleep 5
            cd $CURRENTDIR
            sudo cp /tmp/chromedriver $DESTINATION
            sudo rm -f /tmp/chromedriver*
            sudo chmod 755 $DESTINATION
        else
            echo "No update required."
        end
    end
end
