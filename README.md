## 📝 Table of Contents
* [About](#about)
* [Summarization with Chain of Density (CoD) technique](#cod)
  * [Scientific text](#scientific_text)
  * [Social court ruling](#social_court_text)
* [Summarization with clustering technique ](#clustering)
 * [Social court ruling](#social_court_text_2)

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

The complete text was used in this proceedure and therefore more content was submitted as to abovementioned example.

I want to know the background
<img width="1273" alt="grafik" src="https://github.com/LilianDK/summarization/assets/13328959/7ed4d156-906c-4e5a-a85b-e3ccd5e21b9b">
<img width="1273" alt="grafik" src="https://github.com/LilianDK/summarization/assets/13328959/8d08e8d4-a617-4803-82db-a437463e9cd9">

<img width="1273" alt="grafik" src="https://github.com/LilianDK/summarization/assets/13328959/fd7f0b03-bbed-491e-8172-2be937f4716e">

# Reference to guidance on good summaries <a name="guidance"></a>


![grafik](https://github.com/LilianDK/summarization/assets/13328959/45669c3d-dec0-4ccc-bef7-2cf422633560)
Source: https://www.emerald.com/insight/content/doi/10.1108/INTR-08-2021-0600/full/html

