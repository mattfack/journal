#!/usr/bin/python
# -*- coding: UTF-8 -*-
import locale
import gen_events as events

# Year to generate for
year = 2023

# True if the week starts on Monday (European convention), False if it starts on Sunday.
week_starts_on_Monday = True

# Locale -- uncomment one only, use UTF-8 encoding ONLY
#
# locale.setlocale(locale.LC_ALL, 'en_AU.UTF-8')      # Australia
# locale.setlocale(locale.LC_ALL, 'en_GB.UTF-8')      # Great Britain
# locale.setlocale(locale.LC_ALL, 'en_US.UTF-8')      # USA
# locale.setlocale(locale.LC_ALL, 'fr_FR.UTF-8')      # France
# locale.setlocale(locale.LC_ALL, 'de_DE.UTF-8')      # Deuchland
# locale.setlocale(locale.LC_ALL, 'es_ES.UTF-8')      # Espaniol
locale.setlocale(locale.LC_ALL, 'it_IT.UTF-8')      # Italiano

# Define "Week" and "Notes" words, being used in the Weekly Planner
Week_locale = 'Settimana'
HowGo_locale = "Com'è andata?"
Notes_locale = 'Note'
Week_Goals_locale = 'Obiettivi settimanali'
Physical_Activity_locale = 'Esercizio'

# What events should be built in to the calendar?
# Pass in the year, month, day, event name, and True if the day is a holiday
# and should be greyed out on the calendar
events.add_event(year, 1, 1, "Anno nuovo", True)
events.add_event(year + 1, 1, 1, "Anno nuovo", True)
events.add_event(year, 1, 6, "Epifania", True)
events.add_event(year, 4, 15, "Venerdì Santo", True)
events.add_event(year, 4, 18, "Pasquetta", True)
events.add_event(year, 4, 25, "Festa della Liberazione", True)
events.add_event(year, 5, 1, "Festa dei Lavoratori", True)
events.add_event(year, 6, 2, "Festa della Repubblica", True)
events.add_event(year, 8, 28, "Coccolini <3", True)
events.add_event(year, 11, 1, "Ognissanti", True)
events.add_event(year, 12, 8, "Immacolata", True)
events.add_event(year, 12, 24, "Vigilia di Natale", False)
events.add_event(year, 12, 25, "Natale", True)
events.add_event(year, 12, 26, "S. Stefano", True)
