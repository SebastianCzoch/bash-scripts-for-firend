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
  zbarimg $fName
}

function mainMenu {
  case "$option" in 
    "encode")
      encode 
      ;;

    "decode")
      decode 
      ;;

    *)
      echo -e "Usage:\n" \
           "encode - encode typed text to QRCode\n" \
           "decode - decode QRCode image to text\n" \
           "anything else shows this main menu\n"

      read -p "Select option: " option
      mainMenu
      ;;
  esac
}

mainMenu

