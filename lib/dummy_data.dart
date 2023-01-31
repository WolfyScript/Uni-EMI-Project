import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uni_emi_muell_guard/catalog_article.dart';
import 'package:uni_emi_muell_guard/event.dart';
import 'package:uni_emi_muell_guard/news_article.dart';
import 'package:uni_emi_muell_guard/utils.dart';

final events = LinkedHashMap<DateTime, List<Event>>(
  equals: (e0, e1) {
    return isSameDay(e0, e1);
  },
  hashCode: (key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  },
)..addAll({
    DateTime.utc(2023, 1, 30): [Event(BaseEventType.paper.id)],
    DateTime.utc(2023, 2, 7): [Event(BaseEventType.organicWaste.id), Event(BaseEventType.residualWaste.id)],
    DateTime.utc(2023, 2, 16): [Event(BaseEventType.yellowBag.id)],
    DateTime.utc(2023, 2, 20): [Event(BaseEventType.bulkyWaste.id)],
    DateTime.utc(2023, 2, 23): [Event(BaseEventType.residualWaste.id)],
  });

final catalogArticles = [
  CatalogArticle(
    title: "Müll richtig trennen. So gehts!",
    image: Image.asset('assets/abfallsortierung.jpg', fit: BoxFit.cover),
    summary:
        "**Hier erfahren Sie, wie Verpackungen richtig getrennt werden und was unbedingt als Sondermüll entsorgt werden muss.**",
    content: """
Ob graue Tonne, gelber Sack oder Wertstofftonne, Glascontainer oder Komposthaufen - Abfalltrennen gehört längst zum Haushaltsalltag.   
Doch die bunte Tonnenvielfalt macht das Trennen nicht unbedingt leichter und beim Sortieren kommen immer wieder Fragen auf: Dürfen Joghurtbecher nur sauber gespült in die Wertstoffsammlung wandern?    
Können Flaschen samt Deckel im Altglascontainer landen? Sollen auch Verpackungen ohne grünen Punkt in den gelben Sack?   
Kann ich die Bioplastiktüte kompostieren? Wir geben Antworten.  

# Gelber Sack / Gelbe Tonne

(Haben Sie eine Wertstofftonne, lesen Sie bitte den nächsten Block)  
Hier hinein gehören Verpackungen aus Kunststoff, Weißblech und Aluminium - beispielsweise Folien, Tuben, Konservendosen oder Plastiktüten - sowie die so genannten Verbundverpackungen (etwa Getränkekartons).  
Seit 2009 ist es nicht mehr ausschlaggebend, ob der Grüne Punkt auf den Verpackungen ist oder nicht. Denn alle Hersteller müssen sich einem dualen System angeschlossen haben, das die gebrauchten Verpackungen dem Recycling zuführt.  
Inzwischen konkurrieren diverse duale Systeme, die mit unterschiedlichen Kennzeichen arbeiten.  

Also: Selbst wenn auf der Hülle künftig kein Zeichen mehr prangt, sollten Verbraucher ihren Verpackungsmüll immer über die "gelbe Tonne" oder den "gelben Sack" entsorgen.  
Leere Verpackungen müssen nicht gespült werden, löffelrein reicht aus. Zu den Verpackungen zählen auch die so genannten Serviceverpackungen, die direkt im Handel befüllt werden.
Darunter fallen Coffee to go-Becher, die Boxen für das take-away-Essen, Folien und Einwickelpapier aus der Metzgerei oder vom Käsestand.  

#### Achtung: 
**Sind die Verpackungen stark mit Essenresten verschmutzt, dann bitte über die Restmülltonne entsorgen.**  

Verpackungen aus Papier oder Glas werden über Papiertonnen/-container oder Glascontainer gesammelt, siehe weiter unten.  
Seit dem 1.1.2019 gilt das Verpackungsgesetz.  
Es soll dazu beitragen, dass mehr Verpackungen - insbesondere aus Kunststoff - recycelt werden und Hersteller Verpackungen produzieren, die tatsächlich verwertbar sind.  
Ob so weniger Verpackungsmüll anfällt und Verbraucher dadurch finanziell entlastet werden, bleibt abzuwarten.  
    
# Werkstofftonne statt gelber Sack / gelber Tonne
    
...  

#### Source:   
https://www.verbraucherzentrale.de/wissen/umwelt-haushalt/abfall/muell-richtig-trennen-gelber-sack-restmuell-papier-oder-wohin-sonst-10580
""",
    creationDate: DateTime.utc(2023, 1, 19),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "Altbatterien & Akkus",
    image: Image.asset('assets/batteries.webp', fit: BoxFit.cover),
    summary:
        "**Von der Knopfzelle über Geräteakkus bis hin zur Autobatterie - bei all diesen mobilen Energiespendern heißt die oberste Nutzerpflicht: \"Nach Gebrauch zurück\".**",
    content: """
Damit ausgediente Akkus und Batterien nicht achtlos in der Mülltonne landen, sind Handel und Kommunen zur kostenlosen Rücknahme verpflichtet: 
Von der Knopfzelle über Geräteakkus bis hin zur Autobatterie - bei all diesen mobilen Energiespendern heißt die oberste Nutzerpflicht: "Nach Gebrauch zurück".  

Tipps zur richtigen Entsorgung
* Alle ausgepowerten Batterien und Akkus müssen im Handel zurückgegeben werden.  
  Kommunen können freiwillig zusätzliche Sammelstellen anbieten. Der Hausmüll ist für die schadstoffhaltigen Energiespender tabu.
* Knopfzelle, Akku und Co. aller Marken können kostenlos zurückgegeben werden - auch dann, wenn keine neuen Energiezellen gekauft werden. Händler müssen jedoch nur die Typen zurücknehmen, die sie auch im Sortiment führen oder geführt haben.
* Wer Starterbatterien aus dem Auto zurückgibt, braucht das Portemonnaie ebenfalls nicht zu zücken, denn auch deren Rücknahme ist kostenlos. Wird beim Kauf einer neuen Batterie jedoch keine alte abgegeben, muss der Händler 7,50 Euro Pfand verlangen - und darf diesen erst wieder auszahlen, wenn das ausgediente Kraftpaket abgeliefert wird.
* Geräte mit fest eingebauten Batterien oder Akkus gehören zum Elektroschrott und können bei den kommunalen Sammelstellen, in großen Elektromärkten und im Onlinehandel kostenlos zurückgegeben werden.
* Verbrauchte Akkus von Pedelecs oder Akkuwerkzeugen nimmt ebenfalls der Fachhandel an. Wichtig ist es, die Kontaktstellen der Akkus abzukleben, damit während der weiteren Behandlung kein Schaden entsteht.
* Und Achtung: Selbst die mit "0 % Hg, 0 % Cd" gekennzeichneten Batterien sind keineswegs schadstofffrei. In ihnen können ätzende, wasser- oder umweltgefährdende Stoffe wie zum Beispiel Mangandioxid; Kalilauge oder Schwefelsäure stecken.

#### Source:
https://www.verbraucherzentrale.de/wissen/umwelt-haushalt/abfall/schadstoffe-im-haushalt-kleine-menge-grosse-wirkung-13929#altbatterien-akkus
""",
    creationDate: DateTime.utc(2022, 6, 17),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "Schadstoffe",
    image: Image.asset('assets/test-image.jpg', fit: BoxFit.cover),
    summary: "**Sondermüll wie Altöl, Renovierungsabfälle, Leuchtstoffröhren oder Batterien gehören nicht in den Hausmüll. Sie müssen separat entsorgt werden.**",
    content: """
#### Das Wichtigste in Kürze:
* Sondermüll wie Altöl, Renovierungsabfälle, Leuchtstoffröhren oder Batterien gehören nicht in den Hausmüll. Sie müssen separat entsorgt werden.
* Giftige Abfälle können entweder am Schadstoffmobil des Entsorgers oder an einem der Recyclinghöfe abgegeben werden. Die Öffnungszeiten und Stationen des Schadstoffmobils erfahren Sie im Abfallkalender oder der Homepage ihres Entsorgers.
* Auch einige Händler nehmen Schadstoffe an, wenn sie damit Handeln. So kann Altöl da abgegeben werden, wo man neues kauft.
* Mischen Sie flüssige Abfälle niemals und bewahren sie sie am besten im Originalbehälter auf.

In vielen Haushaltsprodukten schlummern gefährliche Schadstoffe. Die Mengen sind verhältnismäßig klein, doch ihre schädliche Wirkung auf die Umwelt ist groß.   
Schwermetalle, Altöl oder giftige Chemikalien, die über den Hausmüll in die Umwelt gelangen, können Pflanzen und Tiere schädigen und sich in der Nahrungskette anreichern.  

Produkte mit schädlichen Inhaltsstoffen können Verbraucher oft an besonderen Warnhinweisen auf der Verpackung erkennen. So steht das Symbol "Toter Baum und Fisch" für umweltgefährdende Stoffe, ein "Totenkopf" auf der Verpackung weist auf Giftigkeit hin, eine durchgestrichene Mülltonne auf Altbatterien auf Schwermetalle.  
Solche Produkte müssen separat über Sondermüllannahmestellen entsorgt oder an den Handel zurückgegeben werden.  

Wir haben einige solcher problematischer Produkte aufgelistet und geben dazu die passenden Entsorgungstipps.  

# Altbatterien und Akkus
Damit ausgediente Akkus und Batterien nicht achtlos in der Mülltonne landen, sind Handel und Kommunen zur kostenlosen Rücknahme verpflichtet: 
Von der Knopfzelle über Geräteakkus bis hin zur Autobatterie - bei all diesen mobilen Energiespendern heißt die oberste Nutzerpflicht: "Nach Gebrauch zurück".  

Tipps zur richtigen Entsorgung
* Alle ausgepowerten Batterien und Akkus müssen im Handel zurückgegeben werden.  
  Kommunen können freiwillig zusätzliche Sammelstellen anbieten. Der Hausmüll ist für die schadstoffhaltigen Energiespender tabu.
* Knopfzelle, Akku und Co. aller Marken können kostenlos zurückgegeben werden - auch dann, wenn keine neuen Energiezellen gekauft werden. Händler müssen jedoch nur die Typen zurücknehmen, die sie auch im Sortiment führen oder geführt haben.
* Wer Starterbatterien aus dem Auto zurückgibt, braucht das Portemonnaie ebenfalls nicht zu zücken, denn auch deren Rücknahme ist kostenlos. Wird beim Kauf einer neuen Batterie jedoch keine alte abgegeben, muss der Händler 7,50 Euro Pfand verlangen - und darf diesen erst wieder auszahlen, wenn das ausgediente Kraftpaket abgeliefert wird.
* Geräte mit fest eingebauten Batterien oder Akkus gehören zum Elektroschrott und können bei den kommunalen Sammelstellen, in großen Elektromärkten und im Onlinehandel kostenlos zurückgegeben werden.
* Verbrauchte Akkus von Pedelecs oder Akkuwerkzeugen nimmt ebenfalls der Fachhandel an. Wichtig ist es, die Kontaktstellen der Akkus abzukleben, damit während der weiteren Behandlung kein Schaden entsteht.
* Und Achtung: Selbst die mit "0 % Hg, 0 % Cd" gekennzeichneten Batterien sind keineswegs schadstofffrei. In ihnen können ätzende, wasser- oder umweltgefährdende Stoffe wie zum Beispiel Mangandioxid; Kalilauge oder Schwefelsäure stecken.

# Altmedikamente
Immer mehr Rückstände von Medikamenten tauchen in Gewässern auf. Denn die Kläranlagen, die das Abwasser reinigen, sind keine Alleskönner. Ein sparsamerer Umgang mit Medikamenten entlastet deshalb nicht nur das eigene Budget, sondern auch Bäche, Stauseen und Flüsse. Von der Zurückhaltung profitiert das Konto erneut - weil andernfalls zunehmend kostspieligere Aufbereitungsverfahren nötig werden, um Grund- oder Flusswasser in den Wasserwerken zu reinigen und zu Trinkwasser aufzubereiten.  

#### Tipps zur richtigen Entsorgung
* Wer nur kleine Mengen an Medikamenten kauft, hat später auch kein Entsorgungsproblem.
* **In Entsorgungsgebieten, die an Müllverbrennungsanlagen (MVA) angeschlossen sind**, können abgelaufene oder nicht mehr benötigte Arzneien in die graue Restmülltonne geworfen werden. Das gilt auch für angebrochene Glas-Fläschchen. Die Wirkstoffe der Medikamente verlieren bei der Verbrennung ihre ökologische Schädlichkeit. Hingegen dürfen Arzneimittel nie über die Toilette oder das Spülbecken entsorgt werden.  
  Um Altmedikamente gegen eine missbräuchliche Verwendung zu sichern, empfiehlt es sich, sie vor dem Wurf in die Tonne in Zeitungspapier einzuwickeln.
* Wer wirklich sicher gehen will, kann seine Altmedikamente auch in Apotheken zurück geben. Viele Apotheken bieten diesen Service freiwillig an.
* **In Entsorgungsgebieten, die an eine mechanisch-biologische Abfallbehandlungsanlage (MBA) angeschlossen sind**, sollten die Altmedikamente bei der Sondermüllsammlung oder, sofern möglich, in Apotheken abgegeben werden. Leere Arzneimittel-Fläschchen gehören in den Restmüll, weil sie aus anderem Glas sind als herkömmliche Flaschen, leere Pillen-Blister-Verpackungen in den gelben Sack und leere Pappschachteln zum Altpapier.

# Altöl
...

#### Source:
https://www.verbraucherzentrale.de/wissen/umwelt-haushalt/abfall/schadstoffe-im-haushalt-kleine-menge-grosse-wirkung-13929
""",
    creationDate: DateTime.utc(2023, 2, 12),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "",
    image: Image.asset('assets/test-image.jpg', fit: BoxFit.cover),
    summary: "",
    content: "",
    creationDate: DateTime.utc(2023, 2, 16),
    readTime: const Duration(minutes: 8),
  ),
  CatalogArticle(
    title: "",
    image: Image.asset('assets/test-image.jpg', fit: BoxFit.cover),
    summary: "",
    content: "",
    creationDate: DateTime.utc(2023, 2, 19),
    readTime: const Duration(minutes: 8),
  ),
];

final newsArticles = [
  NewsArticle(
    title: "Hamburg Räumt Auf!",
    image: Image.asset(
      'assets/hamburg_raeumt_auf.png',
      fit: BoxFit.cover,
    ),
    summary:
        "Seid auch dieses Jahr wieder bei Hamburgs größter Saubermachaktion dabei!",
    content: "",
    creationDate: DateTime.utc(2023, 2, 1),
    readTime: const Duration(minutes: 8),
  ),
  NewsArticle(
    title: "Flohmarkt in Eidelstedt",
    image: Image.asset(
      'assets/flohmarkt_eidelstedt.jpg',
      fit: BoxFit.cover,
    ),
    summary: """Nächste Woche gibt es wieder ein Flohmarkt in Eidelsteht. 
    """,
    content: "",
    creationDate: DateTime.utc(2023, 2, 2),
    readTime: const Duration(minutes: 8),
  ),
  NewsArticle(
    title: "",
    image: Image.asset(
      'assets/test-image.jpg',
      fit: BoxFit.cover,
    ),
    summary: "",
    content: "",
    creationDate: DateTime.utc(2023, 2, 4),
    readTime: const Duration(minutes: 8),
  ),
];
