echo "lottefastvpn: cleaning..."

deb_file="./build/lottefastvpn_amd64.deb"
if [ -e "$deb_file" ]; then
  rm -r "$deb_file"
fi

opt_w_dir="./deb/opt/lottefastvpn/"
if [ -e "$opt_w_dir" ]; then
  rm -r "$opt_w_dir"
fi

mkdir -p "$opt_w_dir"

echo "lottefastvpn: building go binary..."
time {
  go generate
  go build -ldflags "-s -w" -trimpath -o "$opt_w_dir""lottefastvpn"
}

echo "lottefastvpn: copying icons..."
cp -r ./Icon/ "$opt_w_dir"

echo "lottefastvpn: building deb package..."

touch "$opt_w_dir""lottefastvpn.settings"

if [ ! -d "./build/" ]; then
  mkdir ./build/
fi

dpkg-deb --root-owner-group --build ./deb $deb_file
echo "lottefastvpn: done"
