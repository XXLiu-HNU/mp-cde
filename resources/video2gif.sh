for f in *.mp4; do
    ffmpeg -i "$f" -filter_complex "[0:v] fps=15,scale=320:-1:flags=lanczos,split [a][b];[a] palettegen=stats_mode=diff [p];[b][p] paletteuse=dither=bayer:bayer_scale=5" "${f%.mp4}.gif"
done

