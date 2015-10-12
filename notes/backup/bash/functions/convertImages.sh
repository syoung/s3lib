#### CONVERT IMAGES

echo "Changing to directory: $1";
cd $1;
for img in *.png
 do
    echo "BEFORE img:  $img"
     img=${img//.png/}

     echo "AFTER img: $img"
     convert "$img.png" "$img.jpg"
 done

}