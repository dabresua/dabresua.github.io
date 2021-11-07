br=$(xdg-settings get default-web-browser | cut -d "." -f1)
echo $br
sed -i "s/firefox/$br/g" generate.sh
sudo apt-get install pandoc wkhtmltopdf
