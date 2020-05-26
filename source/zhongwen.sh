# #############
# # Tesseract #
# #############
#
# https://github.com/tesseract-ocr/tessdata_best
# https://tesseract-ocr.github.io/tessdoc/Data-Files
#
# tesseract --list-langs
#   List of available languages (5):
#   chi_sim
#   chi_sim_vert
#
# +-------+
# | --psm |
# +-------+
#   See: tesseract --help-psm
#   ...
#     7    Treat the image as a single text line.
#   ...

tesseract_zh() {
  TESSDATA_PREFIX='/usr/local/share/tessdata' tesseract --psm 7 -l chi_sim "$@" stdout | tr -d ' '
}


docr() {
  tesseract_zh $HOME/Desktop/Screen\ *
}

alias docr_trans="tesseract_zh $HOME/Desktop/Screen\ *.png | trans_zh_to_en"

# https://github.com/soimort/translate-shell
# Note: pipe stdin to these
trans_zh_to_en() {
  trans -source zh-cn
}

trans_en_to_zh() {
  trans :zh-cn
}

pbzhen() {
  pbpaste | trans -source zh-cn
}

translate_and_format(){
  echo "$1" | trans -source zh-cn \
    | gsed -n 1,4p \
    | gawk 'NF>0' \
    | gsed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g" \
    | tr -d '[:punct:]' \
    | tr '[:upper:]' '[:lower:]' \
    | gsed ':a;N;$!ba;s/\n/\t：\t/g'
}

pbzhen_all() {(
  set -e
  while read -r word; do
    translate_and_format "$word"
  done < <(pbpaste)
)}

pbzhen_words() {
  while read -r word; do
    translate_and_format "$word"
  done < <(pbpaste | gsed -E 's/(.)/\1\n/g' | gawk 'NF>0')
}
