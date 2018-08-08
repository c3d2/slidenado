# slidenado

Slide Generator, primarily for Chaos macht Schule

## Abhängigkeiten

* `make`
* `pdflatex`, z.B. via TeXLive

## Nutzung

Alle Präsentation können direkt als LaTeX-Datei gebaut werden.  Entweder eine
Datei in einem TeX-Editor der Wahl öffnen und dort übersetzen, oder auf der
Kommandozeile zum Beispiel folgendes aufrufen:

    cd presentations
    pdflatex 2017-05-20_medinetzkongress.tex

Alternativ kann auch das Makefile benutzt werden:

    make presentations/2017-05-20_medinetzkongress.pdf

Präsentationen mit Notizen dazu können erzeugt werden, indem im Aufruf der
Dokumentenklasse als optionales Argument `notes` hinzugefügt wird.

