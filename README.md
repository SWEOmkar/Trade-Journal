# Trade Journal (Supabase)

Static single-file app: `index.html`. Data and login are handled by Supabase.

## Setup
1. Supabase > SQL Editor: run `schema.sql`.
2. Supabase > Project Settings > API: copy the Project URL and the `anon` (publishable) key.
   Never use the `service_role` key in this app.
3. Open `index.html`, paste both values into SUPABASE_URL and SUPABASE_ANON_KEY (top of the script).
4. Supabase > Authentication > Providers > Email: for easy personal use turn OFF "Confirm email",
   or keep it on and confirm via the email link.
5. Deploy the folder to any static host (Netlify, Vercel, Cloudflare Pages, GitHub Pages).
6. Supabase > Authentication > URL Configuration: set Site URL to your deployed URL
   (needed for confirmation emails).
7. Open the site, sign up once, then in Authentication > Sign In / Providers turn OFF
   "Allow new users to sign up" so nobody else can create an account.

Security comes from Row Level Security in schema.sql, not from hiding the anon key.
