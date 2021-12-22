MAIN_FILE = DYI_Main

PDFLATEX = pdflatex

MACRO_GENERATOR = ./gen_Current_Macros.py
MACRO_INPUTES = gen_config.py           \
                gen_events.py

FILES_TEX = DYI_Main.tex                \
            DYI_Year_Calendar.tex       \
            DYI_Monthly_Planner.tex     \
            DYI_Weekly_Planner.tex      \
            ascii.tex

# generated files
FILES_TEX_GEN = DYI_i18n.tex                   \
                DYI_Month_Tables.tex           \
                DYI_Monthly_Planner_Tables.tex \
                DYI_Weekly_Planner_Tables.tex

GNUPLOT_INPUT = 52wks.gnuplot daily.gnuplot
GNUPLOT_TEX = 52wks.tex \
			  daily.tex
GNUPLOT_INTERMEDIATE = 52wks.eps \
					   daily.eps
GNUPLOT_OUTPUT = 52wks.pdf \
				 daily.pdf \
				 52wks.tex \
				 daily.tex \
				 52wks-eps-converted-to.pdf \
				 daily-eps-converted-to.pdf
GNUPLOT = gnuplot -c

# ITALIAN
MAIN_FILE_ITA = DYI_Main_ita

MACRO_GENERATOR_ITA = ./gen_Current_Macros_ita.py
MACRO_INPUTES_ITA = gen_config_ita.py           \
                	gen_events.py

FILES_TEX_ITA = DYI_Main_ita.tex                \
            DYI_Year_Calendar.tex       \
            DYI_Monthly_Planner_ita.tex     \
            DYI_Weekly_Planner_ita.tex      \
            ascii.tex

# generated files
FILES_TEX_GEN_ITA = DYI_i18n_ita.tex                   \
                DYI_Month_Tables_ita.tex           \
                DYI_Monthly_Planner_Tables_ita.tex \
                DYI_Weekly_Planner_Tables_ita.tex

GNUPLOT_INPUT_ITA = 52wks_ita.gnuplot daily_ita.gnuplot
GNUPLOT_TEX_ITA = 52wks_ita.tex \
			  daily_ita.tex
GNUPLOT_INTERMEDIATE_ITA = 52wks_ita.eps \
					   daily_ita.eps
GNUPLOT_OUTPUT_ITA = 52wks_ita.pdf \
				 daily_ita.pdf \
				 52wks_ita.tex \
				 daily_ita.tex \
				 52wks-ita-eps-converted-to.pdf \
				 daily-ita-eps-converted-to.pdf

DEFAULT: $(FILES_TEX) $(FILES_TEX_GEN) $(GNUPLOT_TEX) $(GNUPLOT_OUTPUT)
	$(PDFLATEX) $(MAIN_FILE)

$(FILES_TEX_GEN): $(MACRO_GENERATOR) $(MACRO_INPUTES)
	$(MACRO_GENERATOR)

$(GNUPLOT_OUTPUT): $(GNUPLOT_INPUT)

%.tex: %.gnuplot
	$(GNUPLOT) $(@:.tex=.gnuplot)

ita: $(FILES_TEX_ITA) $(FILES_TEX_GEN_ITA) $(GNUPLOT_TEX_ITA) $(GNUPLOT_OUTPUT_ITA)
	$(PDFLATEX) $(MAIN_FILE_ITA)

$(FILES_TEX_GEN_ITA): $(MACRO_GENERATOR_ITA) $(MACRO_INPUTES_ITA)
	python3 $(MACRO_GENERATOR_ITA)

$(GNUPLOT_OUTPUT_ITA): $(GNUPLOT_INPUT_ITA)

clean:
	rm -f $(FILES_TEX:.tex=.dvi)
	rm -f $(FILES_TEX:.tex=.aux)
	rm -f $(FILES_TEX_GEN:.tex=.aux)
	rm -f $(FILES_TEX_GEN)
	rm -f $(GNUPLOT_OUTPUT)
	rm -f $(GNUPLOT_INTERMEDIATE)
	rm -f $(MAIN_FILE).log
	rm -f *~

cleanita:
	rm -f $(FILES_TEX_ITA:.tex=.dvi)
	rm -f $(FILES_TEX_ITA:.tex=.aux)
	rm -f $(FILES_TEX_GEN_ITA:.tex=.aux)
	rm -f $(FILES_TEX_GEN_ITA)
	rm -f $(GNUPLOT_OUTPUT)
	rm -f $(GNUPLOT_INTERMEDIATE)
	rm -f $(GNUPLOT_INTERMEDIATE_ITA)
	rm -f $(MAIN_FILE_ITA).log
	rm -f *~

realclean: clean
	rm -f $(MAIN_FILE).pdf
	rm -f *.aux
	rm -rf __pycache__

realcleanita: cleanita
	rm -f $(MAIN_FILE_ITA).pdf
	rm -f *.aux
	rm -rf __pycache__

dist: clean
	cd .. ; \
	tar -czvf DIY_Organizer-dist_`date +%F`.tar.gz DIY_Organizer

realdist: realclean
	cd .. ; \
	tar -czvf DIY_Organizer-realdist_`date +%F`.tar.gz DIY_Organizer

