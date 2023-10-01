## 📝 Table of Contents
* [About](#about)
* [Summarization with Chain of Density (CoD) technique](#cod)
  * [Scientific text](#scientific_text)
  * [Social court ruling](#social_court_text)
* [Summarization with clustering technique](#clustering)
 * [Social court ruling](#social_court_text_2)
* [Reference to guidance on good summaries](#guidance)
  
# About <a name="about"></a>
To be written.

# Summarization with Chain of Density (CoD) technique <a name="cod"></a>

## Scientific text <a name="scientific_text"></a>
**Summarization target:** Adams et al (2023), From sparse to dense: GPT-4 Summarization with Chain of Density Prompting, https://arxiv.org/pdf/2309.04269.pdf

**Result using GPT-4-32k via Poe.com**
![grafik](https://github.com/LilianDK/summarization/assets/13328959/47c31130-04e1-4ddd-8e4e-9bb72a679af1)

Remarks:
- Inconsistent usage of citation in iteration 3 (Fabbri et al 2021, Liu et al 2023b), iteration 4 (Goyal et al 2022, Bhaskar et al 2023, Pu and Demberg, 2023), and iteration 5 (Goyal et al 2022, Narayan et al 2021, Stiennon et al 2020)
- Last sentence and the meaning regarding the open-source part is factually wrong in all iterations except iteration 3

**Result using GPT-4-0613 via OpenAI Playground**
![grafik](https://github.com/LilianDK/summarization/assets/13328959/ae5f79d3-cc63-4d87-a07f-6858c75c404a)

The 32k version is not available on the Open AI Playground on the time of testing 01.10.23.

Remarks:
- Seems to be very close to the abstract in the summarization target (see above) =D!
- Second half of the first sentence in iteration 4 and iteration 5 arguably discussable
- The "guidance by human preference data" part in iterations 2 and following is misleading
- Regardless of the 32k version. What needs to be done, if the context window is exceeded? 

**Result using Claude-2-100k via Poe.com**
![grafik](https://github.com/LilianDK/summarization/assets/13328959/f492103c-13a7-4ce7-aadf-83a094e2fec4)

## Social court ruling <a name="social_court_text"></a>
**Summarization target:** Bundessozialgericht (30.03.2023), B 2 U 1/21 R, https://www.bsg.bund.de/SharedDocs/Entscheidungen/DE/2023/2023_03_30_B_02_U_01_21_R.html

**Result using GPT-4-0613 via OpenAI Playground**
![grafik](https://github.com/LilianDK/summarization/assets/13328959/8876617b-6f4c-4762-966b-62cdff1f09af)

The 32k version is not available on the Open AI Playground on the time of testing 01.10.23.

Remarks:
- Since the input text is larger than the maximum input allowed (8.191 Tokens) the input text has to be reduced and only the first part was submitted

# Summarization with clustering technique <a name="cluster"></a>

## Social court ruling <a name="social_court_text_2"></a>

**Summarization target:** Bundessozialgericht (30.03.2023), B 2 U 1/21 R, https://www.bsg.bund.de/SharedDocs/Entscheidungen/DE/2023/2023_03_30_B_02_U_01_21_R.html

**Result using Aleph Alpha Luminous and proposed processing of XXX**

The complete text was used in this proceedure and therefore more content was submitted as to abovementioned example. The underlying situation is a clerk who has to process insurance cases and need to look up certain rulings on that. Therefore, the summary might be more targeted regarding particular concepts.

I want to know the background or "what happened?" from the text:
<img width="1273" alt="grafik" src="https://github.com/LilianDK/summarization/assets/13328959/7ed4d156-906c-4e5a-a85b-e3ccd5e21b9b">
<img width="1273" alt="grafik" src="https://github.com/LilianDK/summarization/assets/13328959/8d08e8d4-a617-4803-82db-a437463e9cd9">
```
git clone https://github.com/LilianDK/llm-playground.git
```
I also want to know what the impact is or "so what?" from the text:
<img width="1273" alt="grafik" src="https://github.com/LilianDK/summarization/assets/13328959/fd7f0b03-bbed-491e-8172-2be937f4716e">
![grafik](https://github.com/LilianDK/summarization/assets/13328959/edb2e335-a730-4731-aefb-cab5b1f15d4d)

```
Die Klage ist begründet.

Was wird entschieden? Die Klägerin hat einen Anspruch auf Erstattung der Leistungen der gesetzlichen Krankenversicherung.
Aus welchem Grund? Die Beklagte ist zur Erstattung der gesamten Kosten verpflichtet, da die Klägerin keinen Anspruch auf Leistungen aus der gesetzlichen Krankenversicherung hat, weil die Krankenbehandlung sowie das Krankengeld als Folge eines Arbeitsunfalls zu erbringen sind. Die Ablehnung von Sozialleistungen durch die Beklagte gegenüber der Beigeladenen im Sozialleistungsverhältnis steht dem nicht entgegen. Die Rechtsgrundlage für den Erstattungsanspruch ist § 105 Abs. 1 SGB X.

Gemäß § 105 Abs. 1 SGB X ist der zuständige oder zuständig gewesene Leistungsträger dem anfänglich unzuständigen Leistungsträger erstattungspflichtig, der Sozialleistungen erbracht hat. 
```

# Reference to guidance on good summaries <a name="guidance"></a>

**Example 1**
![grafik](https://github.com/LilianDK/summarization/assets/13328959/45669c3d-dec0-4ccc-bef7-2cf422633560)
Source: https://www.emerald.com/insight/content/doi/10.1108/INTR-08-2021-0600/full/html

**Example 2**
<img width="793" alt="grafik" src="https://github.com/LilianDK/summarization/assets/13328959/67099209-62ff-4231-ad1b-c293cb542838">
Source: https://humanfactors.jmir.org/author-information/instructions-for-authors

**Example 3**
![grafik](https://github.com/LilianDK/summarization/assets/13328959/f39f4b06-5dc0-4287-92ef-83a11b399f30)
Source: https://www.elsevier.com/journals/international-journal-of-information-management/0268-4012/guide-for-authors
