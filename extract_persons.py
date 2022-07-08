from scrappers.ohiggins_elcachapoal import textos as t
import spacy
nlp = spacy.load("es_core_news_md")
dic = {}


for i,texto in enumerate(t):
    doc = nlp(texto)
    dic[f"t{i+1}"] = []
    for ent in doc.ents:
        if ((ent.label_ == "PER") and (" " in ent.text) and (" de " not in ent.text) and (ent.text not in dic[f"t{i+1}"])):
            # print(ent.text, ent.label_)
            dic[f"t{i+1}"].append(ent.text)

if(__name__ == "__main__"): print(dic)