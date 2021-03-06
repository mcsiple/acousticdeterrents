# Constant values

propagation <- 15

# hearing groups table - constant values
hearing_group <- c("Low-frequency cetaceans",
                   "Mid-frequency cetaceans",
                   "High-frequency cetaceans",
                   "Phocids",
                   "Otariids")

hgkey <- c(`Low-frequency cetaceans` = "Low-frequency cetaceans: baleen whales",
           `Mid-frequency cetaceans` = "Mid-frequency cetaceans: dolphins, toothed whales, and beaked whales",
           `High-frequency cetaceans` = "High-frequency cetaceans: harbor and Dall's porpoise, and pygmy and dwarf sperm whales",
           Phocids = "Phocids: true seals",
           Otariids = "Otariids: sea lions and fur seals")

groups <- data.frame(
  hearing_group = hearing_group, 
  SELcum = c(199,198,173,201,219))

weighting <- data.frame(stringsAsFactors = FALSE,
                        hearing_group = hearing_group,
                        a = c(1, 1.6, 1.8, 1,2),
                        b = c(2, 2, 2, 2,2),
                        f1 = c(0.2, 8.8, 12, 1.9,0.94),
                        f2 = c(19, 110, 140, 30, 25),
                        C = c(0.13, 1.2, 1.36, 0.75,0.64))

m <- dplyr::full_join(weighting,groups)


# Notes for tooltips ------------------------------------------------------
frequency.note <- "Note: 1000 Hz = 1 kHz (e.g., 400 Hz = 0.4 kHz)"
loudness.note <- "Note: If the device is non-programmable and capable of producing multiple source levels, the loudness must be entered"
duration.note <- "Note: 1000 milliseconds = 1 second (e.g., 100 milleseconds = 0.1 second)"
duty.cycle.note <- "The duty cycle is the on/off cycle time or proportion of time that the signal is active"
criteria.note <- "<b>Evaluation criteria:</b> Whether acoustic deterrents would result in a permanent threshold shift (PTS) &ge; 100 m from the source with an hour exposure duration. Thus, when the distance column is <100 m for all marine mammal hearing groups, the deterrent would meets NMFS's evaluation criteria."
approve.note <- "<b>Your device meets NMFS's evaluation criteria</b>. Click below to download a certificate."
notapprove.note <- "<b>The device as specified does not meet NMFS' evaluation criteria</b>.  To obtain a certificate, try changing the device specifications"
notapproveESA.note <- "<b>NOTE:</b> This certificate <b>does not apply</b> for the Cook Inlet beluga distinct population segment (DPS) or the Main Hawaiian Islands insular false killer whale DPS because non-impulsive acoustic deterrents are not included as specific measures for these ESA-listed marine mammals."

# Long text for intro etc -------------------------------------------------
preintro.text <- "Welcome to the acoustic deterrents web tool! The Marine Mammal Protection Act of 1972 (MMPA) and the Endangered Species Act of 1973 (ESA) prohibit the “taking” of marine mammals; however, there are limited exceptions to the prohibitions under certain circumstances. Section 101(a)(4)(A) of the MMPA allows “specified persons” (e.g., the owner of fishing gear or catch, the owner of private property, or an employee or agent of such owner) to use measures that deter marine mammals from damaging fishing gear, catch, personal or public property, or endangering personal safety, as long as those measures do not result in death or serious injury of marine mammals.  NOAA Fisheries has developed guidelines and recommended specific measures for specified persons to safely deter marine mammals. Deterring marine mammals consistent with these guidelines or specific measures would not be a violation of the MMPA.  For more information on safely deterring marine mammals, click here." #
intro.text <- "You may use this tool to determine whether your device meets the evaluation criteria under NMFS’s Guidelines for Non-lethally Deterring Marine Mammals. This tool is for non-impulsive devices (e.g., acoustic alarms, pingers, transducers, predator sounds/alarm vocalizations using an underwater speaker) with an underwater source level &ge;170 dB (RMS, root-mean-square sound pressure level). Simply enter the device specifications in the appropriate calculator: single frequency or multiple frequencies. If you cannot determine the specifications of the device, contact the manufacturer. You must enter all required information in the calculator to determine whether your device meets NMFS evaluation for deterring marine mammals. If the device, as you intend to use it, meets NMFS’s evaluation criteria, you will receive a certificate of approval. You will need to print or save a copy of this certificate and furnish upon request. The device must be used according to the specifications listed on the certificate. Certificates are valid for one year from the date of issue."     


# Species list ------------------------------------------------------------
x <-data.frame(
  stringsAsFactors = FALSE,
  seals.sealions = c("Steller sea lion","California sea lion",
                     "Northern (Pribilof) fur seal","Harbor seal","Spotted seal",
                     "Ringed seal","Ribbon seal","Gray seal",
                     "Hawaiian monk seal","Northern elephant seal","Bearded seal",
                     "Harp seal","Hooded seal"),
  dolphins.porpoises = c("Atlantic white-sided dolphin","Pacific white-sided dolphin",
                         "Common dolphin","Bottlenose dolphin",
                         "Grampus (Risso's) dolphin","Spotted dolphin","Spinner dolphin",
                         "Striped dolphin","Northern right whale dolphin",
                         "Harbor porpoise","Dall's porpoise",
                         "Rough-toothed dolphin",NA),
  toothed.baleen = c("North Atlantic right whale","Gray whale","Fin whale","Minke whale",
                     "Humpback whale","Sperm whale","Beluga whale",
                     "False killer whale","Killer whale","Pilot whale",
                     "Beaked whale","Bryde's whale",
                     "Dwarf sperm whale")
)
# from spreadsheet, which is copied from mortality/ijury reporting form


seals.sealions <- x$seals.sealions[complete.cases(x$seals.sealions)]
dolphins.porpoises <- x$dolphins.porpoises[complete.cases(x$dolphins.porpoises)]
toothed.baleen <- x$toothed.baleen[complete.cases(x$toothed.baleen)]


# Kable table options -----------------------------------------------------
# Turn NA cells into blank cells in table (for default values)
opts <- options(knitr.kable.NA = "")
