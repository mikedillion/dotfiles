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

export TESSDATA_PREFIX='/usr/local/share/tessdata'

tesseract_zh() {
  tesseract --psm 7 -l chi_sim "$@" stdout | tr -d ' '
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

pbzhen_all() {(
  set -e
  while read -r words; do
    echo "$words" | trans -source zh-cn \
      | gsed -n 1,4p \
      | gawk 'NF>0' \
      | gsed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g" \
      | tr -d '[:punct:]' \
      | tr '[:upper:]' '[:lower:]' \
      | gsed ':a;N;$!ba;s/\n/\t：\t/g'
  done < <(pbpaste)
)}
