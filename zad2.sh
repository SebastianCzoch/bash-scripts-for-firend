#!/bin/bash
option=$1

function encode {
  read -p "Text to encode: " text
  read -p "QRCode file name: " fName
  qrencode -o $fName $text
  echo "Done, saved file $fName has encoded content $text"
}

function decode {
  read -p "QRCode file name: " fName
  zbarimg -d $fName
}

function show {
  read -p "QRCode file name: " fName
  display $fName 
}

function mainMenu {
  case "$option" in 
    "encode")
      encode 
      ;;

    "decode")
      decode 
      ;;

    "show")
      show 
      ;;

    *)
      echo -e "Usage:\n" \
           "encode - encode typed text to QRCode\n" \
           "decode - decode QRCode image to text\n" \
           "show - show selected image\n" \
           "anything else shows this main menu\n"

      read -p "Select option: " option
      mainMenu
      ;;
  esac
}

mainMenu

