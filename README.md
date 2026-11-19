# Ground Up Cafe: Multi-Agent Customer Assistant

A practice project I built after an AI automation workshop. It is an AI assistant for a fictional cafe that answers customer messages using a router and four specialist agents.

**Status:** working prototype, still in progress.

## Status and hosting
The workflow runs on n8n Cloud (free trial), so the live demo may be offline when the trial ends. The screenshots below show successful runs for each agent. A live demo is available on request.

## How it works
1. A customer sends a message from a web page (`index.html`) and picks a channel (WhatsApp, email, Instagram, calls or reviews).
2. An n8n webhook receives the message.
3. The workflow loads the cafe facts (menu, timings, rules) from a Supabase table and combines them into one item.
4. A router (Text Classifier) decides what the message is about.
5. A specialist agent powered by Google Gemini replies in clear, polite English:
   - **Riya:** general questions (menu, prices, timings, Jain and vegan options, payments)
   - **Arjun:** table bookings
   - **Ira:** workshops and events
   - **Meera:** bulk orders
6. The reply goes back to the web page.

Every agent is told to use only the cafe facts. If something is not in the facts, it says it will check with the team instead of guessing.

**Built with:** n8n, Supabase, Google Gemini, HTML and JavaScript.

## Screenshots
**Workflow canvas**

<img width="1366" height="768" alt="Canvas" src="https://github.com/user-attachments/assets/1bc809bf-1c74-4204-9e3b-63e38987d582" />


**Successful runs, one for each agent**

<img width="1366" height="768" alt="execution-riya png" src="https://github.com/user-attachments/assets/30088d95-9c14-41a1-a674-9fb8133edf59" />

<img width="1366" height="768" alt="execution-arjun png" src="https://github.com/user-attachments/assets/54306617-647e-4a1d-8b1f-2fb3959cb03d" />

<img width="1366" height="768" alt="execution-ira png" src="https://github.com/user-attachments/assets/92273912-8378-48fb-b910-37c062e9f7f1" />

<img width="1366" height="768" alt="execution-meera png" src="https://github.com/user-attachments/assets/6b071509-b8f2-46e6-9039-1590b4701b1f" />


## Files in this repo
| File | What it is |
|---|---|
| `index.html` | The customer message page |
| `workflow.json` | The n8n workflow (import it into n8n) |
| `supabase.sql` | Creates and fills the `cafe_facts` table with sample facts |
| `screenshots` | Pictures of the workflow and successful runs |

## What I learned
- An agent only answers as well as the facts it is given, so the cafe facts live in a database and are loaded on every message.
- n8n has a Test URL and a Production URL. The Test URL only works while the editor is listening, so a live page must use the Production URL and the workflow must be published.
- Free-tier model rate limits can cause errors, so I switched to a lighter model and turned on retries.
- A generic error on the page can hide the real cause, so I use the Executions tab in n8n to find which node failed.

## Setup
1. Create a free Supabase project and run `supabase.sql` in the SQL Editor.
2. Import `workflow.json` into n8n.
3. Add your own Supabase and Google Gemini credentials in n8n.
4. Set the Webhook path to `ground-up-cafe` and allow all origins (CORS) for the demo.
5. Publish the workflow and copy its **Production** webhook URL.
6. Paste that URL into `index.html` where it says `PASTE_YOUR_WEBHOOK_URL_HERE`.
7. Open `index.html` in a browser and send a message.

## Known issues
- Gemini free-tier rate limits can cause errors when messages are sent quickly.
- The assistant has no conversation memory yet, so each message is handled on its own.
- Bookings and events are not saved anywhere yet. The agents collect the details and say the team will confirm.

## Next steps
- Save bookings and event requests to Supabase
- Add conversation memory
- Connect real channels such as WhatsApp and email
- Add an owner dashboard to view messages and replies
