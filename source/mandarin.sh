# https://github.com/tesseract-ocr/tessdata_best
# https://github.com/tesseract-ocr/tesseract/wiki/Data-Files
tesseract_zh() {
  tesseract --tessdata-dir /usr/local/share/tessdata -l chi_sim "$@" stdout
}

docr() {
  tesseract --tessdata-dir /usr/local/share/tessdata -l chi_sim "$HOME/Desktop/Screen\ *" stdout
}

# https://github.com/soimort/translate-shell
# Note: pipe stdin to these
trans_zn_to_en() {
  trans -source zh-cn
}

trans_en_to_zh() {
  trans :zh-cn
}

pbzhen() {
  pbpaste | trans -source zh-cn
}

pbenzh() {
  pbpaste | trans :zh-cn
}

alias ocr_desktop="tesseract_zh $HOME/Desktop/Screen\ * | trans_zn_to_en"
