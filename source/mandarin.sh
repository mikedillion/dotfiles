# https://github.com/tesseract-ocr/tessdata_best
# https://github.com/tesseract-ocr/tesseract/wiki/Data-Files
tesseract_cn() {
  tesseract --tessdata-dir /usr/local/share/tessdata -l chi_sim "$@" stdout
}

# https://github.com/soimort/translate-shell
trans_cn() {
  trans -source zh-cn $lines
}
